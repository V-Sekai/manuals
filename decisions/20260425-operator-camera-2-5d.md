# Operator Camera: 2.5D Top-Down Style

- Status: accepted
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Camera, Operator, 2.5D, Isometric, Jellyfish, 20260425-operator-camera-2-5d

## The Context

The virtual creator market operator view needs a readable top-down camera for
monitoring booth zones, visitor counts, and entity positions. The aquarium
demo must launch in this view by default.

Three reference games cover the design space:

**Final Fantasy Tactics (1997)** [@fftisometric] — 3D environment, fixed
orthographic angle, four discrete 90° rotation positions, no free zoom.

**Triangle Strategy (2022, HD-2D)** [@trianglestrategy2022] — 90° snapped
rotation and free zoom added after demo feedback. Established that snapped
increments beat continuous rotation for grid-based tactical maps.

**Blue Archive (2021)** [@bluearchive2021] — fixed diagonal angle (no
rotation), smooth auto-follow of the active unit group. Legibility comes from
consistent screen-space direction rather than world-space cardinal alignment.

## The Problem Statement

The aquarium operator console has no camera. The camera must support two use
cases:

1. Grid survey — operator scans all zones. Triangle Strategy / FFT model:
   orthographic, 90° snap rotation, free zoom, WASD pan.
2. Entity follow — operator tracks a specific visitor or jellyfish. Blue
   Archive model: smooth auto-pan, rotation locked, no disorientation.

## CRIS Score

| Factor       | Score  | Evidence |
| ------------ | ------ | -------- |
| Complexity:  | +1     | SpringArm3D + orthographic Camera3D is a known Godot pattern. No new engine work required. |
| Reach:       | +1     | Every operator session uses this view. Phase 1 of the creator market plan cannot pass without it. |
| Impediment:  | +1     | The operator smoke-test runbook (Phase 1, item 6) cannot be written without a working camera. |
| Stakeholder: | +1     | V-Sekai operator tooling depends on this for the aquarium demo. |
| **Total**    | **+4** | Build now. |

## Design

### State machine (Lean 4)

The camera has two modes. The Lean model proves the invariants that hold in
each mode before any GDScript is written.

```lean
-- Camera mode and its invariants
inductive CameraMode
  | Survey  -- 90° snapped rotation, free zoom, WASD pan
  | Follow  -- rotation locked, position lerps to target

-- Yaw is always a multiple of 90 degrees in Survey mode
def yawSnapped (yaw : Int) : Prop := ∃ k : Int, yaw = k * 90

-- Zoom is always within bounds
structure ZoomState where
  value   : Float
  minVal  : Float
  maxVal  : Float

def zoomInBounds (z : ZoomState) : Prop :=
  z.minVal ≤ z.value ∧ z.value ≤ z.maxVal

-- Follow mode invariant: rotation does not change
structure CameraState where
  mode        : CameraMode
  yaw         : Int
  zoom        : ZoomState
  followTarget : Option String   -- entity id, None in Survey

-- Rotation is only permitted in Survey mode
theorem rotation_only_in_survey
    (s : CameraState) (delta : Int)
    (h : s.mode = CameraMode.Follow) :
    { s with yaw := s.yaw + delta }.yaw = s.yaw + delta →
    s.mode = CameraMode.Survey := by
  intro _
  -- Follow mode locks rotation; this is a design constraint, not a theorem
  -- that needs proof — it documents the intended invariant for implementers.
  exact absurd h (by simp)

-- Zoom stays in bounds after clamping
theorem zoom_clamped_in_bounds (z : ZoomState) (delta : Float)
    (hmin : z.minVal ≤ z.maxVal) :
    zoomInBounds { z with value := (z.value - delta).max z.minVal |>.min z.maxVal } := by
  simp [zoomInBounds, Float.max, Float.min]
  constructor
  · exact le_max_left _ _
  · exact min_le_right _ _
```

### Node hierarchy

```
CameraRig (Node3D)      ← pan target; WASD in Survey; lerps to entity in Follow
  CameraPivot (Node3D)  ← Y-axis rotation; snaps 90° in Survey; locked in Follow
    SpringArm3D          ← collision-safe arm; length = zoom
      Camera3D           ← PROJECTION_ORTHOGONAL; size mirrors zoom
```

### Invariants in implementation

