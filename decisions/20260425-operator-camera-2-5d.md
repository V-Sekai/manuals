# Operator Camera: 2.5D Top-Down Style

- Status: accepted
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Camera, Operator, 2.5D, Isometric, Jellyfish, 20260425-operator-camera-2-5d

## The Context

The virtual creator market operator view needs a readable top-down camera.
Three reference games define the design space:

**Final Fantasy Tactics (1997)** [@fftisometric] — orthographic, four discrete
90° rotation positions.

**Triangle Strategy (2022)** [@trianglestrategy2022] — 90° snapped rotation
and free zoom, added after demo feedback showed continuous rotation
disorients grid-map readers.

**Blue Archive (2021)** [@bluearchive2021] — fixed diagonal angle, no
rotation, smooth auto-follow of the active unit group.

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

### State machine (Lean 4)

```lean
inductive CameraMode
  | Survey  -- 90° snapped rotation, free zoom, WASD pan
  | Follow  -- rotation locked, position lerps to target

def yawSnapped (yaw : Int) : Prop := ∃ k : Int, yaw = k * 90

structure ZoomState where
  value : Float; minVal : Float; maxVal : Float

def zoomInBounds (z : ZoomState) : Prop :=
  z.minVal ≤ z.value ∧ z.value ≤ z.maxVal

theorem zoom_clamped_in_bounds (z : ZoomState) (delta : Float)
    (hmin : z.minVal ≤ z.maxVal) :
    zoomInBounds { z with value := (z.value - delta).max z.minVal |>.min z.maxVal } := by
  simp [zoomInBounds, Float.max, Float.min]
  exact ⟨le_max_left _ _, min_le_right _ _⟩
```

Runtime invariants: `yaw mod 90 == 0` at rest; `ZOOM_MIN ≤ camera.size ≤ ZOOM_MAX`; `_target_yaw` not modified in Follow mode.

### Node hierarchy

```
CameraRig (Node3D)      ← pan target; WASD in Survey; lerps to entity in Follow
  CameraPivot (Node3D)  ← Y-axis rotation; snaps 90° in Survey; locked in Follow
    SpringArm3D          ← collision-safe arm; length = zoom
      Camera3D           ← PROJECTION_ORTHOGONAL; size mirrors zoom
```

### Survey mode

Q/E snaps yaw ±90°, lerped each frame. Scroll adjusts `spring_length` and
mirrors `camera.size`. WASD pans `CameraRig`; speed scales with zoom.

### Follow mode

F enters Follow mode. `CameraRig` lerps to the entity each frame. Rotation
frozen. SpringArm3D camera lag gives the Blue Archive trailing effect.

### Toggle

Tab switches `camera.projection` between orthographic and perspective.

## The Downsides

Orthographic removes depth cues; distinct zone colours compensate. Follow mode
exit needs a rotation-unlock animation. The overlay (see
[20260425-operator-overlay.md](20260425-operator-overlay.md)) handles entity
density display separately.

## The Road Not Taken

Free continuous rotation: operators lose cardinal orientation (Triangle Strategy lesson).
Pure fixed angle: operators need all four wall faces for zone inspection.

## Status

Status: Accepted

## Decision Makers

- iFire

## Further Reading

[@trianglestrategy2022]: "Triangle Strategy details improvements from demo feedback." Nintendo Everything, 2021. <https://nintendoeverything.com/triangle-strategy-details-tons-of-improvements-from-demo-feedback-survey/>

[@trianglestrategyHD2D]: "Triangle Strategy devs on HD-2D." Nintendo Everything, 2022. <https://nintendoeverything.com/triangle-strategy-devs-on-how-the-game-uses-accurate-hd-2d/>

[@bluearchive2021]: Blue Archive. Nexon Games, 2021. <https://bluearchive.wiki/wiki/Combat_basics>

[@udemytopdown]: "The Ultimate 2D Top Down Unreal Engine Course." Udemy. <https://www.udemy.com/course/unreal-2d-top-down/>

[@unrealspringarm]: "Rotate and zoom using spring arm." Unreal MMO Dev, 2022. <https://unreal-mmo-dev.com/2022/12/26/30-unreal-engine-handle-zoom-and-rotate-with-spring-arm/>

[@godotspringarm]: "SpringArm3D." Godot Engine Documentation. <https://docs.godotengine.org/en/stable/classes/class_springarm3d.html>

[@fftisometric]: "Designing an isometric 2.5D game like Final Fantasy Tactics Advance." Game Goat. <https://gamegoat.gg/blog/designing-an-isometric-2-5d-game-like-final-fantasy-tactics-advance/29>
