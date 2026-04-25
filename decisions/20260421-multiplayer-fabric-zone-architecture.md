# Multiplayer Fabric Zone Architecture

## The Context

Multiplayer Fabric is a self-hosted multiplayer framework built on top of the Godot engine. It is designed to run on hardware you control — a single machine, a small cluster, or a homelab — without requiring any hosted service.

This document describes the design of the zone layer: how clients discover servers, how entity state is managed and persisted, and how the pieces connect.

## Components

```
client (Godot)
  │  WebTransport (QUIC/UDP)
  ▼
zone server (FabricZone, headless Godot)
  │  HTTP heartbeat (PUT /shards/:id every ~25 s)
  ▼
zone-backend (Phoenix/Elixir)
  │  WebSocket (Phoenix Channel "zone:*")
  ▼
client (Godot) — receives desync index URL on join
```

### zone-backend

An Elixir/Phoenix HTTP API and WebSocket server. It keeps a registry of live zone servers.

- `POST /shards` — zone server registers on boot, receives a UUID
- `PUT /shards/:id` — heartbeat from the zone server process; touches `last_put_at` and broadcasts `zone_updated` to WebSocket subscribers with the current desync index URL
- `GET /shards` — returns zones with a `last_put_at` within the last 30 seconds
- `ZoneJanitor` GenServer culls rows where `last_put_at` is older than the staleness window; it does not use Phoenix's own heartbeat as a liveness signal
- `ZoneChannel` — clients subscribe to `zone:{id}` to receive asset delivery URLs as they become available

### zone server (FabricZone)

A headless Godot process that runs the simulation. Each zone owns a contiguous range of 30-bit Hilbert space and manages up to `ZONE_CAPACITY` entity slots (default 1,800).

Key design decisions:

- **Constant-work loop** — the physics loop iterates all `_zone_capacity` slots every tick regardless of occupancy. This makes tick time predictable and avoids per-entity allocation in the hot path.
- **Spatial partitioning** — a 3D Hilbert curve maps each entity position to a zone index. The curve and its bounds are formally specified in Lean 4 and code-generated into `predictive_bvh.h` (R128 64.64 fixed-point arithmetic, micrometer precision).
- **STAGING migration** — when an entity crosses a zone boundary, its `MigrationState` transitions `owned → staging(targetZone, arrivalHLC) → owned`; the receiving side enters `incoming(fromZone)` until the arrival HLC is reached. Timing uses `FabricLatency` (sameRegion=1 tick, crossRegion=4 ticks, satellite=40 ticks) with a floor of `latencyTicks = max (simTickHz / 10) 1`.
- **AOI band interest culling** — zones broadcast entity snapshots only to peers whose Hilbert code span overlaps the AOI band. The band width is proved to be `≤ (1 + 2·aoiCells) · hilbertSpanWidth(prefixDepth)`, independent of global zone count.

### Asset delivery (desync)

Assets are uploaded to zone-backend, baked into casync `.caibx` chunk archives, and stored via the storage backend. The `baked_url` field on a `SharedFile` record is the index URL a client or zone server uses to reassemble the asset from chunks.

`CMD_INSTANCE_ASSET` (opcode 0x04, 100-byte binary packet) instructs the authority zone to fetch the manifest, allocate an entity slot, and broadcast the instance to neighbouring zones.

A benchmark comparing casync desync, zchunk (HTTP-compatible, zstd-compressed, no custom chunk server required), and a plain CDN delta for a representative Godot export is pending. The result will determine the default delivery path.

### Permissions (ReBAC)

Upload permissions are checked via a relationship-based access control graph (`taskweft`, a C++20 NIF). Membership edges (`IS_MEMBER_OF`) are built per-request from the `UserPrivilegeRuleset` record and evaluated with `check_rel/4`. No permission data is stored in the graph between requests.

ReBAC is an upload-time and join-time check only. Per-tick access decisions (proximity culling, combat) use a local cache derived from the graph at join time, invalidated on explicit graph mutations. No live `taskweft` query is issued from the physics loop.

## Persistence

Entity state has two persistence paths:

**Graceful shutdown (FabricSnapshot)**
On `SIGINT`, zones drain entities toward zone 0 via STAGING migration. Zone 0 collects all entities and writes a `FabricSnapshot` Godot Resource to disk. On restart, each zone reloads only the entities whose Hilbert code falls within its range.

**Crash recovery (FabricZoneJournal)**
A per-zone SQLite database records discrete mutations: spawn, despawn, payload_update. On restart, the zone replays the journal on top of its deterministic static-world initialisation to recover dynamic entities (connected players, asset instances). Physics-step position updates are not journaled; they are recomputed from the simulation. See `20260421-sqlite-per-zone-journal.md` for the detailed design.

## Deployment

The reference deployment uses Docker Compose (`multiplayer-fabric-hosting`). Zone servers register with zone-backend at startup. Zone-backend and zone servers communicate only via HTTP and ENet; no shared database is required between them.

Cloudflare proxying is currently disabled for zone server hostnames because QUIC/UDP cannot be proxied by the standard Cloudflare path. Cloudflare's MASQUE-based proxy mode (2025) may pass UDP datagrams transparently; compatibility with zone server QUIC datagrams is under evaluation. The zone server's self-signed TLS certificate fingerprint (`cert_hash`) is stored in the zone registry and pinned by clients; no certificate authority is needed.

The WebSocket transport path in `FabricMMOGTransportPeer` is a first-class transport. iOS Safari clients use this path. It receives the same test coverage and feature access as the WebTransport path.

## What Is Not Decided Here

- Multi-machine scaling beyond a single host (horizontal zone distribution, inter-host routing)
- Authoritative physics vs. client-side prediction trade-offs for specific game types
- Asset moderation and content policy enforcement

## Status

Status: Accepted

## Decision Makers

- iFire

## Tags

- Architecture, Zone, FabricZone, Hilbert, Entity, Persistence, WebTransport, ReBAC, casync, 20260421-multiplayer-fabric-zone-architecture
