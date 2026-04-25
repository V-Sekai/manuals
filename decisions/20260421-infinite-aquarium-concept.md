# The Infinite Aquarium

## The Context

The Infinite Aquarium is the proof-of-concept application for multiplayer-fabric: a social, UGC bioluminescent ocean where players design jellyfish and release them into a shared neon sea built from other players' creations. Comparable positioned titles: VRChat, Roblox, s&box.

The aquarium exercises every platform primitive in a single coherent demo: zone streaming, content-addressed asset delivery, ReBAC permissions, WebTransport/WebSocket transport, entity interest management, and RECTGTN planning. It is also the first concrete instance of the virtual creator market product (`20260421-product-virtual-creator-market.md`): a creator's zone is their booth, their jellyfish are their products.

## The Problem Statement

multiplayer-fabric has no reference application. Without one, it is impossible to verify that the infrastructure primitives compose correctly end-to-end, or to demonstrate the platform to creators and operators. The aquarium is the smallest application that exercises all of them in combination.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

### Demo scope (two-hour target)

Fetch a player-uploaded jellyfish asset from Uro by hash, instance it inside the XR grid scene, and have it visible in VR.

1. `jellyfish_asset_loader.gd` calls `GET /shards/:id/assets` to resolve the zone asset manifest and download the `baked_url` for the jellyfish Godot scene.
2. The loaded scene is instanced into the existing xr-grid scene via `CMD_INSTANCE_ASSET`.
3. Player sees the UGC jellyfish appear in VR.
4. Jellyfish movement driven by `JellygridSwarm::tick()` reading the current RECTGTN plan action.

Pass condition: jellyfish appears in the scene, visible to the player in VR, with another player able to see it simultaneously.

### Jellyfish creator workflow

The asset format is a Godot scene. No external DCC tools required.

1. Design with CSG nodes (bell body, tentacle sweeps) in the Godot editor or an in-world editor scene.
2. Bake CSG to a static mesh (`CSGShape3D.bake_mesh()`).
3. Save the baked mesh scene to Uro — the content-addressed store assigns a chunk hash and `baked_url`.

The baked scene is the canonical asset; clients instance it directly at runtime. The chunk hash is stable across uploads of identical geometry, so repeat downloads cost no bandwidth.

### Zone infrastructure

The Abyss is a persistent, zone-sharded ocean:

- Hilbert-coded zone boundaries for seamless cross-zone movement
- Distributed simulation via multiplayer-fabric — each zone is a separate server process sharing entity state
- Area of Interest bands so players only receive data for nearby jellyfish
- Zone crossings are seamless; `MIGRATION_HEADROOM = 400` absorbs swarm spikes
- Performance target: 511+ jellyfish across a 3-zone loop without data loss

Zone infrastructure is implemented. See `20260421-multiplayer-fabric-zone-architecture.md`.

### UGC asset pipeline

Every jellyfish is a content-addressed asset bundle in Uro. Clients fetch by chunk hash at runtime and only download jellyfish within their AOI. The manifest endpoint (`GET /shards/:id/assets`) resolves the full asset list in one round trip. See `20260421-content-addressed-asset-delivery.md` and `20260421-zone-asset-manifest.md`.

### RECTGTN behaviour

Each jellyfish species has a JSON-LD RECTGTN domain loaded at zone startup. The zone server runs `tw_seek_plan()` on domain + entity state to produce a behaviour plan stored in the CDN. Jellyfish movement in `JellygridSwarm::tick()` reads the current action from the plan rather than a hard-coded phase table. See `20260421-rectgtn-jellyfish-behavior.md`.

### Implementation status

| Component | Status | Notes |
|---|---|---|
| Zone networking | Working | `fabric_mmog_zone.cpp` |
| Entity migration | Working | `SCENARIO_JELLYFISH_ZONE_CROSSING` |
| Jellyfish creator | In scope | CSG design → bake mesh → save Godot scene → Uro |
| Asset streaming | In progress | `jellyfish_asset_loader.gd` → `GET /shards/:id/assets` → `FabricMMOGAsset` |
| Zone console | In progress | `multiplayer-fabric-zone-console` — Elixir TUI (ExRatatui), auth + shard list via Uro REST |
| VR interface | Testing | xr-grid project |
| ReBAC permissions | Working | `Uro.Acl` — `CAN_ENTER` and `CAN_INSTANCE` at zone join and slot allocation |
| Swarm physics | In scope | `jellygrid_swarm_sim.hpp` — pure C++, no sandbox |
| Current simulation | In scope | `jellygrid_current_sim.hpp` — pure C++, no sandbox |
| RECTGTN planning | In scope | `tw_planner.hpp` standalone headers in `fabric_mmog_zone.cpp`; plans stored in CDN |
| Behavior scripts | ~~Tombstoned~~ | godot-sandbox / RISC-V ELF guest — standalone headers used instead |
| Pulse waveform | ~~Tombstoned~~ | dropped from asset bundle |
| Remix system | ~~Tombstoned~~ | clone + fork provenance chain |
| Moderation layer | ~~Tombstoned~~ | Uro ACL + operator tombstone endpoint |
| Environmental FX | ~~Tombstoned~~ | currents, rip events, bloom dynamics |

## The Benefits

The aquarium is the smallest application that exercises every platform primitive end-to-end. If the demo passes, the infrastructure composes correctly. If any primitive fails, the failure is immediately visible in a concrete scenario rather than an abstract test.

## The Downsides

A bioluminescent jellyfish ocean is a narrow theme. Operators evaluating multiplayer-fabric for other applications (e.g. avatar showrooms, board games) must extrapolate from the aquarium. A more neutral demo (empty room with a moving cube) would be less compelling and exercise fewer primitives.

## The Road Not Taken

A tag game (one chaser, rest flee across zone boundaries) would stress-test real-time position sync and zone handoff without touching asset delivery or ReBAC. It validates the engine but not the product. The aquarium validates both.

## The Infrequent Use Case

A zone with no uploaded jellyfish (new operator, empty ocean) still passes the two-hour demo if the player's own jellyfish appears after upload. The shared-ocean property is a second milestone, not a prerequisite.

## In Core and Done by Us

- `multiplayer-fabric-godot/modules/multiplayer_fabric_mmog/` — zone server, swarm sim, current sim, RECTGTN integration
- `multiplayer-fabric-godot/modules/multiplayer_fabric_mmog/jellyfish_asset_loader.gd` — asset manifest → CDN fetch → scene instance
- `assets/domains/jellyfish_common.jsonld`, `jellyfish_bioluminescent.jsonld` — RECTGTN species domains
- `multiplayer-fabric-zone-backend` — `GET /shards/:id/assets`, ReBAC enforcement, Uro asset storage
- `multiplayer-fabric-zone-console` — operator TUI for zone management

## Status

Status: In Progress

## Decision Makers

- iFire

## Tags

- Aquarium, PoC, UGC, Jellyfish, VR, Demo, Product, CreatorMarket, 20260421-infinite-aquarium-concept

## Further Reading

1. `20260421-product-virtual-creator-market.md` — product strategy; booth = zone
2. `20260421-multiplayer-fabric-zone-architecture.md` — zone infrastructure
3. `20260421-rectgtn-jellyfish-behavior.md` — RECTGTN planning for jellyfish
4. `20260421-zone-asset-manifest.md` — `GET /shards/:id/assets`
5. `20260421-content-addressed-asset-delivery.md` — casync/Uro asset pipeline
6. `20260421-rebac-zone-server-enforcement.md` — `CAN_ENTER` and `CAN_INSTANCE`
