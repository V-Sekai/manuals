# Godot Native Headless Observer

Supersedes: [20260425-threejs-observer.md](20260425-threejs-observer.md)

- Status: accepted
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Godot, WebTransport, Observer, ZoneServer, Headless, CI, 20260425-godot-observer

## The Context

The zone server speaks WebTransport (picoquic, UDP 7443 locally / UDP 443
externally). `FabricMultiplayerPeer` is the C++ peer that wraps picoquic.
`fabric_client.gd` wraps `FabricMultiplayerPeer` and populates `_entity_nodes`
as CH_INTEREST datagrams arrive. A headless observer that drives this stack
proves end-to-end connectivity with the real protocol implementation — no
browser, no TypeScript build, no service worker.

## The Problem Statement

The Three.js observer ([@threejsobserver]) required a separate TypeScript client
and runtime. The Godot headless path reuses the identical C++ WebTransport peer
and GDScript entity layer that ship with the zone server, closing the
"different stack, different bugs" gap and enabling CI smoke tests with a single
`godot --headless` invocation.

## CRIS Score

| Factor       | Score  | Evidence |
| ------------ | ------ | -------- |
| Complexity:  | +1     | GDScript SceneTree script; reuses existing `FabricMultiplayerPeer` and `fabric_client.gd`. No new language or build step. |
| Reach:       | 0      | Native desktop only. Browser observer is deferred (see SOMEDAY). |
| Impediment:  | +1     | Unblocks Phase 1 GO headless test and CI smoke check without new tooling. |
| Stakeholder: | +1     | Operator runbook and branch protection both depend on a passing GO test. |
| **Total**    | **+3** | Build now; browser observer is SOMEDAY. |

## Design

### CLI

```sh
godot --headless --path . \
  --script scripts/headless_log_observer.gd \
  -- [--host=HOST] [--port=PORT] [--dump-json=PATH] [--frames=N]
```

Defaults: `host=127.0.0.1 port=7443 frames=600`

Exit 0 when `_entity_nodes.size() > 0`. Exit 1 on timeout with no entities.

### SceneTree script

`headless_log_observer.gd` extends `SceneTree`. On `_init` it instantiates
`fabric_client.gd`, sets `zone_host` and `zone_port`, and connects
`process_frame` to a polling handler that reads `_entity_nodes` from the
client every 60 frames. When entities arrive it optionally serialises them
to JSON via `--dump-json` and calls `quit(0)`.

```gdscript
func _collect_entities() -> Array:
    var nodes = client.get("_entity_nodes")
    for k in nodes.keys():
        var node := nodes[k] as Node3D
        if node and is_instance_valid(node):
            out.append({"id": k, "pos": node.global_position})
    return out
```

### Protocol stack

```
headless_log_observer.gd
    └─ fabric_client.gd
           └─ FabricMultiplayerPeer (C++ / picoquic)
                  └─ WebTransport UDP 7443
                         └─ zone server
```

No separate datagram parser is needed. `FabricMultiplayerPeer` handles the
100-byte CH_INTEREST wire format and populates `_entity_nodes` automatically.

### JSON dump (--dump-json)

```json
[{"id": 1, "pos": {"x": 0.0, "y": 0.0, "z": 0.0}}, ...]
```

Used by Playwright and CI to assert `entities.length > 0` without parsing
Godot stdout.

## The Downsides

Native-only. The browser operator view — load bars, dot clustering in a
`<canvas>` overlay — is not covered by this ADR. Those features remain in SOMEDAY.

## The Road Not Taken

Three.js WebGPU observer ([@threejsobserver]): browser-native, no install, but a
separate TypeScript parse layer means bugs in the TypeScript parser can diverge
from the C++ implementation. The Godot headless path removes that gap.

## Status

Status: Accepted

## Decision Makers

- iFire

## Further Reading

[@threejsobserver]: [20260425-threejs-observer.md](20260425-threejs-observer.md) — superseded Three.js Stage 1.

[@fabricclient]: `modules/multiplayer_fabric/demo/abyssal_vr/scripts/fabric_client.gd` — zone client GDScript.

[@headlessobserver]: `modules/multiplayer_fabric/demo/abyssal_vr/scripts/headless_log_observer.gd` — this ADR's implementation.
