# Relationship-Based Access Control for Zone Permissions

## The Context

Zone servers and the backend need to decide whether a player may observe, interact with, or modify a zone entity. The decision depends on the relationship between the player and the entity's owner — a group member inherits the group's permissions transitively. The authority zone is the local coordinator for all permission decisions about its entities; no global coordinator is required. The full formal specification lives in `multiplayer-fabric-predictive-bvh/PredictiveBVH/Relativistic/ReBAC.lean` and `NoGod.lean`.

## The Problem Statement

Flat role tables require a separate row for every (user, permission) pair that inheritance would otherwise cover. As group structure deepens, maintaining that table becomes inconsistent. A relation ranked by trust level, evaluated at request time against a player's claim, gives correct transitive answers without stored derived state.

## Design

### Action tiers

Three action tiers map to a minimum required relation rank:

```lean
-- ReBAC.lean
inductive Action where
  | observe   -- read-only (CH_INTEREST); public by default
  | interact  -- send input (movement, chat); requires instanceMember+
  | modify    -- mutate state (admin, owner-only); requires owner
```

### Relation hierarchy

Relations are totally ordered by trust rank:

```lean
inductive Relation where
  | public         -- rank 0
  | instanceMember -- rank 1
  | friend         -- rank 2
  | guildMember    -- rank 3
  | owner          -- rank 4
```

`minRelation` maps each action to its minimum required rank. `rebacCheck` folds the player's claim to its maximum relation and compares ranks:

```lean
def rebacCheck (claim : PlayerClaim n) (action : Action) : Bool :=
  match claim.maxRelation with
  | none   => false
  | some r => r.rank ≥ action.minRelation.rank
```

### Key theorems

```lean
theorem rebac_empty_denied : rebacCheck { relations := [] } a = false

theorem rebac_public_observe : rebacCheck { relations := [.public] } .observe = true

theorem rebac_owner_all (a : Action) : rebacCheck { relations := [.owner] } a = true

theorem rebac_monotone {n : Nat} (c : PlayerClaim n) (a1 a2 : Action)
    (hle : a2.minRelation.rank ≤ a1.minRelation.rank)
    (h : rebacCheck c a1 = true) :
    rebacCheck c a2 = true
```

### Authority locality

The check is only binding when the evaluating zone is the authority zone for the entity's Hilbert code:

```lean
-- ReBAC.lean
theorem rebac_requires_authority_for_mutation :
    isAuthority view h = false → action ∈ [.interact, .modify] →
    rebacCheck claim action = true →
    ¬ bindsMutation view h claim action

theorem interest_can_answer_observe :
    rebacCheck claim .observe = true →
    geometricInterest view h 0 ≠ [] →
    canAnswer view h claim .observe

theorem non_authority_cannot_bind_mutation :
    isAuthority view h = false →
    ∀ claim, ¬ bindsMutation view h claim .modify
```

Interest zones answer `.observe` requests directly. `.interact` and `.modify` requests are forwarded to the authority zone.

### Player claims carry causal timestamps

```lean
structure PlayerClaim (n : Nat) where
  playerId  : Nat
  relations : List Relation
  issuedAt  : VClock n    -- causal timestamp
```

Claims are issued at the authority zone and carried with the VClock so receiving zones can determine whether the claim is stale relative to the local gossip state.

### Upload permissions (backend)

On `zone-backend`, the same relation graph is evaluated by the `taskweft` C++20 NIF. Membership edges (`IS_MEMBER_OF`) are built per-request from the `UserPrivilegeRuleset` record and evaluated with `check_rel/4`. The per-request build means no cache invalidation problem; the NIF tears the graph down after the call returns. 93 PropCheck properties cover path existence, absence, cycles, and transitivity.

## The Benefits

Permission checks require no coordinator. The authority zone evaluates claims locally using its gossip-learned range map. Interest zones serve read queries without forwarding. Adding a player to a group takes effect on the next claim issuance without any cache flush.

## The Downsides

Rebuilding the relation graph per upload request adds a database query per check. For upload endpoints this cost is acceptable; it would not be acceptable on a high-frequency read path. The `taskweft` NIF crashes the BEAM VM on a C++ panic — the PropCheck suite reduces that risk but does not eliminate it.

## The Road Not Taken

A denormalized ACL table (user × permission) avoids the per-request graph build but requires a write on every group membership change and can produce inconsistent reads mid-request if a membership change races with a permission check.

## The Infrequent Use Case

A player belonging to a deeply nested group chain (depth > 10) triggers a correspondingly deep traversal in `taskweft`. The Lean proofs in `ReBAC.lean` do not impose a depth limit; the PropCheck suite exercises chains up to depth 20 without regression.

## In Core and Done by Us

Lean specification: `multiplayer-fabric-predictive-bvh/PredictiveBVH/Relativistic/ReBAC.lean` and `NoGod.lean`.

Runtime:
- `taskweft` C++20 NIF — per-request IS_MEMBER_OF graph evaluation for upload permissions
- `Uro.VSekai.check_upload_permission/2` — call site in `multiplayer-fabric-zone-backend`
- `FabricZone` evaluates `rebacCheck` locally for in-zone action gating

## Status

Status: Accepted

## Decision Makers

- iFire

## Tags

- ReBAC, Permissions, Lean4, Formal, taskweft, NIF, Action, Relation, Authority, VClock, 20260421-rebac-permissions
