# WebTransport as Zone Transport

## The Context

Zone servers need a transport layer that works in browsers without a plugin, supports unreliable datagrams for position updates, and does not require a trusted certificate authority. The existing ENet transport satisfies none of these. WebTransport over QUIC/HTTP3 satisfies all three.

## The Problem Statement

ENet is reliable and battle-tested, but it runs over UDP without any browser runtime support, and the Godot engine has no first-class WebTransport integration. Proposal #3899 in the upstream engine repository has been open for years without a merge. No shipped Godot title uses WebTransport as its primary transport.

## Design

`WebTransportPeer` in `modules/http3/` wraps a QUIC connection as a Godot `MultiplayerPeer`. The connection progresses through six states: `SESSION_DISCONNECTED`, `SESSION_QUIC_HANDSHAKING`, `SESSION_H3_SETTINGS`, `SESSION_WT_CONNECTING`, `SESSION_OPEN`, and `SESSION_CLOSED`. A client calls `create_client(host, port, path)`, which dials the server with the `webtransport` ALPN token. A server calls `create_server(port, path, cert, key)` with a self-signed X.509 certificate.

Packet delivery mode maps directly to QUIC primitives. `TRANSFER_MODE_UNRELIABLE` and `TRANSFER_MODE_UNRELIABLE_ORDERED` use QUIC DATAGRAMs. `TRANSFER_MODE_RELIABLE` opens a per-packet bidirectional stream, writes the payload with a FIN, and drains the response.

Certificate pinning replaces the CA chain. The zone server's self-signed TLS certificate SHA-256 fingerprint is stored in the `cert_hash` field of the zone registry record. Clients retrieve `cert_hash` from `GET /shards` before dialing and pin it when opening the QUIC connection. No certificate authority is required.

The zone server listens on UDP port 443 in the reference deployment (`multiplayer-fabric-hosting/docker-compose.yml`). Cloudflare DNS proxying must be disabled for zone server hostnames — QUIC/UDP cannot be proxied through Cloudflare's network.

## The Benefits

Browser clients can connect without a plugin. Unreliable datagrams reduce head-of-line blocking for position updates. Self-signed certificates with client-side pinning remove the CA dependency for self-hosted deployments.

## The Downsides

All three major browsers now ship WebTransport: Chrome since v97, Firefox since v114 (June 2023) @firefox114webtransport, and Safari since 26.4 (March 2026) @mdn_webtransport_baseline. Safari 26.4 is very recent; users on older Safari versions will not be able to connect. The `cert_hash` must be provisioned before the first client connects, which requires a manual step in the current deployment.

### References

```bibtex
@misc{firefox114webtransport,
  title        = {Firefox 114 Available With {WebTransport} Enabled},
  author       = {Larabel, Michael},
  year         = {2023},
  month        = jun,
  howpublished = {\url{https://www.phoronix.com/news/Mozilla-Firefox-114}},
  note         = {WebTransport enabled by default in Firefox 114, released 2023-06-06}
}

@misc{mdn_webtransport_baseline,
  title        = {{WebTransport} -- {Web} {API}s},
  author       = {{MDN Contributors}},
  year         = {2026},
  howpublished = {\url{https://developer.mozilla.org/en-US/docs/Web/API/WebTransport}},
  note         = {Baseline 2026: newly available across Chrome, Firefox, and Safari since March 2026}
}
```

## The Road Not Taken

ENet over raw UDP is the existing fallback. It works for native clients but has no browser path and no QUIC datagram primitive. A WebSocket-based transport would work in all browsers but lacks unreliable delivery and has higher per-message overhead.

## The Infrequent Use Case

A zone deployment behind a NAT that cannot receive inbound UDP will not work with WebTransport. ENet remains available for those cases.

## In Core and Done by Us

`WebTransportPeer` lives in `modules/http3/` in `multiplayer-fabric-godot`. The zone server image is built and published by `multiplayer-fabric-deploy`.

## Status

Status: Accepted

## Decision Makers

- iFire

## Tags

- WebTransport, QUIC, Transport, Zone, CertPin, HTTP3, 20260421-webtransport-zone-transport

## Further Reading

1. `modules/http3/web_transport_peer.h` — connection state machine and API
2. `modules/http3/web_transport_peer.cpp` — QUIC handshake and packet routing
3. `multiplayer-fabric-hosting/docker-compose.yml` — zone-server service definition
