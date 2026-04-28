# Build the Jellyfish Game

Supersedes: [20260421-infinite-aquarium-concept.md](20260421-infinite-aquarium-concept.md),
[20260421-virtual-creator-market-implementation-plan.md](20260421-virtual-creator-market-implementation-plan.md)

- Status: accepted
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Jellyfish, Aquarium, Game, CRIS, 20260425-jellyfish-game

## The Context

`multiplayer-fabric` has no reference application. The four existing jellyfish
ADRs describe infrastructure pieces and a creator market concept but do not
record a single go/no-go decision with explicit prioritisation. Without one,
effort scatters across competing items and the demo never ships.

## The Problem Statement

No ADR commits to building the jellyfish game as the current top priority.
The CRIS score below makes that commitment explicit.


## Design

The jellyfish game is the Infinite Aquarium: a social, bioluminescent ocean
where players design jellyfish, release them into a shared zone, and watch
them behave under RECTGTN planning.

Pass condition: a player-uploaded jellyfish appears in VR, visible to a second
player simultaneously, moving under its species domain plan rather than a
hard-coded phase table. See [20260425-jellyfish-pass-condition.md](20260425-jellyfish-pass-condition.md)
for the consolidated design.

Implementation details are recorded in the following ADRs — they remain
accepted and are not superseded:

- Behaviour planning: [20260421-rectgtn-jellyfish-behavior.md](20260421-rectgtn-jellyfish-behavior.md)
- Creator behaviour sandbox: [20260423-sandbox-rebac-behavior.md](20260423-sandbox-rebac-behavior.md)
- Zone architecture: [20260421-multiplayer-fabric-zone-architecture.md](20260421-multiplayer-fabric-zone-architecture.md)
- Asset delivery: [20260421-content-addressed-asset-delivery.md](20260421-content-addressed-asset-delivery.md)
- ReBAC enforcement: [20260421-rebac-zone-server-enforcement.md](20260421-rebac-zone-server-enforcement.md)

Work sequencing follows the phases in [20260421-virtual-creator-market-implementation-plan.md](20260421-virtual-creator-market-implementation-plan.md)
(superseded by this ADR; phases remain valid as a task checklist).

## The Benefits

A passing demo proves the infrastructure composes correctly end-to-end.
Creators and operators can evaluate the platform against something concrete
rather than documentation.

## The Downsides

A bioluminescent jellyfish ocean is a narrow theme. Operators building avatar
showrooms or board games must extrapolate. A more neutral demo exercises fewer
platform primitives and is less compelling to the creator audience the product
targets.

## The Road Not Taken

A tag game (one chaser, rest flee across zone boundaries) would stress zone
handoff without touching asset delivery or ReBAC. It validates the engine but
not the product. The aquarium validates both, at the same engine complexity cost.

## The Infrequent Use Case

A zone with no uploaded jellyfish (new operator, empty ocean) still passes the
demo if the player's own jellyfish appears after upload. The shared-ocean
property is a second milestone, not a prerequisite for the pass condition.

## Client strategy

The Godot wasm32/wasm64 web export is dropped. Active client surface is Godot-native:

Godot native PCVR client handles VR presence, jellyfish creation, and entity
control. It uses the xr-grid project with OpenXR and the picoquic WebTransport
backend. See [20260425-godot-player.md](20260425-godot-player.md).

Godot `--headless` observer (operator and CI smoke-test paths) is **deferred**
until the VR client ships. The design — reusing `FabricMultiplayerPeer` and
`fabric_client.gd`, no separate parser, no TypeScript — remains valid; see
[20260425-godot-observer.md](20260425-godot-observer.md).

A browser client is SOMEDAY; the Three.js WebGPU design
([20260425-threejs-webgpu-zone-client.md](20260425-threejs-webgpu-zone-client.md))
is superseded and not being built.

## In Core and Done by Us

- `multiplayer-fabric-godot/modules/multiplayer_fabric_mmog/` — zone server,
  swarm sim, RECTGTN integration
- `jellyfish_asset_loader.gd` — asset manifest → CDN fetch → scene instance
- `assets/domains/jellyfish_common.jsonld`, `jellyfish_bioluminescent.jsonld`
  — RECTGTN species domains
- `multiplayer-fabric-zone-backend` — `GET /shards/:id/assets`, ReBAC, Uro
- xr-grid project — Godot native PCVR client, jellyfish creation
- `headless_log_observer.gd` — Godot `--headless` observer (deferred; ships after VR)

## Status

Status: Accepted

## Decision Makers

- iFire

## Further Reading

1. [20260421-rectgtn-jellyfish-behavior.md](20260421-rectgtn-jellyfish-behavior.md) — RECTGTN planning implementation
2. [20260421-infinite-aquarium-concept.md](20260421-infinite-aquarium-concept.md) — aquarium concept (superseded)
3. [20260421-virtual-creator-market-implementation-plan.md](20260421-virtual-creator-market-implementation-plan.md) — phase checklist (superseded)
4. [20260423-sandbox-rebac-behavior.md](20260423-sandbox-rebac-behavior.md) — sandbox for creator executable code
