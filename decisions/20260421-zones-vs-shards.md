# Zones vs Shards

## The Context

Traditional MMOs split the world into shards — isolated copies with hard player caps. When a shard fills, players queue or get bounced to another copy of the same world. multiplayer-fabric replaces shards with zones.

## The Problem Statement

Shards require a coordinator, match-maker, and session database to route players to the least-full copy. The coordinator is a single point of failure and a licensing surface (most implementations are proprietary middleware). Players on different shards cannot interact. The world is not continuous.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Each zone owns a slice of a single continuous 30-bit Hilbert code space (Skilling 2004). Zones share boundaries, not walls. Entities migrate across those boundaries automatically — the player never sees a loading screen or a "server full" message.

**AOI without adjacency tables.**
The Area of Interest band for a zone is derived directly from its Hilbert range, extended by `AOI_CELLS` on each side. Neighbor topology falls out of band overlap — no hand-authored adjacency tables. Adding a zone server changes the topology automatically.

**Why Hilbert, not Morton.**
The Hilbert curve has tighter spatial locality than the Morton (Z-order) curve: cluster diameter scales as O(n^(1/3)) vs Morton's O(n^(2/3)) (Bader 2013). Shorter cluster diameter means shorter AOI bands for the same coverage radius, which is why interest relay can copy each packet once per physical link rather than once per subscriber. Morton would require either wider AOI bands (more data per client) or a custom adjacency table to correct locality.

**Formal verification.**
The forward and inverse Hilbert transforms are formally verified in Lean 4 (`PredictiveBVH/Spatial/HilbertRoundtrip.lean`) and code-generated to C and Rust. No hand-written bit manipulation to audit or port across engine upgrades.

**Wire channel separation.**
Channel 0 carries Godot's built-in RPC/spawner/synchronizer traffic. `CH_INTEREST`, `CH_PLAYER`, and `CH_MIGRATION` carry Fabric-specific streams. Neither side inspects the other's packets. One pcap filter per channel yields exactly one semantic stream.

## The Benefits

No coordinator, match-maker, or session database. Neighbor topology is automatic. Players experience a continuous world. The locality proof is machine-checked.

## The Downsides

Zone boundaries are fixed at the Hilbert cell granularity. Very uneven entity distributions (all entities in one cell) cannot be rebalanced without splitting a zone — which requires a zone restart. Shards handle this trivially by spinning up a new copy.

## The Road Not Taken

Morton-order partitioning would have been simpler to implement and is more commonly cited in game broadphase literature. The O(n^(2/3)) cluster diameter makes it unsuitable for the one-copy-per-link relay goal: AOI bands would need to be wider to achieve the same spatial coverage, increasing per-client data volume. The Hilbert curve is the correct choice for this relay model.

A quad-tree or oct-tree spatial index would allow dynamic rebalancing but requires a coordinator to manage tree mutations — reintroducing the dependency the design is trying to eliminate.

## The Infrequent Use Case

A single-zone deployment (one server, all entities in one Hilbert slice) gets no benefit from Hilbert partitioning. The design is only relevant at two or more zone servers. A single-zone deployment can use any spatial index.

## In Core and Done by Us

- `PredictiveBVH/Spatial/HilbertRoundtrip.lean` — forward/inverse Hilbert proofs
- `fabric_mmog_zone.cpp` — AOI band derived from Hilbert range + `AOI_CELLS`
- `fabric_mmog_zone.h` — `MIGRATION_HEADROOM`, `AOI_CELLS` constants

## Status

Status: Accepted

## Decision Makers

- iFire

## Tags

- Zones, Shards, Hilbert, Morton, AOI, SpatialIndex, Partitioning, Locality, 20260421-zones-vs-shards

## Further Reading

1. Skilling 2004 — "Programming the Hilbert curve" — original bit-manipulation algorithm
2. Bader 2013 — "Space-Filling Curves: An Introduction with Applications in Scientific Computing" — O(n^(1/3)) vs O(n^(2/3)) cluster diameter comparison
3. `20260421-multiplayer-fabric-zone-architecture.md` — full zone architecture
4. `PredictiveBVH/Spatial/HilbertRoundtrip.lean` — formal proofs
