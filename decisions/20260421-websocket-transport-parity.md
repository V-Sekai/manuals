# WebSocket Transport Parity Under Load

## The Context

`FabricMMOGTransportPeer` connects via WebTransport (QUIC) first and transitions to `STATE_TRYING_WS` if WebTransport is unavailable. Over WebSocket (TCP), `CH_INTEREST` and `CH_PLAYER` lose their unreliable semantics: stale entity snapshots queue rather than being discarded. The `frame_channels = true` mode is required over WebSocket to multiplex logical channels over a single TCP stream. Desktop clients and iOS Safari clients use this path.

## The Problem Statement

The back-pressure behaviour of the WebSocket path under network congestion is undocumented and untested at simulation scale. Queued stale snapshots consume bandwidth and introduce head-of-line blocking. The magnitude of the latency difference between the WT and WS paths at p95 under realistic conditions is unknown.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Define a reproducible load test:

**Environment**
- 100 simulated clients, 50 on WebTransport (control), 50 on WebSocket (test)
- Zone with 1,800 entity slots at 50% occupancy (900 active entities)
- Network condition: 20% added packet delay (uniform 50 ms), 1% packet loss (WT only; TCP masks loss)
- Tick rate: 20 Hz (default), snapshot broadcast per tick

**Metrics**

| Metric | Measurement method |
|---|---|
| Round-trip time (p50, p95, p99) | Echo packet timestamps per client |
| CH_INTEREST queue depth | Zone server counter, sampled per tick |
| Snapshot staleness | Age of the most recent applied snapshot per client |
| Session survival at 5 minutes | Count of clients still connected |

**Acceptance threshold**

WebSocket p95 round-trip ≤ 2× WebTransport p95 round-trip at steady state.

**If threshold is not met**

Implement snapshot dropping at the zone server before enqueue on TCP connections: if a newer snapshot for the same entity is already queued for a peer, discard the older one. This restores the "drop stale" semantic that QUIC datagrams provide natively.

```cpp
// In FabricMMOGZone::_broadcast_interest_snapshot()
if (_ws_peer_snapshot_queued[p_peer_id][entity_id]) {
    _dequeue_entity_snapshot(p_peer_id, entity_id); // drop stale
}
_enqueue_entity_snapshot(p_peer_id, entity_id, snapshot);
_ws_peer_snapshot_queued[p_peer_id][entity_id] = true;
```

Write results to `manuals/decisions/attachments/websocket-parity-test-results.csv`. If the threshold is met, the WS path is declared production-ready for the primary desktop audience. If not, the dropping mechanism above is merged before the WS path is promoted.

## The Benefits

The test produces a quantified answer to an open question about the primary client path. If the threshold is met, no code change is required. If not, the dropping fix is small and targeted.

## The Downsides

Simulated clients do not replicate real heterogeneous network conditions. The 2× threshold is a judgement call; a stricter threshold (1.5×) would require the dropping mechanism even if the current path performs acceptably in practice.

## The Road Not Taken

Switching the WS path to WebRTC data channels would restore unreliable semantics over UDP without requiring QUIC. WebRTC introduces ICE negotiation complexity and is not available in all WebSocket-only environments (e.g. restricted corporate networks where only TCP/443 is open). The frame_channels TCP path is more universally available.

## The Infrequent Use Case

A client on a very low-bandwidth link (mobile data, throttled) will see queue growth regardless of transport. Rate-limiting snapshot frequency per-peer (adaptive tick rate) is a separate mitigation not covered here.

## In Core and Done by Us

- Load test harness: `multiplayer-fabric-zone-console/bench/ws_parity_test.exs`
- Results file: `manuals/decisions/attachments/websocket-parity-test-results.csv`
- Conditional: snapshot dropping in `fabric_mmog_zone.cpp` if threshold not met

## Status

Status: Proposed

## Decision Makers

- iFire

## Tags

- WebSocket, WebTransport, TCP, Parity, Benchmark, CH_INTEREST, Snapshot, BackPressure, Desktop

## Further Reading

1. `20260421-webtransport-zone-transport.md` — base transport design
2. `multiplayer-fabric-godot/modules/multiplayer_fabric_mmog/fabric_mmog_transport_peer.h` — STATE_TRYING_WS
3. `multiplayer-fabric-godot/modules/multiplayer_fabric/fabric_multiplayer_peer.h` — frame_channels mode
