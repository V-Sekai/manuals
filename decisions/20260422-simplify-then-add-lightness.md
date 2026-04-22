# Simplify, Then Add Lightness

## The Context

Zack Anderson applied Colin Chapman's racecar design philosophy — "add lightness" — to hardware engineering at Tesla. Chapman's principle was that performance comes from removing mass, not adding power. Anderson extended it: before optimising a system, question whether the requirement that made it necessary should exist at all. multiplayer-fabric adopts this as its primary design heuristic.

## The Problem Statement

Engineering teams default to addition. A feature is slow, so a cache is added. A boundary is unclear, so a coordinator is added. Each addition feels local and justified, but the accumulated mass raises the cost of every future change. The learning loop — the cycle from hypothesis to measured outcome — tends to lengthen with each layer.

## The Principle

Simplify first. Then, if weight must be added, add it deliberately and with full awareness of the cost.

It is a sequencing rule: subtraction before addition, question before implement.

### Core lessons

#### Question and subtract requirements

Before implementing anything, examine which parts of the spec are not absolutely necessary. A requirement that cannot survive scrutiny should not survive implementation. The best code for an unnecessary feature is no code.

#### Sequence your risks

Early prototypes are scientific experiments designed to retire specific risks in order — not to prove everything at once. The question is: what is the one thing most likely to make this not work? Retire that first. Build the rest afterward.

#### Insource the uncertain

Mature, well-understood components can be delegated to libraries or services. Core uncertainties — the things that define whether the project works at all — stay in-house, where they can be directly observed and changed without a support contract.

#### Shift complexity into software

Physical complexity (hardware, infrastructure, topology) is expensive to change. Computational complexity is cheap to change. When a choice exists between a hardware constraint and a software constraint, prefer the software constraint. This is why multiplayer-fabric replaces session coordinators with Hilbert curve arithmetic.

#### Compress learning loops

Distance between the engineer and the running system is a tax on speed. The larger that distance — in abstraction layers or deployment steps — the slower the feedback.

#### Maintain organisational lightness

A team small enough to share context naturally does not need process to substitute for communication. Process is the organisational equivalent of a cache: useful when direct access is too expensive, dangerous when it becomes the primary path.

## Application to multiplayer-fabric

The Hilbert broadphase eliminates the session coordinator; formal verification covers bit-manipulation correctness across engine upgrades. Content-addressed delivery and ReBAC each subtract a moving part from the accounting and permission layers respectively.

The zone boundary model is the direct expression of this heuristic: instead of a matchmaker that routes players to servers, the geometry determines adjacency. The coordinator mass is zero.

## The Road Not Taken

The alternative is to keep adding. Add a coordinator, then a coordinator monitor, then a fallback coordinator, then a configuration system to manage which coordinator is primary. This is the industry default, and it works — but any engineer touching zone topology must understand five systems instead of one curve.

## Status

Status: Active

## Decision Makers

- iFire

## Tags

- Philosophy, Design, Simplicity, Lightness, Contributing, Heuristics
