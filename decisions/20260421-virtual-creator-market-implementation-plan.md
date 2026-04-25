# Virtual Creator Market Implementation Plan

## The Context

The Virtual Creator Market PoC (`20260421-infinite-aquarium-concept.md`) is the reference application for multiplayer-fabric. Implementation items are sequenced by risk: each step retires one uncertainty before the next begins. A creator's booth is a zone. Visitors cross booth boundaries the same way entities migrate between zones. Creator assets are content-addressed chunks in Uro.

## The Problem Statement

There is no sequenced plan that connects the existing zone infrastructure to a working creator market demo. Steps are ordered so that each one produces a verifiable pass condition before the next begins, preventing parallel risk accumulation.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

### Phase 1 — Operator visibility (retire: can you tell what is happening in your market?)

**1. Zone health HUD anchor fix**
Move `StatusHUD` under `SpectatorRig/SpringArm3D/Camera3D` so the operator dashboard follows the camera viewport rather than sitting at world origin.
Pass: launching the observer scene shows zone health text pinned to the camera and readable while orbiting.

**2. Booth position marker**
Add a pulsing mesh marker at the operator's connected zone position updated every frame from authoritative zone state.
Pass: marker remains visible during camera motion and crosses booth boundaries without lagging.

**3. Booth boundary readability pass**
Raise zone curtain alpha and add camera-facing or vertical labels so booth names are readable from top-down and orbit views.
Pass: all three booth labels are readable from default spawn view; boundary surfaces remain visible at far zoom.

**4. Top-down operator camera default**
Add an orthographic top-down mode as the default startup view (Final Fantasy Tactics overworld style): booth zones appear as colored region borders, visitor entities as dots, operator position as a highlighted marker. Toggle to orbit mode with Tab.
Pass: boot opens in top-down mode; toggle switches cleanly with no control lockups.

**5. Multi-booth smoke run**
Run the 3-zone observer smoke test and capture screenshots in both top-down and orbit modes during the 144-visitor crossing burst.
Pass: no mass rollback, no duplicate flood; screenshots show visitors crossing booth boundaries.

**6. Operator runbook**
Document exact scene, command, and expected visual checks for repeating the smoke run.
Pass: another contributor can execute the runbook without guessing hidden setup steps.

---

### Phase 2 — Visitor VR experience (retire: can visitors navigate and see creator content?)

**7. XR grid ground plane**
Instance `ProceduralGrid3D` under `XROrigin3D` in `main.tscn` so visitors have spatial reference inside a creator booth. Wire `FOCUS_NODE` to the headset camera.
Note: do not use symlinks — copy xr-grid scripts into the demo directory or use `res://` path remapping. Windows Steam PCVR requires admin privileges for symlinks.
Pass: visitor has a visible ground plane and scale reference in VR.

**8. WorldGrab booth navigation**
Instance `XRPinch` on each `XRController3D` hand node. Two-hand WorldGrab lets visitors grab the space and move, rotate, and scale — the primary navigation method for browsing a creator's booth.
Same symlink caveat as above.
Pass: visitor can navigate the booth in VR using two-hand grab without teleport or joystick.

**9. XR node tree verification**
Confirm `WorldGrab`, `XRPinch`, `ProceduralGrid3D`, and `trident_hand.gd` are instanced and functional under `XROrigin3D`.
Pass: VR scene graph is complete; input reaches scripts.

**10. Creator interaction tool → CH_PLAYER cmd=1**
Wire the XR controller trigger on `trident_hand.gd` to emit a CH_PLAYER cmd=1 (`ragdoll`) packet from `fabric_client.gd`. The server-side handler in `fabric_mmog_zone.cpp` already injects the C7 velocity spike — only the client send path is missing.
Pass: creator input reaches the zone simulation.

**11. Creator annotation tool → CH_PLAYER cmd=3**
Wire the pen tool XR controller input to emit a CH_PLAYER cmd=3 packet per stroke knot. The server-side handler mirrors the cmd=1 path. Verify knots appear in visiting observers' CH_INTEREST stream.
Pass: the full client-to-zone-to-observer path through CH_PLAYER and CH_INTEREST is exercised by both interaction tools.

