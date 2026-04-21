# Zone-Border Entity Handoff

## The Context

The world is partitioned into zones, each owning a contiguous prefix of the 30-bit 3D Hilbert code space (Skilling 2004). When an entity moves across a zone boundary, ownership must transfer from the origin zone to the destination zone without the entity disappearing from either side during transit. The partitioning, migration state machine, hysteresis threshold, and interest separation are all formally specified in Lean 4 in `multiplayer-fabric-predictive-bvh`.

## The Problem Statement

A hard cutover — despawn in zone A, spawn in zone B — produces a visible gap if the two zones are not synchronized. A three-state handoff that keeps the entity alive in both zones during transit eliminates the gap. Without a proved arrival guarantee and a hysteresis guard, an entity oscillating near a boundary triggers repeated migrations.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

### Zone assignment

Each zone owns the Hilbert codes whose top `d` bits equal the zone index. The assignment is O(1):

```lean
-- Fabric.lean
def assignToZone (zones : Array ZoneState) (cx cy cz : Int) : Nat
-- theorem: result always < zones.size
theorem assignToZone_in_range (zones : Array ZoneState) (cx cy cz : Int)
    (h : 0 < zones.size) : assignToZone zones cx cy cz < zones.size
```

Zones are disjoint by construction:

```lean
theorem zoneSpans_disjoint (i j prefixDepth : Nat) (h : i ≠ j) :
    (zoneMortonSpan i prefixDepth).overlaps (zoneMortonSpan j prefixDepth) = false
```

### Migration state machine

Entity ownership follows a three-variant inductive type (`Fabric.lean`):

```lean
inductive MigrationState where
  | owned
  | staging (targetZone : Nat) (arrivalHLC : HLC)
  | incoming (fromZone : Nat)
```

`owned` — authority resides here. `staging(targetZone, arrivalHLC)` — the entity is in flight to `targetZone`; both zones hold valid ghost snapshots until `arrivalHLC` is reached. `incoming(fromZone)` — this zone is receiving the entity from `fromZone`.

### Hysteresis guard

The transition from `owned` to `staging` does not fire the moment an entity's Hilbert code crosses a prefix boundary. A hysteresis counter must reach `hysteresisThreshold` ticks first:

```lean
-- Types.lean
def hysteresisThreshold : Nat := simTickHz * 4   -- 4 seconds at 20 Hz = 80 ticks
```

This prevents rapid back-and-forth migrations for entities moving near a boundary.

### Arrival guarantee

The `arrivalHLC` field in `staging` is set to `currentHLC + latencyTicks` at the moment the migration is initiated. `latencyTicks` is derived from the server tick rate:

```lean
-- Resources.lean
def latencyTicks : Nat := max (simTickHz / 10) 1
```

The minimum total migration period is bounded:

```lean
-- WaypointBound.lean
def wpPeriodMin : Nat := maxTravelTicks + hysteresisThreshold + latencyTicks
```

### Authority/interest separation

During `staging`, the destination zone holds a read-only ghost replica. Ghost replicas use a separate budget from authority slots, proved formally:

```lean
-- AuthorityInterest.lean
theorem ghost_does_not_consume_authority_slot ... :
    authorityWithinCap (receiveGhost z r) cap headroom
```

When `arrivalHLC` is reached, `promoteToAuthority` moves the entity from the replicas array to the entities array, removing it from the interest budget and adding it to the authority budget. The authority and interest capacities are independent:

```lean
def authorityWithinCap (z : ZoneStateAI n) (cap headroom : Nat) : Prop :=
    z.entities.size ≤ cap - headroom          -- default: 1400 of 1800 slots

def interestWithinCap (z : ZoneStateAI n) : Prop :=
    z.replicas.size ≤ InterestCapacity        -- default: 400 ghost slots
```

### Interest band after handoff

Once the destination zone becomes authoritative, it notifies neighbours whose area-of-interest overlaps. The band is a proved-width MortonSpan:

```lean
-- Fabric.lean
def aoiBand (zoneIdx prefixDepth aoiCells : Nat) : MortonSpan

theorem aoiBand_covers_self (zoneIdx prefixDepth aoiCells : Nat) :
    band.lo ≤ span.lo ∧ span.hi ≤ band.hi

theorem aoiBand_width_bound ... :
    band.hi + 1 - band.lo ≤ (1 + 2 * aoiCells) * mortonSpanWidth prefixDepth
```

The width bound is independent of global zone count, which is the invariant that keeps per-zone bandwidth constant as the world scales.

### No coordinator

Zone range maps are learned by gossip (`NoGod.lean`). There is no god-clock or coordinator. Authority is determined by geometric containment alone:

```lean
def geometricAuthority (view : NodeView n) (h : Nat) : Option ZoneRange :=
    view.ranges.find? (fun r => r.contains h)
```

The gossip protocol maintains disjointness across all nodes:

```lean
theorem receive_preserves_disjoint {n : Nat} (view : NodeView n) (msg : GossipMsg n)
    (hview : DisjointRanges view.ranges) (hmsg : DisjointRanges msg.ranges) :
    DisjointRanges (NodeView.receive view msg).ranges
```

## The Benefits

The three-state machine with hysteresis eliminates both the visible-gap problem and the oscillation problem. Authority and interest slot budgets are independent, so migrating entities cannot crowd out local entities. All zone-count and capacity claims are machine-checked rather than estimated.

## The Downsides

The hysteresis delay of 4 seconds means an entity that genuinely moves to a new zone is not handed off for 4 seconds. For fast-moving entities this may feel like a lag spike if the origin zone is lost during the window. The minimum migration period `wpPeriodMin` must be shorter than the expected round-trip time for interactive input to remain responsive during transit.

## The Road Not Taken

A two-state machine (`OWNED → OWNED`) with a hard cutover is simpler but produces one-tick gaps visible to subscribers and velocity discontinuities under physics simulation. A coordinator-based approach (one node assigns zone ranges) eliminates gossip complexity but requires an always-available coordinator and is not proved in the existing Lean corpus.

## The Infrequent Use Case

An entity whose Hilbert code lands on a prefix boundary — exactly equal to `i * 2^(30-d)` — belongs to zone `i` by the `span_contains_iff_prefix` theorem. No special tie-breaking is required.

## In Core and Done by Us

The full formal specification lives in `multiplayer-fabric-predictive-bvh`:

- `PredictiveBVH/Protocol/Fabric.lean` — zone assignment, disjointness, STAGING state machine, AOI band
- `PredictiveBVH/Relativistic/NoGod.lean` — gossip, vector clocks, geometric authority
- `PredictiveBVH/Interest/AuthorityInterest.lean` — authority/interest separation, capacity invariants
- `PredictiveBVH/Protocol/WaypointBound.lean` — migration period lower bound
- `PredictiveBVH/Spatial/HilbertRoundtrip.lean` — Hilbert curve correctness, orders 1–10

The C implementation is code-generated from `PredictiveBVH/Codegen/CodeGen.lean` into `predictive_bvh.h`. `FabricZone` (`modules/multiplayer_fabric/`) and `FabricMMOGZone` (`modules/multiplayer_fabric_mmog/`) consume the generated header.

## Status

Status: Accepted

## Decision Makers

- iFire

## Tags

- Zone, Handoff, STAGING, Hilbert, HLC, Hysteresis, Interest, FabricZone, Lean4, Formal
