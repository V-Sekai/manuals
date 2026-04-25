# Operator Camera: 2.5D Top-Down Style

- Status: accepted
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Camera, Operator, 2.5D, Isometric, Jellyfish, 20260425-operator-camera-2-5d

## The Context

The virtual creator market operator view needs a readable top-down camera for
monitoring booth zones, visitor counts, and entity positions. The aquarium
demo must launch in this view by default.

Triangle Strategy (2022, Square Enix HD-2D) solved the same problem: an
isometric tactical map that reads clearly from above, rotates in 90° snapped
increments, and lets the operator zoom freely without losing spatial orientation.
Final Fantasy Tactics (1997) established the reference: 3D environment, fixed
orthographic angle, four discrete rotation positions, one-button toggle between
cardinal views.

## The Problem Statement

The aquarium operator console has no camera. Without one, operators cannot tell
which booth zones are healthy, where visitors are clustered, or whether entity
migration is working. A perspective camera at arbitrary angles makes booth
boundaries hard to read; a fixed top-down orthographic view at 90° snap
intervals matches how operators already think about zone grids.

## CRIS Score

| Factor          | Score | Evidence |
| --------------- | ----- | -------- |
| Complexity:  | +1 | SpringArm3D + orthographic Camera3D is a known Godot pattern. No new engine work required. |
| Reach:       | +1 | Every operator session uses this view. Phase 1 of the creator market plan cannot pass without it. |
| Impediment:  | +1 | The operator smoke-test runbook (Phase 1, item 6) cannot be written without a working camera. |
| Stakeholder: | +1 | V-Sekai operator tooling depends on this for the aquarium demo. |
| **Total**    | **+4** | Build now. |

## Design

### Node hierarchy

```
CameraRig (Node3D)          ← pan target; WASD moves this
  CameraPivot (Node3D)      ← Y-axis rotation; Q/E snaps in 90° increments
    SpringArm3D              ← collision-safe arm; length controls zoom
      Camera3D               ← orthographic projection; size = zoom width
```

### Projection

```gdscript
camera.projection = Camera3D.PROJECTION_ORTHOGONAL
camera.size = 20.0   # world-units visible across the shorter viewport axis
```

Orthographic removes perspective foreshortening so booth boundary lines stay
parallel regardless of zoom. This matches the Triangle Strategy map view and
the FFT battle grid.

### Elevation and pitch

SpringArm3D rotation: `x = -55°, y = 0°, z = 0°` at startup.
55° gives a readable isometric feel without collapsing zone depth into a single
line. The pitch is fixed; only yaw rotates.

### Rotation (Y-axis, 90° snaps)

Triangle Strategy added smooth 90° rotation after demo feedback showed players
lost orientation with free continuous rotation. The same applies here.

```gdscript
const SNAP_DEGREES = 90.0
var _target_yaw := 0.0

func _rotate_camera(direction: int) -> void:   # direction: +1 right, -1 left
    _target_yaw += direction * SNAP_DEGREES

func _process(delta: float) -> void:
    var pivot = $CameraRig/CameraPivot
    pivot.rotation_degrees.y = lerp_angle(
        pivot.rotation_degrees.y, _target_yaw, delta * 8.0)
```

Q rotates left, E rotates right. Input matches Triangle Strategy right-stick tilt.

### Zoom

Zoom adjusts `SpringArm3D.spring_length` (collision-aware) and mirrors the
orthographic size so world objects stay the same visual size relative to the
viewport.

```gdscript
const ZOOM_MIN = 10.0
const ZOOM_MAX = 60.0

func _zoom(delta: float) -> void:
    var arm: SpringArm3D = $CameraRig/CameraPivot/SpringArm3D
    arm.spring_length = clamp(arm.spring_length - delta * 5.0, ZOOM_MIN, ZOOM_MAX)
    $CameraRig/CameraPivot/SpringArm3D/Camera3D.size = arm.spring_length
```

Scroll wheel zooms. Triangle Strategy added free zoom after demo feedback.

### Pan

WASD moves `CameraRig` in the XZ plane, scaled by current zoom level so
panning speed feels constant regardless of zoom.

```gdscript
func _pan(dir: Vector2, delta: float) -> void:
    var speed = camera.size * 0.5
    var forward = -CameraPivot.global_transform.basis.z * dir.y
    var right   =  CameraPivot.global_transform.basis.x * dir.x
    CameraRig.position += (forward + right) * speed * delta
```

### Operator overlay

On top of the 3D camera, a CanvasLayer renders:
- Booth boundary outlines (one colour per zone)
- Visitor dot per entity in the CH_INTEREST stream
- Operator-position crosshair

This matches the FFT overworld dot-map style described in
[20260421-virtual-creator-market-implementation-plan.md](20260421-virtual-creator-market-implementation-plan.md)
Phase 1, items 3–4.

### Toggle to orbit mode

Tab switches `camera.projection` between `PROJECTION_ORTHOGONAL` (operator
view) and `PROJECTION_PERSPECTIVE` (orbit/VR preview). The pivot and arm
positions carry over so the operator returns to the same viewpoint.

## The Downsides

Orthographic projection removes depth cues. Zone curtain walls that overlap
in the camera direction become indistinguishable. A thin distinct colour per
zone boundary mitigates this; depth sorting of the CanvasLayer dots does not
apply because they are screen-space 2D.

## The Road Not Taken

Free-angle orbit camera as default: rejected because booth grid lines read
badly at arbitrary angles and operators lose cardinal orientation. Available
as a toggle for inspecting individual entities.

Perspective projection as default: rejected for the same reason. Perspective
foreshortening makes the zone grid non-uniform, which defeats the operator's
spatial model of the market.

## Status

Status: Accepted

## Decision Makers

- iFire

## Further Reading

1. [20260425-jellyfish-pass-condition.md](20260425-jellyfish-pass-condition.md) — demo pass condition this camera supports
2. [20260421-virtual-creator-market-implementation-plan.md](20260421-virtual-creator-market-implementation-plan.md) — Phase 1 operator view items 3–6
3. [The Ultimate 2D Top Down Unreal Engine Course](https://www.udemy.com/course/unreal-2d-top-down/) — spring arm, orthographic zoom, rotation patterns (Unreal; concepts translate directly to Godot SpringArm3D)
4. [Triangle Strategy devs on HD-2D camera](https://nintendoeverything.com/triangle-strategy-devs-on-how-the-game-uses-accurate-hd-2d/) — 360° rotation design challenge for isometric maps
5. [Triangle Strategy demo feedback camera changes](https://nintendoeverything.com/triangle-strategy-details-tons-of-improvements-from-demo-feedback-survey/) — free zoom and rotation sensitivity tuning added post-demo
6. [SpringArm3D — Godot Engine docs](https://docs.godotengine.org/en/stable/classes/class_springarm3d.html)
7. [Designing an isometric 2.5D game like Final Fantasy Tactics](https://gamegoat.gg/blog/designing-an-isometric-2-5d-game-like-final-fantasy-tactics-advance/29)
8. [UE Spring arm rotate and zoom](https://unreal-mmo-dev.com/2022/12/26/30-unreal-engine-handle-zoom-and-rotate-with-spring-arm/)
