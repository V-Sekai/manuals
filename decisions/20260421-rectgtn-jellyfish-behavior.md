# RECTGTN Planning for Jellyfish Behavior

## The Context

`taskweft` is a C++20 library exposed as an Erlang NIF. Its current use in the zone server is limited to `check_rel()` for ReBAC authorization at join time and `CMD_INSTANCE_ASSET`. The library implements the full **Relationship-Enabled Capability-Temporal Goal-Task-Network** (RECTGTN) formalism: conjunctive and multi-goal decomposition, compound task methods with per-method alternatives, incremental replanning via a solution tree, ISO 8601 duration constraints, and stochastic Monte Carlo execution. All of this is available in `standalone/tw_planner.hpp` and companions — header-only, no BEAM round-trip required.

In `CONCEPT_MMOG.md`, HTN planning was tombstoned because the godot-sandbox RISC-V guest path was out of scope. The sandbox path remains out of scope. The standalone header path is not.

The aquarium zone server runs a C++ swarm simulation (`JellygridSwarm::tick()`) that drives jellyfish with hard-coded phase-based behaviour: pulse bob, current drift, predator flee. The behaviour is correct but fixed — every jellyfish of the same species behaves identically and the planner cannot adapt to zone state changes.

## The Problem Statement

Jellyfish behaviour is table-driven. There is no mechanism to sequence multi-step behaviour (flee → hide → resume drift), handle temporal cooldowns between state changes, or vary behaviour by entity capability (a bioluminescent jellyfish near a light source behaves differently from one in darkness). RECTGTN planning covers all three.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

### Domain per species

Each jellyfish species is a JSON-LD RECTGTN domain stored as a file in the zone asset bundle:

```json
{
  "@context": "https://taskweft.v-sekai.org/domain/v1",
  "state": {
    "location": "open_water",
    "threat_nearby": false,
    "light_level": "dim",
    "pulse_cooldown": 0
  },
  "tasks": {
    "behave": [
      { "method": "flee", "precond": { "threat_nearby": true }, "subtasks": ["flee_predator", "recover"] },
      { "method": "seek_light", "precond": { "light_level": "bright" }, "subtasks": ["drift_toward_light", "pulse"] },
      { "method": "idle", "precond": {}, "subtasks": ["drift_current"] }
    ]
  },
  "actions": {
    "flee_predator":      { "duration": "PT2S",  "effects": { "location": "shelter" } },
    "recover":            { "duration": "PT5S",  "effects": { "threat_nearby": false } },
    "drift_toward_light": { "duration": "PT3S",  "effects": { "location": "light_source" } },
    "pulse":              { "duration": "PT1S",  "effects": { "pulse_cooldown": 3 } },
    "drift_current":      { "duration": "PT4S",  "effects": {} }
  }
}
```

### Zone server integration

The zone server links `standalone/tw_planner.hpp` directly. No BEAM round-trip occurs during simulation.

```cpp
// In FabricMMOGZone — per-entity, called when current plan completes or environment changes
void FabricMMOGZone::_replan_jellyfish(int p_entity_id) {
    TwDomain domain = TwLoader::load_json_str(_species_domains[p_entity_id]);
    TwState  state  = _build_entity_state(p_entity_id); // reads zone sim state
    TwPlan   plan   = tw_plan(domain, state, {"behave"});
    _entity_plans[p_entity_id] = plan;
    _entity_plan_step[p_entity_id] = 0;
}
```

`_replan_jellyfish()` is called once per behaviour change, not per tick. The running plan's current action drives `JellygridSwarm::tick()` for the action's duration; the planner is invoked again only when the action completes or a threat sensor fires.

### Incremental replan on environment change

When a predator enters the AOI of a jellyfish mid-plan:

```cpp
void FabricMMOGZone::_on_threat_detected(int p_entity_id) {
    TwState new_state = _build_entity_state(p_entity_id);
    new_state.set("threat_nearby", true);
    TwPlan new_plan = tw_replan_incremental(
        _species_domains[p_entity_id],
        _entity_plans[p_entity_id],
        _entity_plan_step[p_entity_id],
        new_state
    );
    _entity_plans[p_entity_id] = new_plan;
}
```

