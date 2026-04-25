# Jellyfish Game Pass Condition Design

- Status: accepted
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Jellyfish, Demo, Design, 20260425-jellyfish-pass-condition

## The Context

[20260425-jellyfish-game.md](20260425-jellyfish-game.md) states a single pass
condition but does not record how each clause is implemented. The clause spans
three separate infrastructure pieces designed across multiple ADRs.

## The Problem Statement

Without a document that maps each clause of the pass condition to its implementation,
a developer cannot tell which system to wire, test, or debug when the demo fails.

## Design

The pass condition has three clauses.

### Clause 1 — a player-uploaded jellyfish appears in VR

`jellyfish_asset_loader.gd` calls `GET /shards/:id/assets` to fetch the zone
asset manifest. The manifest returns a `baked_url` (chunk hash URL) for the
jellyfish Godot scene. The loader fetches the chunk from the content-addressed
store, caches it on disk by hash, and instances the scene into the XR grid
scene via `CMD_INSTANCE_ASSET`.

Design: [20260421-zone-asset-manifest.md](20260421-zone-asset-manifest.md),
[20260421-content-addressed-asset-delivery.md](20260421-content-addressed-asset-delivery.md),
[20260421-asset-zone-locality.md](20260421-asset-zone-locality.md).

### Clause 2 — visible to a second player simultaneously

Entity state is broadcast to all players within the Area of Interest band via
`CH_INTEREST`. The zone server fans out each mutation packet to every subscriber
in the AOI without duplicating the payload. A second player connected to the
same zone receives the jellyfish spawn and subsequent position updates through
this channel.

Design: [20260421-multiplayer-fabric-zone-architecture.md](20260421-multiplayer-fabric-zone-architecture.md),
[20260421-websocket-transport-parity.md](20260421-websocket-transport-parity.md).

### Clause 3 — moving under its species domain plan rather than a hard-coded phase table

At zone startup, `FabricMMOGZone` loads the species domain JSON-LD file from
the zone asset bundle into `_species_domains`. On each behaviour cycle,
`_replan_jellyfish()` calls `tw_seek_plan(domain, state, {"behave"})` from
`standalone/tw_planner.hpp` to produce a plan. `JellygridSwarm::tick()` reads
the current action from the plan rather than a fixed phase table. When a threat
sensor fires, `_on_threat_detected()` calls `tw_replan_incremental()` to update
the plan without restarting from the root.

Design: [20260421-rectgtn-jellyfish-behavior.md](20260421-rectgtn-jellyfish-behavior.md).

## The Downsides

All three clauses must pass simultaneously in a single session. A failure in any
one clause (asset fetch, fan-out, or planning) fails the whole condition. The
three systems cannot be validated independently against this specific pass
condition.

## The Road Not Taken

Splitting the pass condition into three separate milestone tests would let each
system be validated independently. Rejected: the pass condition is specifically
an end-to-end composition test — each clause in isolation does not prove the
system composes.

## Status

Status: Accepted

## Decision Makers

- iFire

## Further Reading

1. [20260425-jellyfish-game.md](20260425-jellyfish-game.md) — go decision
2. [20260421-zone-asset-manifest.md](20260421-zone-asset-manifest.md) — `GET /shards/:id/assets`
3. [20260421-content-addressed-asset-delivery.md](20260421-content-addressed-asset-delivery.md) — casync chunk pipeline
4. [20260421-multiplayer-fabric-zone-architecture.md](20260421-multiplayer-fabric-zone-architecture.md) — CH_INTEREST fan-out
5. [20260421-rectgtn-jellyfish-behavior.md](20260421-rectgtn-jellyfish-behavior.md) — RECTGTN planning
