# Godot Native PCVR Player

Supersedes: [20260425-threejs-player.md](20260425-threejs-player.md)

- Status: draft
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Godot, WebTransport, Player, PCVR, OpenXR, ZoneServer, OperatorCamera, 20260425-godot-player

## The Context

The Godot native desktop/PCVR client (`observer.tscn` with `OperatorRig` and
`operator_camera.gd`) is already the reference implementation for the operator
view. It runs the same `FabricMultiplayerPeer` C++ peer as the zone server.
Stage 2 adds entity control: CH_PLAYER writes, OpenXR VR presence, and
taskweft RECTGTN planning — all in GDScript and C++, with no browser runtime
and no TypeScript.

## The Problem Statement

The Three.js player ([@threejsplayer]) required a TypeScript CH_PLAYER write
path, a libriscv WASM ABI shim for GDScript behaviors, a taskweft Emscripten
build, and WebXR for VR presence. Each of those is an unverified integration
point. The Godot native path replaces all four with the existing Godot XR tools,
native taskweft, and the godot-sandbox RISC-V guest already tested on desktop.


## Design

### CH_PLAYER write path

```gdscript
func send_player_input(entity_id: int, pos: Vector3, payload: PackedInt32Array) -> void:
    var buf := PackedByteArray()
    buf.resize(100)
    buf.encode_s32(0, entity_id)
    buf.encode_double(4,  pos.x)
    buf.encode_double(12, pos.y)
    buf.encode_double(20, pos.z)
    # payload[0..13] at offset 44
    for i in range(14):
        buf.encode_u32(44 + i * 4, payload[i])
    _peer.put_packet(buf)
    _peer.set_transfer_mode(MultiplayerPeer.TRANSFER_MODE_UNRELIABLE)
```

The same 100-byte layout as CH_INTEREST. Datagrams are UNRELIABLE — fire and
forget, no retransmit.

### Scene structure

```
observer.tscn
└─ OperatorRig                  # operator_camera.gd — Survey / Follow modes
   └─ CameraPivot
      └─ SpringArm3D
         └─ Camera3D
└─ FabricClient                 # fabric_client.gd → FabricMultiplayerPeer
└─ EntityRoot                   # _entity_nodes populated by FabricClient
└─ XROrigin3D                   # OpenXR — added for VR presence
   └─ XRCamera3D
   └─ XRController3D (left)
   └─ XRController3D (right)
```

`XROrigin3D` is added only when `XRServer.get_primary_interface()` returns a
valid OpenXR interface. Desktop operators use the operator camera without XR.

### OpenXR VR presence

```gdscript
func _ready() -> void:
    var xr := XRServer.find_interface("OpenXR")
    if xr and xr.initialize():
        get_viewport().use_xr = true
```

Godot XR tools handle headset rendering. The Three.js WebXR path (WebXR Device
API + `VRButton`) is not needed.

### Entity control — jellyfish spawn

```gdscript
func spawn_jellyfish(pos: Vector3) -> void:
    var payload := PackedInt32Array()
    payload.resize(14)
    payload[0] = (EntityClass.JELLYFISH << 24) | (owner_id << 8) | StateFlags.SPAWNING
    send_player_input(next_entity_id(), pos, payload)
```

### RECTGTN planning

taskweft runs natively in Elixir on the zone backend. The GDScript client does
not run the planner locally — it sends intent via CH_PLAYER and receives
authoritative state via CH_INTEREST. The taskweft Emscripten WASM path from the
Three.js ADR is deferred.

### godot-sandbox behaviors

GDScript behavior scripts run in the godot-sandbox RISC-V guest on the native
desktop client without a libriscv WASM ABI shim. The shim remains a future
integration point for browser deployments only.

## The Downsides

Native desktop/PCVR only. Browser entity control (CH_PLAYER from a browser tab)
requires the Three.js write path or a future Godot wasm64 build and is deferred
to SOMEDAY.

## The Road Not Taken

Three.js WebGPU player ([@threejsplayer]): four unverified integration points
(TypeScript CH_PLAYER, libriscv WASM ABI shim, taskweft Emscripten, WebXR).
Replaced by proven Godot native stack. Browser player remains a SOMEDAY item.

## Status

Status: Draft

## Decision Makers

- iFire

## Further Reading

[@threejsplayer]: [20260425-threejs-player.md](20260425-threejs-player.md) — superseded Three.js Stage 2.

[@godotobserver]: [20260425-godot-observer.md](20260425-godot-observer.md) — deferred; VR client ships first, observer follows.

[@operatorcamera]: [20260425-operator-camera-2-5d.md](20260425-operator-camera-2-5d.md) — twist/swing [0,1] camera; Survey and Follow modes.

[@godotxrtools]: "Godot XR Tools." Godot Engine. <https://github.com/GodotVR/godot-xr-tools>

[@openxr]: "OpenXR Overview." Khronos Group. <https://www.khronos.org/openxr/>
