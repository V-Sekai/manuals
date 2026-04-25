# ReBAC Enforcement in the Zone Server

## The Context

The zone architecture specifies that `CMD_INSTANCE_ASSET` is owner-only and that `observe` is public. The zone controller documentation states: `"modify" => "owner only — only the uploader may instance their own asset"`. The C++ implementation in `fabric_mmog_zone.cpp::_on_cmd_instance_asset()` does not call `check_rel` before allocating a slot.

## The Problem Statement

The documentation and the code are inconsistent. Any connected player can instance any asset regardless of ownership. The enforcement gap exists at two boundaries: zone join (no `CAN_ENTER` check) and `CMD_INSTANCE_ASSET` (no `CAN_INSTANCE` check).

## Design

### Zone join (peer connect)

In `FabricMMOGZone::_on_peer_connected(int p_peer_id)`, before the peer is admitted to the simulation:

```cpp
String graph_json = _fetch_rebac_graph(p_peer_id); // HTTP GET /rebac/graph?player=p_peer_id&zone=_zone_id
bool can_enter = Taskweft::check_rel(graph_json, p_peer_id, "CAN_ENTER", _zone_id);
if (!can_enter) {
    disconnect_peer(p_peer_id, /* force= */ true);
    return;
}
_player_graphs[p_peer_id] = graph_json; // cache for duration of session
```

The graph is fetched once at join time and stored in `_player_graphs` (a per-zone map). It is invalidated when the zone server receives an explicit `CMD_INVALIDATE_PERMISSIONS` packet or when the peer disconnects.

### CMD_INSTANCE_ASSET (slot allocation)

In `FabricMMOGZone::_on_cmd_instance_asset()`, before `_allocate_entity_slot()`:

```cpp
const String &graph_json = _player_graphs[p_player_id];
bool can_instance = Taskweft::check_rel(graph_json, p_player_id, "CAN_INSTANCE", asset_id_str);
if (!can_instance) {
    return; // silently discard; no slot allocated
}
// existing allocation logic follows
```

`Taskweft::check_rel` is a C++ wrapper around the existing NIF call; no BEAM round-trip occurs on the zone server — the zone server calls the shared library directly.

### Per-tick constraint

No ReBAC call is issued from the physics loop. The cached graph in `_player_graphs` is the only permitted access point during simulation. Live `taskweft` queries from the physics loop are prohibited (see [20260421-rebac-permissions.md](20260421-rebac-permissions.md)).

### Graph invalidation

Zone-backend broadcasts `CMD_INVALIDATE_PERMISSIONS` on the zone's Phoenix Channel when a `UserPrivilegeRuleset` changes. The zone server evicts the affected player's graph entry; the next per-action check triggers a re-fetch.

## The Benefits

Enforcement is local to the authority zone with no per-tick cost. The graph cache eliminates repeated HTTP calls for the same player within a session. The join-time check is the natural enforcement point: a player who cannot enter never reaches `CMD_INSTANCE_ASSET`.

## The Downsides

The graph cache can be stale for the window between a permission revocation and the `CMD_INVALIDATE_PERMISSIONS` delivery. This is the "New Enemy Problem" inherent to distributed ReBAC — no synchronous distributed solution exists at game tick frequency.

## The Road Not Taken

A per-packet signature from zone-backend (capability token) would eliminate the staleness window but requires a cryptographic verify on every `CMD_INSTANCE_ASSET` call. At 20 Hz and up to 1,800 entities this is acceptable, but the token distribution mechanism adds complexity. The graph-cache approach matches what `taskweft` already does for upload permissions.

## The Infrequent Use Case

A player whose permissions change mid-session (e.g. removed from a group by an admin) retains their cached graph until `CMD_INVALIDATE_PERMISSIONS` is delivered. If the Phoenix Channel message is delayed, the window of incorrect access extends. For destructive operations (`modify`) this is acceptable risk; for `observe` the public default means no incorrect denial occurs.

## In Core and Done by Us

- `multiplayer-fabric-godot/modules/multiplayer_fabric_mmog/fabric_mmog_zone.cpp`
  - `_on_peer_connected()` — add `CAN_ENTER` check and graph cache
  - `_on_cmd_instance_asset()` — add `CAN_INSTANCE` check before slot allocation
- `multiplayer-fabric-godot/modules/multiplayer_fabric_mmog/fabric_mmog_zone.h`
  - `_player_graphs` — `HashMap<int, String>` session cache
- `multiplayer-fabric-zone-backend` — `CMD_INVALIDATE_PERMISSIONS` broadcast on ruleset change

## Status

Status: Proposed

## Decision Makers

- iFire

## Tags

- ReBAC, Enforcement, ZoneServer, C++, CAN_ENTER, CAN_INSTANCE, taskweft, PermissionsCache, 20260421-rebac-zone-server-enforcement

## Further Reading

1. [20260421-rebac-permissions.md](20260421-rebac-permissions.md) — base ReBAC design and per-tick doctrine
2. [20260421-rebac-zone-relations.md](20260421-rebac-zone-relations.md) — CAN_ENTER and CAN_INSTANCE relation definitions
3. `multiplayer-fabric-godot/modules/multiplayer_fabric_mmog/fabric_mmog_zone.cpp`
