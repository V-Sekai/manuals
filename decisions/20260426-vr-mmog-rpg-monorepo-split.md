# Split multiplayer-fabric into VR, MMOG, and RPG monorepos

## The Context

`multiplayer-fabric` began as a single monorepo containing every concern of the
project: the Godot engine fork, the XR interaction plugin, the Meta XR Simulator
integration, the ArtifactsMMO HTN planning bot, taskweft, zone servers, casync,
and more than twenty other submodules. A developer working on XR interaction had
to clone the zone backend. A developer working on the RPG planning bot had to
clone the Godot engine. Every CI run, dependency audit, and `git submodule
update --init` operated on the full set.

Gall's Law [@gall1977systemantics]: a complex system that works evolved from a
simple system that worked. A complex system designed from scratch never works.

The project now has three distinguishable product layers with different
development cadences, different runtime environments, and different teams of
concern:

- **VR** — Godot engine fork, XR interaction plugin, Meta XR Simulator, canvas
  plane, lasso interaction, OTel tracing. Runs on a headset or macOS desktop.
- **MMOG** — Zone servers (Elixir), webtransport, zone console, zone backend,
  predictive BVH interest management, casync distribution. Runs on Linux
  servers.
- **RPG** — HTN planning bot (ArtifactsMMO), taskweft domain library. Runs as
  an Elixir CLI against a game API.

## The Problem Statement

A monorepo that mixes all three layers forces every developer to carry all
layers as local checkouts, inflates `git submodule update` times, and makes it
impossible to scope CI to a layer. A breakage in the RPG bot blocks a CI run
that has nothing to do with the VR client. Adding a new XR interaction control
requires navigating submodule noise from zone servers that are unrelated to the
change.

The single monorepo cannot express "this PR is VR-only" without convention;
GitHub branch protection and CI scoping cannot enforce layer boundaries.

## Design

Three focused monorepos replace the single monorepo:

### `multiplayer-fabric` — MMOG infrastructure

Retains: zone-backend, zone-console, webtransport, predictive-bvh,
predictive-bvh-research, build, merge, hosting, casync-seed, baker,
elf-programs, generate-secrets, humanoid-project, taskweft, aria-storage,
cockroach, manuals, docker, rx.

URL: `https://github.com/V-Sekai-fire/multiplayer-fabric`

### `multiplayer-fabric-xr-dev` — VR / XR client

Contains: multiplayer-fabric-godot (branch `multiplayer-fabric`),
multiplayer-fabric-interaction-system, multiplayer-fabric-interaction-system-project,
multiplayer-fabric-skills, multiplayer-fabric-rx.

URL: `https://github.com/V-Sekai-fire/multiplayer-fabric-xr-dev`

### `multiplayer-fabric-rpg` — RPG game layer

Contains: multiplayer-fabric-artifacts-mmog, multiplayer-fabric-taskweft.

URL: `https://github.com/V-Sekai-fire/multiplayer-fabric-rpg`

### Submodule convention

Each monorepo pins submodules to a named branch (not a detached SHA) so that
`git submodule update --remote` advances the pointer to the latest commit on
that branch. Shared dependencies (e.g., taskweft appears in both MMOG and RPG)
remain in their own repos and are referenced as submodules from both monorepos;
there is no duplication of source.

### Migration executed

```sh
# XR repos removed from multiplayer-fabric, added to multiplayer-fabric-xr-dev
multiplayer-fabric-godot
multiplayer-fabric-interaction-system
multiplayer-fabric-interaction-system-project
multiplayer-fabric-skills
multiplayer-fabric-meta          # (removed entirely; Meta XR Simulator local only)
multiplayer-fabric-rx

# RPG repos removed from multiplayer-fabric, added to multiplayer-fabric-rpg
multiplayer-fabric-artifacts-mmog
```


## The Downsides

- Cross-layer changes (e.g., a new zone protocol message that requires both a
  server change and an XR client change) must be coordinated across two
  monorepos. The pointer-sync SOP (`/sync-submodule-pointers`) must be run in
  both after pushing.
- Shared dependencies (taskweft) must be kept in sync manually; no single
  lockfile enforces a common version across monorepos.
- Developers who need to work across layers must clone multiple monorepos.

## The Road Not Taken

**Keep a single monorepo, use sparse checkout**: sparse-checkout reduces local
disk use but does not scope CI, does not express layer ownership in GitHub, and
does not prevent a noisy-neighbour submodule from stalling `git submodule update`.

**Two repos (VR + everything else)**: rejected because the MMOG server and the
RPG planning bot have no runtime dependency on each other. Grouping them adds
server infrastructure noise to a game-logic developer's workspace without
benefit.

## Status

Status: Accepted

## Decision Makers

- K. S. Ernest (iFire) Lee

## Tags

- V-Sekai, monorepo, architecture, xr, mmog, rpg, 20260426-vr-mmog-rpg-monorepo-split

## Further Reading

1. [multiplayer-fabric-xr-dev](https://github.com/V-Sekai-fire/multiplayer-fabric-xr-dev)
2. [multiplayer-fabric-rpg](https://github.com/V-Sekai-fire/multiplayer-fabric-rpg)
3. [Isolated Godot engine changes via per-feature submodule checkouts](20260426-isolated-godot-submodule-checkouts.md)