**12. End-to-end VR demo pass**
Boot three booth zones (minimum for transitive migration: booth A → B → C exercises both neighbor indices). Confirm in top-down view first — booth curtains visible, visitor entities populate all three booths, 144-visitor burst migrates without mass rollback. Then confirm in VR: rendering, head tracking, and hand tracking update in CH_INTEREST.

Three visitor populations:
| Population | IDs | Market scenario |
|---|---|---|
| `opening_crowd` | 0–255 | Dense crowd at a popular booth launch. Visitors appear alongside creator entities in CH_INTEREST. |
| `rush` | 256–399 | 144 visitors burst into a new booth simultaneously — worst-case migration spike at a booth opening. |
| `browse` | 400–511 | 8 groups of 14 visitors moving at browsing speed through connected booths — sustained cross-booth movement, not just a spike. |

Pass: an observer in Booth B receives all 144 rush visitors from Booth A without snap, duplicate, or loss. `MIGRATION_HEADROOM` absorbs the spike.

---

### Phase 3 — Creator asset pipeline (retire: can creators upload and visitors see their assets?)

**13. Content-addressed chunk store in Uro**
Add `/chunks/:hash` to Uro accepting PUT (upload) and GET (fetch) for binary blobs keyed by BLAKE3 hash. No permissions yet.
Pass: Uro stores and returns arbitrary content-addressed chunks; hash round-trip is verified.

**14. ReBAC permissions on chunk fetch**
Add a ReBAC policy check to `GET /chunks/:hash`: the requesting principal must hold `can_read` on the chunk's namespace. Operators assign namespaces at upload time.
Pass: visitors without permission receive 403; creator controls who can fetch their assets.

**15. Client-side chunk streaming**
In `jellyfish_asset_loader.gd`, replace the baked-in asset load with a runtime fetch: call `GET /shards/:id/assets` for the booth manifest, then fetch each `baked_url` by chunk hash. Cache fetched chunks on disk by hash.
Pass: visitor cold-boots with empty cache and loads creator assets from Uro at runtime.

**16. End-to-end asset streaming test**
Upload a creator asset from the demo scene to a local Uro instance. Boot a visitor client cold (empty cache) and confirm it fetches and renders the asset by hash. Test both the happy path and a 403 rejection with an unauthorized principal.
Pass: creator uploads, visitor downloads, unauthorized visitor is rejected — all in a single automated run.

---

### Phase 4 — Load validation (retire: does the market hold under event-scale load?)

**17. 100-visitor headless load harness**
Write a headless driver spawning 100 `FabricPeer` connections to a single booth zone, each subscribing to `CH_INTEREST`. Record timestamp of every broadcast packet received.
Pass: 100 visitors connected and logging without VR hardware.

**18. CH_INTEREST fan-out latency at 100 visitors**
Run the harness. Record p50/p99 fan-out latency for `local_broadcast_raw` at 100 simultaneous subscribers. Validates Hilbert AOI band and one-copy-per-link relay before scaling to multiple booths.
Pass: per-booth fan-out is bounded and measurable.

**19. 5-machine fabric provisioning (32 booth zones)**
Sizing: 1,000 visitors × 56 entities = 56,000 entities; at 1,800 per zone → 32 booth zones; 7 zones per 8-core machine → 5 machines, 63,000 capacity, 1,125 visitors at 12.5% headroom. Deploy zone binaries, confirm all 32 booth zones register and show healthy in the operator view.
Pass: full market topology is live and observable before load is applied.

**20. 1,000-visitor event load test**
Drive 1,000 simulated visitors against the 32-zone fabric. Record peak entity count per zone, p99 migration latency, and headroom margin.
Pass: no booth zone exceeds 1,800 entities; headroom stays above 12.5% throughout.

---

### Phase 5 — Formal verification (retire: is the burst absorption claim proved?)

**21. Audit Lean proofs and sketch headroom theorem**
Read `ghost_containment_implies_no_exit` and `staging_resolves_to_single_owner` in `PredictiveBVH/Spatial/HilbertRoundtrip.lean`. Identify lemma dependencies. State the theorem: `MIGRATION_HEADROOM ≥ MAX_BURST_SIZE` with constant values from `fabric_mmog_zone.h` visible to the Lean build.
Pass: theorem is stated correctly and its dependencies are known before any proof attempt.

