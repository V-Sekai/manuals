## Generate Optimal Partition

The spatial oracle decides *who receives data* in a multiplayer game server. The core algorithm is an overlap-adaptive Hilbert broadphase with predictive expansion.

## Summary

Multiplayer game servers hit hard player-count ceilings because the spatial query that decides who receives data scales as O(N^2). The broadphase pairwise overlap check dominates every simulation step.

A game server can replace the O(N^2) broadphase with a proved-optimal O(N+k) Hilbert broadphase and predictive ghost expansion. The core algorithms are formally verified in Lean 4 and code-generated into the `predictive_bvh.h` header (R128 64.64 fixed-point, micrometres).

## Hilbert Broadphase: O(N+k)

1. **Radix sort** entities by 30-bit Hilbert code (Skilling 2004): O(N)
2. **Form groups** by Hilbert prefix: O(N)
3. **Prune** non-overlapping groups — `hilbert_prune_sound` (proved): if group AABBs don't overlap, no entity pairs between them can overlap
4. **Scan** overlapping groups: O(N+k), proportional to output

`broadphase_lower_bound` (proved in `Core/LowerBound.lean`) establishes Ω(N+k) — this is asymptotically optimal.

## Predictive Expansion

Each entity's bounding box is expanded by its velocity and acceleration to cover a rebuild window Δt of physics-bounded motion, using the Surface Area Heuristic [@macdonald1990bsp]:

$$e_\alpha = |V_\alpha| \cdot \Delta t + \tfrac{1}{2} A_\alpha \cdot \Delta t^2 \quad \text{(metres)}$$

`expansion_covers_k_ticks` (proved in `Core/Formula.lean`) guarantees no false negatives: any entity obeying Newtonian bounds stays inside its expanded box across the rebuild window. Per-entity Δt lets slow entities rebuild less often than fast ones:

| Entity type | Velocity | Rebuild window Δt | Ghost radius |
|---|---|---|---|
| Stationary spectator | 0 m/s | 6 s | 0 m |
| Concert dancer | 2 m/s | 0.65 s | ~1.6 m |
| Sprint infantry | 7 m/s | 0.2 s | ~2.1 m |
| Helicopter | 80 m/s | 0.05 s | ~4 m |

All algorithm logic is in Lean 4 [@demoura2021lean4]. Integer arithmetic throughout — `omega` closes every goal.

## Why This Matters

Multiplayer game servers hit hard player-count ceilings because the spatial query that decides who receives data scales poorly. The bottleneck is the broadphase — the pairwise overlap check that runs every tick.

This work replaces that bottleneck with a proved-optimal O(N+k) broadphase and a predictive expansion that lets the server skip rebuilds for slow-moving entities entirely across multiple simulation steps, with formal guarantees that no entity is ever missed.

## References
