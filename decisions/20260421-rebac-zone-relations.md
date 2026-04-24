# ReBAC Zone Entry and Asset Instancing Relations

## The Context

The existing ReBAC system (`taskweft`) defines seven base relation types: `HAS_CAPABILITY`, `CONTROLS`, `OWNS`, `IS_MEMBER_OF`, `DELEGATED_TO`, `SUPERVISOR_OF`, `PARTNER_OF`. The Lean specification in `ReBAC.lean` defines action tiers (`observe`, `interact`, `modify`) and relation ranks. Zone entry and per-asset instancing require two additional relations not yet present.

## The Problem Statement

The zone server has no predicate to check when a player connects to a zone or sends `CMD_INSTANCE_ASSET`. Without named relations for these two decisions, `check_rel/4` cannot be called with a meaningful predicate, and the existing relation set cannot be mapped to the required access decisions.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Add two relation types to the valid set in `taskweft/rebac.ex`:

```elixir
# existing
@valid_relations ~w[HAS_CAPABILITY CONTROLS OWNS IS_MEMBER_OF DELEGATED_TO SUPERVISOR_OF PARTNER_OF]

# proposed additions
@valid_relations @valid_relations ++ ~w[CAN_ENTER CAN_INSTANCE]
```

**CAN_ENTER** — checked at zone join time (when a peer connects to a zone server).

Default graph edges built per-request:

```
zone_owner -[OWNS]-> zone
player     -[CAN_ENTER]-> zone   # derived: OWNS implies CAN_ENTER
```

Public zones have an implicit `*` subject that grants `CAN_ENTER` to any player. Restricted zones omit this edge; only players with an explicit edge or a chain through `OWNS`/`IS_MEMBER_OF` may enter.

**CAN_INSTANCE** — checked at `CMD_INSTANCE_ASSET` time by the authority zone before slot allocation.

```
uploader -[OWNS]-> asset
player   -[CAN_INSTANCE]-> asset   # derived from OWNS
```

The graph is rebuilt per-request from `UserPrivilegeRuleset` at join time, consistent with the existing per-request pattern. No graph state persists between requests.

Zone server C++ call sites (see `20260421-rebac-zone-server-enforcement.md`):

```cpp
// At peer join
check_rel(graph_json, player_id, "CAN_ENTER", zone_id)

// At CMD_INSTANCE_ASSET before slot allocation
check_rel(graph_json, player_id, "CAN_INSTANCE", asset_id)
```

## The Benefits

The two new relations map cleanly onto existing `check_rel/4` call convention. No new graph traversal semantics are needed — both are simple base relation checks. The default edges (public zone = open entry, uploader = can instance) preserve current behaviour while enabling restriction.

## The Downsides

Adding relation types to the valid set requires updating the PropCheck suite in `taskweft` to cover the new predicates. The 93 existing properties cover path existence, absence, cycles, and transitivity; `CAN_ENTER` and `CAN_INSTANCE` need equivalent coverage.

## The Road Not Taken

Reusing `OWNS` as the instancing predicate (`check_rel(graph, player, "OWNS", asset)`) would work for owner-only assets but cannot express "any member of this group may instance this asset" without adding group-to-asset ownership edges. `CAN_INSTANCE` is more expressive and does not conflate ownership with permission.

## The Infrequent Use Case

An asset owned by a group (`group -[OWNS]-> asset`) rather than a user requires a chain: `player -[IS_MEMBER_OF]-> group -[OWNS]-> asset`. `check_rel` follows this chain with `tuple_to_userset` expansion. The `fuel` parameter (default 8) limits depth; group chains deeper than 8 require increasing the fuel value.

## In Core and Done by Us

- `multiplayer-fabric-taskweft/lib/taskweft/rebac.ex` — add `CAN_ENTER`, `CAN_INSTANCE` to valid set
- PropCheck suite — add properties for both new relation types
- `Uro.VSekai.check_upload_permission/2` — extend to build `CAN_INSTANCE` edges

## Status

Status: Accepted

## Decision Makers

- iFire

## Tags

- ReBAC, taskweft, CAN_ENTER, CAN_INSTANCE, Relations, Permissions, Zone, Asset

## Further Reading

1. `20260421-rebac-permissions.md` — base ReBAC design
2. `20260421-rebac-zone-server-enforcement.md` — call sites in C++ zone server
3. `multiplayer-fabric-taskweft/lib/taskweft/rebac.ex`
4. `multiplayer-fabric-predictive-bvh/PredictiveBVH/Relativistic/ReBAC.lean`
