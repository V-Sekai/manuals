# SQLite-per-zone discrete-mutation journal for crash recovery

## The Context

Each FabricZone process manages up to 1,800 entity slots. Zone processes can crash from OOM, SIGKILL from the orchestrator, or host preemption. Without a recovery mechanism, all dynamic entity state (connected players, instanced assets) is lost on crash and must be re-established by clients reconnecting from scratch.

## The Problem Statement

Zone state has two components:

- **Static world** — 100,000 entities partitioned by Hilbert code at startup; deterministic from zone_id and zone_count, always reproducible.
- **Dynamic mutations** — player humanoid spawns (55 bone slots per player), asset instances from CMD_INSTANCE_ASSET, and despawns. These are not deterministic from a formula; they must be persisted.

After an abrupt crash, only the dynamic mutations need to be recovered. The existing graceful-shutdown drain (DRAIN_MAGIC → FabricSnapshot.res) requires a clean shutdown window and does not help when the process is killed.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

`FabricZoneJournal` maintains a SQLite database (`fabric_journal_N.db` in `user://`) with two tables:

```sql
entity_mutations (seq, op, slot_idx, global_id, entity BLOB, ts)
entity_snapshots (id, last_mutation_seq, slot_data BLOB, slot_count, ts)
```

Mutation ops: `spawn`, `despawn`, `payload_update`. Physics-step position updates are intentionally excluded — they are deterministic from the simulation and too frequent to journal economically.

Crash-recovery sequence:

```
zone restarts
  → FabricZone::initialize()
    → static world entities recreated (deterministic, slots 0..N)
    → _journal.open("fabric_journal_0.db")
    → _journal.replay(slots, capacity, entity_count)
      → restore from latest snapshot (slot_data BLOB → active slots)
      → apply mutations with seq > last_mutation_seq
      → only occupy slots currently free (no static-entity clobber)
    → entity_count += journal_count
  → zone runs normally with journal enabled
```

Periodic snapshots prune old mutations so the journal does not grow unbounded. A final snapshot is written in `finalize()`.

WAL mode (`PRAGMA journal_mode=WAL`) is used for better crash-consistency when `SQLITE_OMIT_WAL` is absent from the build. The `SQLITE_OMIT_WAL` define was removed from `modules/sqlite/SCsub` as part of this change.

## The Benefits

- No new infrastructure: SQLite is already compiled into the Godot binary via `modules/sqlite`.
- Recovery is local and fast: replaying a typical journal (a few hundred mutations) takes microseconds.
- Bounded replay time: periodic full snapshots cap the mutation log length regardless of zone uptime.
- Self-hosters benefit: crash recovery works without a coordinating database (unlike KBEngine/MySQL or SpacetimeDB).

## The Downsides

- Journal adds per-mutation write latency on spawn/despawn/asset-instance paths. These are infrequent events so the impact is negligible.
- WAL files (`.db-wal`, `.db-shm`) appear alongside the database; operators must include them in backups.
- Position state (cx/cy/cz, velocity) is not recovered — entities resume at their last snapshotted position, not their crash-time position. For humanoid players this means a position snap on reconnect, which is acceptable.

## The Road Not Taken

- **FabricSnapshot-only recovery**: existing graceful drain, but requires a clean shutdown window; does not help on SIGKILL.
- **CockroachDB/FoundationDB for entity state**: rejected earlier (see `20240409-elixir-raft-vs-sqlite-fdb.md`); too heavy for per-entity write throughput.
- **Write-ahead log of all state including positions**: would produce gigabytes/day per zone and still not recover the simulation exactly (floating-point physics is not exactly reproducible across reboots).
- **Elixir-side persistence in zone-backend**: the zone backend already has SQLite via `exqlite` (taskweft), but entity state is owned by the C++ zone process; pushing it across the HTTP boundary adds latency and couples two systems.

## The Infrequent Use Case

Zones that never accept player connections or dynamic asset instances gain nothing from the journal (all their state is deterministic). The journal is effectively a no-op in pure simulation/benchmark mode.

## In Core and Done by Us

`FabricZoneJournal` lives in `modules/multiplayer_fabric/` alongside `FabricZone`. It uses the sqlite3 C API directly (not the GDScript-facing `SQLite` class) via the include path `modules/sqlite/thirdparty`.

Hook sites:
- `FabricZone::initialize()` — open + replay
- `FabricZone::finalize()` — snapshot + close
- `FabricMMOGZone::spawn_humanoid_entities_for_player()` — journal_spawn per bone slot
- `FabricMMOGZone::despawn_humanoid_entities_for_player()` — journal_despawn per bone slot
- `FabricMMOGZone::_on_cmd_instance_asset()` — journal_payload_update after slot setup

## Status

Status: Accepted <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- iFire

## Tags

- Crash-Recovery, SQLite, WAL, Journal, FabricZone, Entity, Persistence

## Further Reading

1. `modules/multiplayer_fabric/fabric_zone_journal.h` — class declaration and design rationale
2. `modules/multiplayer_fabric/fabric_zone_journal.cpp` — implementation
3. `modules/multiplayer_fabric/doc_classes/FabricZone.xml` — user-facing crash-recovery description
