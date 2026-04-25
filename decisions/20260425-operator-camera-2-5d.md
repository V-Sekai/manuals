# Operator Camera: 2.5D Top-Down Style

- Status: accepted
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Camera, Operator, 2.5D, Isometric, Jellyfish, 20260425-operator-camera-2-5d

## The Context

The virtual creator market operator view needs a readable top-down camera.
Three reference games define the design space. Final Fantasy Tactics (1997)
[@fftisometric] used orthographic projection with four discrete 90° rotation
positions. Triangle Strategy (2022) [@trianglestrategy2022] added free zoom
and kept 90° snaps after demo feedback showed continuous rotation disorients
grid-map readers. Blue Archive (2021) [@bluearchive2021] took the opposite
approach: fixed diagonal angle, no rotation, smooth auto-follow of the active
unit group.

## The Problem Statement

The operator console has no camera. It needs two modes: grid survey
(Triangle Strategy / FFT) and entity follow (Blue Archive).

## CRIS Score

| Factor       | Score  | Evidence |
| ------------ | ------ | -------- |
| Complexity:  | +1     | SpringArm3D + orthographic Camera3D is a known Godot pattern. |
| Reach:       | +1     | Every operator session uses this view. |
| Impediment:  | +1     | The smoke-test runbook cannot be written without a working camera. |
| Stakeholder: | +1     | V-Sekai operator tooling depends on this for the aquarium demo. |
| **Total**    | **+4** | Build now. |

## Design

### Rotation representation: twist/swing per axis in [0, 1]

Camera orientation is expressed as a twist/swing pair, following the same
decomposition used by `TransformUtil.swing_twist` in the humanoid project
(`addons/humanoid/transform_util.gd`):

- Twist (x-axis of the `swing_twist` vector): yaw around the world Y axis,
  mapped to [0, 1] where 0.0 = north, 0.25 = east, 0.5 = south, 0.75 = west.
- Swing (y/z-axes of the `swing_twist` vector): elevation angle, fixed at a
  constant value corresponding to −55° pitch. Swing does not change at runtime.

In Survey mode the twist snaps to {0.0, 0.25, 0.5, 0.75}. Follow mode locks
twist at its current snapped value.

### State machine (Lean 4)

```lean
-- Twist in [0, 1]; four valid snap positions in Survey mode.
def SNAP_POSITIONS : List Float := [0.0, 0.25, 0.5, 0.75]

def twistSnapped (t : Float) : Prop := t ∈ SNAP_POSITIONS

-- Swing is constant; elevation does not change at runtime.
def SWING_ELEVATION : Float := 0.153  -- corresponds to −55° pitch

inductive CameraMode
  | Survey  -- twist snaps, zoom free, WASD pan
  | Follow  -- twist locked, position lerps to target

structure CameraState where
  mode   : CameraMode
  twist  : Float   -- in [0, 1]
  swing  : Float   -- always SWING_ELEVATION
  zoom   : Float   -- in [ZOOM_MIN, ZOOM_MAX]

-- In Survey mode at rest, twist is always a snap position.
def surveyInvariant (s : CameraState) : Prop :=
  s.mode = CameraMode.Survey → twistSnapped s.twist

-- Swing never changes.
def swingInvariant (s : CameraState) : Prop :=
  s.swing = SWING_ELEVATION

-- Zoom stays in [ZOOM_MIN, ZOOM_MAX] after clamping.
theorem zoom_clamped (s : CameraState) (delta zmin zmax : Float)
    (h : zmin ≤ zmax) (hs : zmin ≤ s.zoom ∧ s.zoom ≤ zmax) :
    let z' := (s.zoom - delta).max zmin |>.min zmax
    zmin ≤ z' ∧ z' ≤ zmax :=
  ⟨le_max_left _ _, min_le_right _ _⟩
```

Runtime invariants:
1. `twist ∈ {0.0, 0.25, 0.5, 0.75}` at rest in Survey mode.
2. `swing == SWING_ELEVATION` always.
3. `twist` not modified while `mode == Follow`.
4. `ZOOM_MIN ≤ zoom ≤ ZOOM_MAX` after every scroll event.

### Node hierarchy

```
CameraRig (Node3D)      ← pan target; WASD in Survey; lerps to entity in Follow
  CameraPivot (Node3D)  ← twist applied as Y-rotation; locked in Follow
    SpringArm3D          ← swing (fixed pitch); arm length = zoom
      Camera3D           ← PROJECTION_ORTHOGONAL; size mirrors zoom
```

`CameraPivot.rotation.y = twist * TAU` converts the [0, 1] twist value to
radians. `SpringArm3D.rotation.x` is set once from `SWING_ELEVATION` and
never written again.

### Survey mode

Q/E increments or decrements twist by 0.25, wrapping at 1.0. The pivot
lerps to the new twist value each frame. Scroll adjusts zoom within bounds.
WASD pans `CameraRig`; speed scales with zoom.

### Follow mode

F enters Follow mode. `CameraRig` lerps to the entity each frame. Twist
is frozen. SpringArm3D camera lag gives the Blue Archive trailing effect.

### Toggle

Tab switches `camera.projection` between orthographic and perspective.

## The Downsides

Orthographic removes depth cues; distinct zone colours compensate. Follow mode
exit needs a rotation-unlock animation. The overlay (see
[20260425-operator-overlay.md](20260425-operator-overlay.md)) handles entity
density display separately.

## The Road Not Taken

Continuous twist in [0, 1]: rejected — operators lose cardinal orientation
at non-snap positions (Triangle Strategy lesson).
Pure fixed swing with no twist: operators need all four wall faces for
zone inspection.

## Status

Status: Accepted

## Decision Makers

- iFire

## Further Reading

[@swingtwist]: `addons/humanoid/transform_util.gd` — `swing_twist` and `swing_twist_inv` in the humanoid project.

[@trianglestrategy2022]: "Triangle Strategy details improvements from demo feedback." Nintendo Everything, 2021. <https://nintendoeverything.com/triangle-strategy-details-tons-of-improvements-from-demo-feedback-survey/>

[@trianglestrategyHD2D]: "Triangle Strategy devs on HD-2D." Nintendo Everything, 2022. <https://nintendoeverything.com/triangle-strategy-devs-on-how-the-game-uses-accurate-hd-2d/>

[@bluearchive2021]: Blue Archive. Nexon Games, 2021. <https://bluearchive.wiki/wiki/Combat_basics>

[@udemytopdown]: "The Ultimate 2D Top Down Unreal Engine Course." Udemy. <https://www.udemy.com/course/unreal-2d-top-down/>

[@unrealspringarm]: "Rotate and zoom using spring arm." Unreal MMO Dev, 2022. <https://unreal-mmo-dev.com/2022/12/26/30-unreal-engine-handle-zoom-and-rotate-with-spring-arm/>

[@godotspringarm]: "SpringArm3D." Godot Engine Documentation. <https://docs.godotengine.org/en/stable/classes/class_springarm3d.html>

[@fftisometric]: "Designing an isometric 2.5D game like Final Fantasy Tactics Advance." Game Goat. <https://gamegoat.gg/blog/designing-an-isometric-2-5d-game-like-final-fantasy-tactics-advance/29>