`tw_replan_incremental()` backtracks at the nearest retryable method choice in the solution tree rather than restarting from the root. For short plans (3–5 actions) this is effectively free.

### Temporal constraints

The domain encodes action durations as ISO 8601 strings. `tw_check_temporal()` validates the current plan against an origin timestamp before committing it. This prevents scheduling a 5-second recovery immediately before a zone-tick deadline.

### Capability gating via ReBAC

A species domain can include capability preconditions:

```json
"seek_light": {
  "precond": { "light_level": "bright" },
  "requires_capability": "BIOLUMINESCENT"
}
```

Before executing `seek_light`, the zone server calls the existing `check_rel()` on the entity's capability graph. Non-bioluminescent jellyfish never decompose into `seek_light` — the planner picks `idle` instead.

### No sandbox

The godot-sandbox RISC-V guest (`taskweft_planner.cpp`) is not used. The standalone headers compile into `fabric_mmog_zone.cpp` directly. Behaviour domains are loaded from the zone asset bundle at zone startup and cached in `_species_domains`.

## The Benefits

Multi-step behaviour emerges from the domain definition without C++ case logic. Adding a new species is a new JSON-LD file. Temporal constraints prevent physically impossible action sequences. Incremental replan handles dynamic threats without restarting from the root. ReBAC capability gating unifies entity permissions with entity behaviour.

## The Downsides

Each entity carries a live plan and a solution tree. At 511 jellyfish, memory per entity must be bounded. Plans longer than 8 steps should not be generated — a domain with long decomposition chains will be capped at `TW_MAX_DEPTH = 8` (configurable, default 256 upstream). The planner is not called per tick so this is not a throughput concern; it is a latency concern on replan when many entities detect the same threat simultaneously.

## The Road Not Taken

Running the planner on zone-backend via the BEAM NIF (`plan/1`) was considered but breaks the ACID properties of the zone. A zone's entity state is computed under a specific domain: action effects, state keys, and method preconditions are all encoded there. Hot-pushing a new domain to a running zone leaves the entity state in a configuration the new domain did not produce. Plans generated under the new domain may reference state keys that do not exist or have effects that contradict current simulation invariants. The domain and the zone state machine are a unit; they can only be swapped together, at zone startup or after a full entity state reset. The C++ direct path enforces this naturally — a domain change requires a zone server restart.

## The Infrequent Use Case

A zone with no jellyfish entities (empty zone during off-peak hours) allocates no plan storage and never calls the planner. A zone operating at maximum entity count (1,800 slots) with all slots occupied by jellyfish exercises the worst case: up to 1,800 simultaneous replan calls on a single threat broadcast. A batched replan queue (process N entities per tick, rotate) mitigates this.

## In Core and Done by Us

- `multiplayer-fabric-taskweft/standalone/` — link directly into zone server build; no new code required
- `fabric_mmog_zone.cpp` — `_replan_jellyfish()`, `_on_threat_detected()`, `_entity_plans`, `_entity_plan_step`, `_species_domains`
- `fabric_mmog_zone.h` — `HashMap<int, TwPlan>`, `HashMap<int, int>`, `HashMap<String, TwDomain>`
- Species domain files — `assets/domains/jellyfish_common.jsonld`, `jellyfish_bioluminescent.jsonld`
- `JellygridSwarm::tick()` — read current action from plan rather than hard-coded phase table

## Status

Status: Proposed

## Decision Makers

- iFire

## Tags

- RECTGTN, HTN, Planning, taskweft, Jellyfish, ZoneServer, C++, Behavior, Swarm, Incremental Replan

## Further Reading

1. `multiplayer-fabric-taskweft/standalone/tw_planner.hpp` — `tw_seek_plan()`, `tw_plan_with_tree()`
2. `multiplayer-fabric-taskweft/standalone/tw_replan.hpp` — `tw_replan_incremental()`
3. `multiplayer-fabric-taskweft/standalone/tw_soltree.hpp` — solution tree checkpoint/restore
4. `multiplayer-fabric-taskweft/lean/Planner.lean` — formal RECTGTN specification
5. `20260421-rebac-zone-server-enforcement.md` — ReBAC capability checks at join and instance time
6. `multiplayer-fabric-godot/modules/multiplayer_fabric_mmog/CONCEPT_MMOG.md` — aquarium PoC scope
