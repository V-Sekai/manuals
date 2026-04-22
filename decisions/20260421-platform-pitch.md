# Platform Pitch

## The Context

multiplayer-fabric is a Godot module that puts zone authority, interest filtering, and entity migration into the Godot scene tree. This document states the competitive position for sponsor and partner conversations.

## The Problem Statement

No native MMOG networking exists for Godot. Unity and Unreal outsource this to middleware — Photon, PlayFab, Pragma — that charges per peak CCU and owns the session data. Operators have no self-hosted alternative.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

**Early.**
Godot has no native MMOG networking. The zone partitioning, interest relay, and migration protocol are implemented. The VR demo, asset streaming, and load testing are not yet done.

**10× better (not yet measured).**
A 30-bit Hilbert partition is designed to replace the coordinator, match-maker, and session database that competing stacks require. Interest relay copies each packet once per physical link, not once per subscriber. The target is 1,000 concurrent players across five commodity machines with 12.5% headroom, 100-byte entity state, zero orchestrator. Fan-out has not been measured. The 1,000-player target has not been load-tested. See `20260421-virtual-creator-market-implementation-plan.md` for the measurement plan.

**Survives longer.**
Ships as a Godot module under MIT. No per-seat fee, no runtime royalty, no vendor kill-switch. The Hilbert transforms are formally verified in Lean 4 and code-generated to C and Rust, so the core math does not rot when the engine upgrades. Asset delivery uses content-addressed chunk stores served by Uro with ReBAC permissions.

## The Benefits

No competing self-hosted solution exists for Godot at this scope. Operators keep session data, set their own pricing, and are not subject to middleware ToS changes or shutdown risk.

## The Downsides

The 10× claims are targets, not measurements. Sponsors must be told explicitly what is done and what is not. The honest pitch is: the hard parts (broadphase, migration, formal proofs) are done; the demo, asset streaming, and load testing are not.

## The Road Not Taken

Wrapping an existing middleware SDK (Photon, Nakama) would produce a working demo faster but would not retire the core thesis — that a Hilbert-partitioned zone mesh can replace a coordinator at commodity hardware cost. The thesis is the IP; the demo proves it.

## The Infrequent Use Case

A sponsor evaluating multiplayer-fabric for a non-VR, non-MMOG application (e.g. a turn-based game with small lobbies) gets no benefit from the Hilbert broadphase or migration protocol. The pitch is specifically for applications with large simultaneous entity counts and continuous space.

## In Core and Done by Us

- Zone partitioning, interest relay, migration protocol — implemented
- Hilbert transforms — formally verified in Lean 4, code-generated
- Uro ReBAC asset permissions — implemented
- VR demo, asset streaming, load test — not yet done (see implementation plan)

## Status

Status: Active

## Decision Makers

- iFire

## Tags

- Pitch, Sponsor, Positioning, Competitive, MMOG, Godot

## Further Reading

1. `20260421-product-virtual-creator-market.md` — product strategy
2. `20260421-virtual-creator-market-implementation-plan.md` — what is done and what remains
3. `20260421-multiplayer-fabric-zone-architecture.md` — zone infrastructure detail
