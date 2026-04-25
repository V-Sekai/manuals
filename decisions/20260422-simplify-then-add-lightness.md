# Simplify, Then Add Lightness

## The Context

Zack Anderson applied Colin Chapman's racecar principle — "add lightness" — to hardware engineering at Tesla. Chapman's insight: performance comes from removing mass, not adding power. Anderson extended it: before optimising a system, question whether the requirement that made it necessary should exist at all. multiplayer-fabric adopts this as its primary design heuristic.

## The Problem

Engineering teams default to addition. A feature is slow, so a cache is added. A boundary is unclear, so a coordinator is added. Each addition feels justified; the accumulated mass raises the cost of every future change and lengthens the feedback loop.

## The Principle

Subtract before you add. When weight must be added, add it deliberately and with full awareness of the cost.

### Core lessons

#### Question and subtract requirements

A requirement that cannot survive scrutiny should not survive implementation. The best code for an unnecessary feature is no code.

#### Sequence your risks

Early prototypes retire specific risks in order — not everything at once. Identify the one assumption most likely to invalidate the design; retire that first.

#### Insource the uncertain

Delegate mature, well-understood components to libraries or services. Keep core uncertainties in-house where they can be observed and changed directly.

#### Shift complexity into software

Physical complexity — hardware, infrastructure, topology — is expensive to change. Computational complexity is cheap. This is why multiplayer-fabric replaces session coordinators with Hilbert curve arithmetic.

#### Compress learning loops

Abstraction layers and deployment steps are a tax on feedback speed. Minimise the distance between the engineer and the running system.

#### Maintain organisational lightness

A team small enough to share context naturally needs no process to substitute for communication. Process is a cache: useful when direct access is too expensive, dangerous when it becomes the primary path.

## Application to multiplayer-fabric

The Hilbert broadphase eliminates the session coordinator. Formal verification covers bit-manipulation correctness across engine upgrades. Content-addressed delivery (casync/desync) and ReBAC each subtract a moving part from delivery and permission accounting respectively.

The zone boundary model is the direct expression of this heuristic: geometry determines adjacency; coordinator mass is zero.

## The Road Not Taken

The alternative — coordinator, coordinator monitor, fallback coordinator, configuration system — works, but any engineer touching zone topology must understand five systems instead of one curve.

## Audit Checklist

Before adding any component, layer, or dependency, answer these questions:

- [ ] Can the requirement driving this addition be removed instead?
- [ ] Is this the one risk that must be retired first, or can it wait?
- [ ] Does this belong in-house (uncertain, core) or can it be delegated?
- [ ] Is this complexity physical/infrastructural, or can it be pushed into software?
- [ ] Does this shorten or lengthen the feedback loop?
- [ ] Does this require a new system to monitor or manage it?

If any answer points toward addition without a clear necessity, subtract first.

## Status

Status: Active

## Decision Makers

- iFire

## Tags

- Philosophy, Design, Simplicity, Lightness, Contributing, Heuristics, 20260422-simplify-then-add-lightness
