# Multiplayer Fabric Strategy

## The Context

Own the smallest viable market completely, then grow.

A well-funded company once pitched a distributed simulation platform as an OS for game worlds, arguing that existing servers could never make a world feel real. Two flagship games launched and failed, and the platform shut down because the architecture was wrong: it sat above the engine and tried to abstract the spatial problem away. Latency, interest management, and zone state cannot be separated from the engine — they are game problems that must be solved inside it. The spatial simulation problem is real and nobody has solved it this way. Multiplayer Fabric fills that gap: the same ambition, built as Godot modules instead of a cloud layer.

## The Problem Statement

No production-ready zone-border handoff exists outside one proprietary engine, and the absence is structural. The delta-sync approach from OS image distribution solves game asset delivery mathematically, but the game-engine integration has never been built. Relationship-based access control tooling is mature; adoption in game backends is zero.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

No shipped Godot project uses WebTransport as its primary transport. Multiplayer Fabric has it wired, which is a concrete head start on the only production implementation.

A working zone server with WebTransport, content-addressed delivery, and relationship-based permissions is the wedge for solo Godot developers. Design documentation for each built component is in `manuals/decisions/`.

## The Road Not Taken

Building above the engine as a cloud layer, as the prior attempt did. The abstraction leaks under real load.

## Status

Status: Accepted

## Decision Makers

- iFire

## Tags

- Strategy, Architecture, WebTransport, Zone, ReBAC, casync
