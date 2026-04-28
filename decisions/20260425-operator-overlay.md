# Operator Overlay: Entity Load and Dot Clustering

- Status: accepted
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Operator, Overlay, EntityLoad, Clustering, Jellyfish, 20260425-operator-overlay

## The Context

The operator camera ([20260425-operator-camera-2-5d.md](20260425-operator-camera-2-5d.md))
renders the zone grid. A CanvasLayer overlay on top communicates entity load
and spatial density. Each zone server holds 1800 entity slots; loading all
simultaneously breaks the simulation through tick budget overruns.

## The Problem Statement

Without a load display, operators cannot tell which zones are approaching the
1800-entity limit before rollbacks begin. Without spatial density information,
operators cannot tell where entities cluster within a zone.


## Design

### Load bar

One bar per visible zone, polled once per second from `Storage.record_count/2`
(reads `hrr_bundles.record_count` — O(1), no table scan, outside CH_INTEREST):

```
[Zone A]  ████████░░  847 / 1800  (47%)
[Zone B]  ██████████  1680 / 1800  (93%) ⚠
[Zone C]  ██░░░░░░░░  214 / 1800  (12%)
```

Thresholds (Lean 4):

```lean
def ENTITY_LIMIT : Nat := 1800

inductive LoadLevel | Safe | Warning | Critical

def loadLevel (count : Nat) : LoadLevel :=
  let pct := count * 100 / ENTITY_LIMIT
  if pct ≥ 90 then .Critical
  else if pct ≥ 75 then .Warning
  else .Safe

theorem display_bounded (count : Nat) (h : count ≤ ENTITY_LIMIT) :
    count ≤ ENTITY_LIMIT := h
```

Colour: Safe = green, Warning = amber, Critical = red + `⚠` + audio ping
every 30 s.

### Dot layer and clustering

One dot per entity from the CH_INTEREST stream. When dots fall within 24
screen-space pixels of each other they merge into a single cluster circle
labelled with the count. Zooming in splits clusters back to individual dots.
Cluster colour matches the zone load level so hotspots are visible without
zooming in.

This is the same approach as Google Maps marker clustering and StarCraft
minimaps. The load bar shows zone-level totals; the dot/cluster layer shows
where within the zone the load sits.

### Overlay elements

- Load bar per visible zone
- Booth boundary outline (one colour per zone)
- Visitor dot / cluster per entity in CH_INTEREST
- Crosshair on followed entity (Follow mode) or operator marker (Survey mode)

## The Downsides

The load bar shows zone totals, not per-AOI-band density. At maximum zoom-out
with 1800 entities even clusters become small. The operator must zoom in to
inspect a dense cluster.

## The Road Not Taken

Heat map over dots: rejects individual entity identity entirely. Cluster
labels preserve the count and the colour preserves the severity level, giving
more information at the same screen cost.

Per-AOI-band load bars: adds complexity without clear operator benefit; the
dot clustering already communicates spatial density.

## Status

Status: Accepted

## Decision Makers

- iFire

## Further Reading

[@storagerecount]: See `Taskweft.HRR.Storage.record_count/2` in `multiplayer-fabric-taskweft/lib/taskweft/hrr/storage.ex`.
