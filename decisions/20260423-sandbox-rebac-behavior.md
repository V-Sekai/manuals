# Sandbox + ReBAC Capability Gating for Creator Behavior Code

## The Context

Jellyfish behavior is currently expressed as JSON-LD domain files: a fixed
action vocabulary baked into the zone asset, evaluated by the RECTGTN planner
in trusted C++. The planner is the safe interpreter — a malicious domain can
only name actions that already exist in the loaded domain, so no sandbox is
needed for this path.

If creators are permitted to submit **executable behavior code** — GDScript
programs or RISC-V ELF kernels that run inside the zone server — the threat
model changes. Arbitrary computation requires memory isolation (sandbox) and
semantic isolation (ReBAC capability gating). This ADR designs that path for
when it is needed.

## The Problem Statement

A creator behavior kernel running inside the zone server can:
- Consume unbounded CPU or memory
- Read entity state it should not see
- Emit network messages it is not authorised to send
- Escalate from `observe` to `modify` without authorisation

JSON-LD domains cannot do any of these things. An executable kernel can do all
of them without containment.

## The Decision

Creator behavior code runs inside `godot-sandbox` (RISC-V ELF). The sandbox
provides memory isolation and a syscall interface. ReBAC gates every capability
the sandbox can request at runtime. The combination gives:

- — sandbox fault cannot corrupt zone state
- — the kernel can only exercise capabilities the ReBAC
  graph permits for the entity it is animating

## How it works

### Capability request syscall

The sandbox exposes one new syscall to behavior kernels:

```c
// Inside the RISC-V behavior kernel (creator-written)
bool bioluminescent = sandbox_request_capability("BIOLUMINESCENT");
if (bioluminescent) {
    sandbox_move_toward_light();
}
```

The zone server intercepts `sandbox_request_capability`:

```cpp
bool FabricMMOGZone::_sandbox_capability_handler(
    int p_entity_id, const String &p_capability)
{
    // Build a minimal per-request ReBAC graph for this entity.
    TwGraph graph = tw_graph_new();
    for (const auto &cap : _entity_capabilities[p_entity_id]) {
        tw_graph_add_edge(graph, entity_str(p_entity_id),
                         cap, "HAS_CAPABILITY");
    }
    return tw_check_rel(graph, entity_str(p_entity_id),
                        "HAS_CAPABILITY", p_capability.utf8().get_data());
}
```

The ReBAC graph is built from `_entity_capabilities` — a per-entity list
populated at `CMD_INSTANCE_ASSET` time from the asset's `CAN_INSTANCE` and
`HAS_CAPABILITY` edges. No database call occurs inside the tick.

### Sandbox invocation per tick

```cpp
void FabricMMOGZone::_tick_sandbox_entity(int p_entity_id, double p_delta) {
    Sandbox &sb = _entity_sandboxes[p_entity_id];
    sb.set_userdata("entity_id", p_entity_id);
    sb.set_userdata("delta",     p_delta);
    sb.vmcall("tick"); // calls creator-defined tick() function
}
```

`tick()` budget is enforced by the sandbox instruction counter — a kernel that
exceeds the budget is suspended and resumed next tick, not killed.

### ReBAC relations used

| Relation | Subject | Object | Meaning |
|---|---|---|---|
| `HAS_CAPABILITY` | entity | capability name | entity may exercise this capability |
| `CAN_INSTANCE` | player | asset | player may instance this asset in the zone |

`HAS_CAPABILITY` edges are set at instance time from the asset's capability
list. The sandbox handler checks them per-request. No new relation types are
needed beyond those already defined.

### JSON-LD domains and sandbox domains coexist

| Input type | Executor | Security |
|---|---|---|
| JSON-LD domain | RECTGTN planner (C++) | Planner is the interpreter — no sandbox needed |
| RISC-V ELF kernel | godot-sandbox | Memory isolation + ReBAC capability gating |

Zone server detects the input type from the asset manifest at startup. A zone
can contain entities of both types simultaneously.

## What is not changed

- The JSON-LD planner path is unchanged. Existing jellyfish domains work as
  before.
- ReBAC enforcement at join time (`CAN_ENTER`) and instance time
  (`CAN_INSTANCE`) is unchanged.
- The `requires_capability` field in JSON-LD domains already gates planner
  decomposition via `check_rel` — that remains the mechanism for data-driven
  behavior.

## The Benefits

Creator behavior code can be arbitrary programs. Memory isolation prevents zone
corruption. ReBAC ensures a bioluminescent kernel only accesses bioluminescent
capabilities even if the creator's code contains a bug or deliberate escalation
attempt. The capability check is O(1) against an in-memory graph built once at
instance time.

## The Downsides

RISC-V ELF compilation is a new requirement for creators who want executable
behavior. The sandbox instruction budget must be tuned per species — a budget
too small breaks smooth animation; too large allows DoS. The capability graph
is rebuilt per-request inside the syscall handler, which is cheap for short
capability lists but grows linearly with the list length.

## The Road Not Taken

Running creator behavior as GDScript without the sandbox exposes the full Godot
API surface to creator code. A single `get_tree().quit()` call would terminate
the zone server. The sandbox is not optional for executable creator code.

## Status

Status: Proposed

## Decision Makers

- iFire

## Tags

- sandbox, ReBAC, HAS_CAPABILITY, godot-sandbox, RISC-V, behavior, security,, 20260423-sandbox-rebac-behavior
  creator-code, jellyfish