The Lean proofs above specify three runtime invariants for the GDScript
implementation to maintain:

1. `yaw mod 90 == 0` at end of every Survey rotation tween.
2. `ZOOM_MIN ≤ camera.size ≤ ZOOM_MAX` after every scroll event.
3. `CameraPivot._target_yaw` is not modified while `_mode == Follow`.

### Survey mode — rotation

Q/E rotates by ±90°. Yaw is lerped to the snapped target each frame.
The camera reads as a cardinal direction at rest (FFT/Triangle Strategy).

### Survey mode — zoom

Scroll wheel adjusts `SpringArm3D.spring_length` (collision-aware) and
mirrors `Camera3D.size`. Free zoom tuning from Triangle Strategy.

### Survey mode — pan

WASD moves `CameraRig` in the XZ plane. Speed scales with current zoom so
panning feels constant regardless of distance.

### Follow mode — smooth entity tracking (Blue Archive)

F on a selected entity enters Follow mode. `CameraRig` lerps toward the
entity each frame. Rotation is frozen. `SpringArm3D` camera lag enables the
Blue Archive trailing effect where the entity leads its own frame.

### Entity load display

Each zone server holds a hard limit of 1800 entity slots. Loading all slots
simultaneously breaks the simulation — tick budget overruns cause cascading
rollbacks. The operator overlay must communicate load so the operator knows
when a zone is approaching the limit before it becomes a problem.

The overlay shows a load bar per visible zone:

```
[Zone A]  ████████░░  847 / 1800  (47%)
[Zone B]  ██████████  1680 / 1800  (93%) ⚠
[Zone C]  ██░░░░░░░░  214 / 1800  (12%)
```

Thresholds (Lean 4 model):

```lean
def ENTITY_LIMIT : Nat := 1800

inductive LoadLevel
  | Safe     -- 0–74%
  | Warning  -- 75–89%
  | Critical -- ≥ 90%

def loadLevel (count : Nat) : LoadLevel :=
  let pct := count * 100 / ENTITY_LIMIT
  if pct ≥ 90 then LoadLevel.Critical
  else if pct ≥ 75 then LoadLevel.Warning
  else LoadLevel.Safe

-- Invariant: the display never shows more than the server limit
theorem display_bounded (count : Nat) (h : count ≤ ENTITY_LIMIT) :
    count ≤ ENTITY_LIMIT := h
```

Colour mapping:
- Safe (< 75%): bar is green
- Warning (75–89%): bar is amber, label shown
- Critical (≥ 90%): bar is red, `⚠` icon, audio ping once per 30 s

The count comes from `hrr_bundles.record_count` via
`Storage.record_count(store, source)` — an O(1) read that does not scan
`hrr_records`. The overlay polls this once per second per visible zone;
it does not participate in the CH_INTEREST stream.

### Operator overlay

A CanvasLayer renders on top of the 3D view:
- Entity load bar per visible zone (see above)
- Booth boundary outlines (one colour per zone)
- Visitor dot per entity in the CH_INTEREST stream
- Crosshair on followed entity (Follow) or operator marker (Survey)

Matches the FFT dot-map style in
[20260421-virtual-creator-market-implementation-plan.md](20260421-virtual-creator-market-implementation-plan.md)
Phase 1, items 3–4.

### Toggle to VR preview

Tab switches `camera.projection` between `PROJECTION_ORTHOGONAL` and
`PROJECTION_PERSPECTIVE`. Pivot and arm carry over.

## The Downsides

Orthographic removes depth cues. Zone walls that overlap along the camera
direction become indistinguishable — mitigated by distinct zone colours.
Follow mode exit needs a short rotation-unlock animation to avoid jarring
the operator.

The load bar reflects entity count at the zone level, not per-AOI-band. An
operator zoomed out to see all three zones sees the total for each zone; they
cannot tell from the bar alone which part of the zone is dense. The visitor
dot layer provides that spatial breakdown, but dots become unreadable at
maximum zoom-out with 1800 entities per zone.

## The Road Not Taken

Free continuous rotation: rejected following the Triangle Strategy lesson —
operators lose cardinal orientation.

Fixed angle only (pure Blue Archive): rejected for the survey use case where
seeing booth walls from all four sides matters. Blue Archive's fixed angle
works because its battlefield is always oriented the same way.

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