**22. Prove and verify the headroom theorem**
Implement the theorem. The proof should reduce to `decide` or `norm_num` once constants are in scope. Run `lake build`; confirm no `sorry` placeholders remain.
Pass: the burst absorption claim for the market rush scenario is formally verified.

**23. BVH validation on market populations**
`lbvhAux` now sets `parentBounds` to entity-tight union. Run the BVH builder on `opening_crowd`, `rush`, and `browse` and confirm total SAH cost is ≤ the Morton baseline.
Pass: entity-tight bounds do not regress BVH quality on market visitor distributions.

**24. Centroid axis selection validation**
Instrument `lbvhAux` to log the chosen split axis per node. Run on `opening_crowd` and `browse`. Confirm the heuristic distributes axes sensibly rather than collapsing to a single axis on flat populations.
Pass: centroid axis heuristic picks useful splits on real visitor distributions.

**25. Saturator convergence on market populations**
Run `saturateAxes` on all three populations. Verify: (a) convergence in ≤ 3 passes; (b) it finds a cheaper partition than the initial LBVH on at least some subtrees.
Pass: Hilbert-sorted BVH produces correct and competitive RDO cost with the full visitor population model.

---

### Deferred

**UDS zone-to-zone transport** — `FabricLocalZonePeer` via `UDSServer`/`StreamPeerUDS` as opt-in for same-machine booth-to-booth traffic. The RTT-derived adaptive timeout already fixes the 144-visitor burst under ENet fragmentation. Revisit only if fan-out measurement (Phase 4) identifies ENet as the bottleneck.

**Editor booth visualizer** — Hilbert band overlay, visitor count per booth, migration arrows in the 3D viewport. Unnecessary before the VR smoke test passes (Phase 2).

**Editor multiplayer_fabric awareness** — Making the editor understand booth zones and migration state. The demo runs headless zone servers plus a PCVR client; the editor does not participate. Revisit only if debugging Phase 3+ becomes painful without it.

## The Benefits

Risk-ordered sequencing ensures each phase produces a verifiable artifact before the next begins. Operators can see the market before creators can upload. Creators can upload before visitors can browse. Visitor experience is confirmed before event-scale load is applied. The Lean proof closes the formal gap last, after the empirical evidence is in.

## The Downsides

The sequencing assumes each phase completes before the next starts. Parallel work is possible (e.g. Lean proofs alongside Phase 2) but risks accumulating unverified assumptions. The 1,000-visitor load test requires provisioned hardware — this is a hard dependency on infrastructure availability.

## The Road Not Taken

A feature-parallel approach (all phases simultaneously) would finish faster if nothing blocked, but any infrastructure failure in Phase 1 would block all downstream work invisibly. Risk-ordered sequencing surfaces blockers early.

## The Infrequent Use Case

A solo creator with one booth zone and no visitors still exercises Phase 1 (operator visibility) and Phase 3 (asset upload). The market-scale phases are only required before opening to the public.

## In Core and Done by Us

- Phase 1: `observer.tscn`, `zone_curtain.gd`, `SpectatorRig` — observer UI fixes
- Phase 2: `main.tscn`, `fabric_client.gd`, `trident_hand.gd` — VR wiring
- Phase 3: `multiplayer-fabric-zone-backend` `/chunks/:hash`, `jellyfish_asset_loader.gd`
- Phase 4: headless load harness, zone provisioning scripts
- Phase 5: `PredictiveBVH/Spatial/HilbertRoundtrip.lean`, `lbvhAux` instrumentation

## Status

Status: In Progress

## Decision Makers

- iFire

## Tags

- VirtualCreatorMarket, ImplementationPlan, Aquarium, RiskSequencing, LoadTest, VR, AssetPipeline, Lean, BVH, 20260421-virtual-creator-market-implementation-plan

## Further Reading

1. `20260421-infinite-aquarium-concept.md` — product concept and component status
2. `20260421-product-virtual-creator-market.md` — product strategy
3. `20260421-websocket-transport-parity.md` — 100-visitor load test design
4. `20260421-content-addressed-asset-delivery.md` — chunk store design
5. `20260421-rebac-zone-server-enforcement.md` — ReBAC on asset fetch
6. `20260421-rectgtn-jellyfish-behavior.md` — RECTGTN planning for entities
