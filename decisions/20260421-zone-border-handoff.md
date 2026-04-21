# Zone-Border Entity Handoff

## The Context

The world is partitioned into zones, each owning a contiguous range of the 3D Hilbert curve. When an entity moves across a zone boundary, ownership must transfer from the origin zone to the destination zone without the entity disappearing from either side during transit.

## The Problem Statement

A hard cutover — despawn in zone A, spawn in zone B — produces a visible gap if the two zones are not perfectly synchronized. A two-phase handoff that keeps the entity alive in both zones during transit eliminates the gap at the cost of a brief period of dual ownership.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Entity ownership follows the state machine `OWNED → STAGING → OWNED`. The origin zone drives the transition:

1. **Detect crossing.** Each physics tick, the origin zone evaluates every occupied slot's Hilbert code against its own range boundary. When a slot's code falls outside the range, the zone initiates a handoff.

2. **Open a STAGING channel.** The origin zone opens a reliable bidirectional stream to the destination zone and sends the entity's full slot payload (96 bytes: position, rotation, velocity, entity type, payload UUIDs). The destination zone allocates a slot and responds with an acknowledgement carrying the assigned slot index.

3. **Dual ownership window.** Between the origin's send and the destination's acknowledgement, the entity is live in both zones. Clients subscribed to the origin zone continue to receive position updates from it. Clients subscribed to the destination zone begin receiving them from there once the destination's slot is active.

4. **Release.** On receiving the acknowledgement, the origin zone marks the slot as `FREE` and stops broadcasting it. The destination zone transitions its slot from `STAGING` to `OWNED`.

The acknowledgement timeout uses adaptive RTO computed with the Jacobson/Karels algorithm from the measured round-trip times on the inter-zone stream. If the timeout fires, the origin zone retries the handoff packet. If the destination zone has already allocated a slot for the entity (detected via the entity UUID), it responds with the existing slot index rather than allocating a second one.

After a successful handoff, the destination zone updates its ghost-based interest map. Neighbouring zones that overlap the entity's ghost bounding volume receive a `CH_INTEREST` broadcast and begin receiving state updates.

## The Benefits

Entities cross zone boundaries without a visible gap. The adaptive RTO handles latency variance between zones on the same host or across a LAN without requiring a fixed timeout that would be too tight in some conditions and too loose in others.

## The Downsides

The dual-ownership window means that for a short period two zones are authoritative for the same entity. If the entity receives input during that window — for example, a player moving — the origin zone processes it and must forward it to the destination zone before releasing the slot. This adds one extra packet to the handoff for entities under active input.

A zone crash during the handoff leaves the entity in `STAGING` indefinitely. The `FabricZoneJournal` records the `STAGING` state; on restart, the zone replays the mutation log and retries the handoff. See `20260421-sqlite-per-zone-journal.md`.

## The Road Not Taken

Teleporting the entity (despawn + respawn with no overlap) is simpler to implement but produces a one-tick gap visible to all subscribers. For position-interpolated entities the gap manifests as a pop. For entities under physics simulation it can also produce a velocity discontinuity.

## The Infrequent Use Case

An entity that oscillates back and forth across a boundary — for example, a physics object bouncing at a zone edge — can trigger repeated handoffs. The zone tracks the last handoff timestamp per slot and imposes a minimum interval (one physics tick) before initiating another. This prevents a thundering-herd of handoff packets for a single jittery entity.

## In Core and Done by Us

The handoff logic lives in `FabricZone` (`modules/multiplayer_fabric/`). The Hilbert partitioning and boundary evaluation are code-generated from the Lean 4 specification in `predictive_bvh.h`. The ghost-interest broadcast after handoff is handled by `FabricMMOGZone` (`modules/multiplayer_fabric_mmog/`).

## Status

Status: Accepted

## Decision Makers

- iFire

## Tags

- Zone, Handoff, STAGING, Hilbert, Entity, Migration, Interest, FabricZone
