# Reduce gitassembly to MMOG modules; adopt humanoid-project as test scene

## The Context

`multiplayer-fabric-merge` assembles the `multiplayer-fabric` branch of
`multiplayer-fabric-godot` from thirteen feature branches via `gitassembly`.
Three of those branches — `feat/module-lasso`, `feat/module-openvr`, and
`feat/module-speech` — are XR-client concerns that moved to
`multiplayer-fabric-xr-dev` as part of the VR/MMOG/RPG monorepo split
[@20260426-vr-mmog-rpg-monorepo-split].

`multiplayer-fabric-interaction-system-project` was the smoke-test Godot
project for the MMOG monorepo. It also moved to `multiplayer-fabric-xr-dev`,
leaving `multiplayer-fabric` with no Godot project to run as a headless
integration test.

`multiplayer-fabric-humanoid-project` remains in the MMOG monorepo. It
contains a flat test scene (`humanoid/scenes/mire.tscn`) with a humanoid
character, a VRM importer, and an MToon shader — the minimum surface needed to
smoke-test that the assembled engine renders a rigged character and moves it on
a plane, matching the 2.5D operator-camera design in
[@20260425-operator-camera-2-5d].

## The Problem Statement

The `multiplayer-fabric` gitassembly includes three XR-only modules that no
longer belong in the MMOG layer. Merging them into the combined engine branch
couples the MMOG build to XR code, inflates link time, and produces a CI
failure mode where an XR module regression blocks a purely server-side change.

The MMOG monorepo also lacks a runnable Godot project to validate that the
assembled engine boots and renders a character on terrain.

## Design

### gitassembly reduction

Remove three XR-only branches from `multiplayer-fabric-merge/gitassembly`:

```diff
-merge multiplayer-fabric-base remotes/v-sekai-fire/feat/module-lasso
-merge multiplayer-fabric-base remotes/v-sekai-fire/feat/module-openvr
-merge multiplayer-fabric-base remotes/v-sekai-fire/feat/module-speech
```

Remaining branches are all MMOG or general-engine concerns:

| Branch | Concern |
|---|---|
| `feat/engine-patches` | Upstream backports |
| `feat/fix-picosocks-cmsghdr-mingw` | WebTransport Windows cross-compile |
| `feat/godot-cpp-build` | GodotCpp SCons fixes |
| `feat/godot-cpp-master` | GodotCpp master tracking |
| `feat/module-sqlite` | SQLite (OTel cache, general storage) |
| `feat/module-http3` | HTTP3/QUIC transport layer |
| `feat/module-sandbox` | RISC-V sandbox kernel |
| `feat/module-keychain` | OS credential storage |
| `feat/open-telemetry` | Distributed tracing |

### Smoke test: humanoid on a plane

`multiplayer-fabric-humanoid-project` (`humanoid/scenes/mire.tscn`) becomes
the MMOG integration test. The pass condition is:

```sh
godot --path multiplayer-fabric-humanoid-project --headless --quit-after 300
# exit 0, no errors, character loads and steps forward
```

The scene exercises: VRM import, MToon shader, humanoid skeleton, and basic
rigid-body plane collision — sufficient to confirm the assembled MMOG engine
boots and renders without the XR surface.


## The Downsides

- The `multiplayer-fabric` combined branch no longer includes lasso, OpenVR, or
  speech. Any engine work that touches both MMOG and XR must be coordinated
  across `multiplayer-fabric` and `multiplayer-fabric-xr-dev`.
- `multiplayer-fabric-humanoid-project` must stay compatible with the assembled
  MMOG engine; VRM and MToon addons track their own upstream.

## The Road Not Taken

**Keep all XR branches in the MMOG gitassembly**: avoids split, but defeats
the purpose of the monorepo separation and keeps the coupling that motivated
the split.

**Drop `multiplayer-fabric-merge` entirely**: premature. The gitassembly
pattern is still needed to compose the MMOG engine modules; only the XR
branches are removed.

## Status

Status: Accepted

## Decision Makers

- K. S. Ernest (iFire) Lee

## Tags

- V-Sekai, monorepo, mmog, gitassembly, humanoid, 20260426-reduce-merge-humanoid-test-project

## Further Reading

1. [VR/MMOG/RPG monorepo split](20260426-vr-mmog-rpg-monorepo-split.md)
2. [Operator Camera 2.5D](20260425-operator-camera-2-5d.md)
3. [multiplayer-fabric-humanoid-project](https://github.com/V-Sekai-fire/multiplayer-fabric-humanoid-project)
