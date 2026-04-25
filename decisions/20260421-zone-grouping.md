# Zone Grouping

## The Context

Zones register independently with zone-backend and appear in a flat list on `GET /shards`. Each zone has a `name` and a `map` but no mechanism to declare membership in a named region, cluster, or event. Clients receive all live zones undifferentiated.

## The Problem Statement

Clients and operators cannot filter or route to a subset of zones that belong together. A set of zones serving the same world region, event, or logical cluster cannot be discovered as a unit without out-of-band coordination.

## Design

Add an optional `tags` column (string array) to the `zones` table:

```sql
ALTER TABLE zones ADD COLUMN tags TEXT[] NOT NULL DEFAULT '{}';
```

Zone servers pass tags at registration and heartbeat:

```json
PUT /shards/:id
{ "shard": { "tags": ["vketspring2026", "hall-a"] } }
```

`GET /shards` accepts an optional `tags` query parameter. When provided, zone-backend filters to zones whose tag array intersects the requested set:

```elixir
def list_fresh_zones(tags \\ []) do
  stale_timestamp = DateTime.add(DateTime.utc_now(), -zone_freshness_time_in_seconds(), :second)
  base = from z in Zone, where: z.last_put_at > ^stale_timestamp, preload: [:user]
  if tags == [] do
    Repo.all(base)
  else
    Repo.all(from z in base, where: fragment("? && ?", z.tags, ^tags))
  end
end
```

Tags are free-form strings. Zone-backend applies no semantics — grouping, hierarchy, and naming conventions are left to the operator. A zone may carry multiple tags.

Tags are included in the `GET /shards` response alongside existing fields so clients can render group membership without a second request.

## The Benefits

Tags mirror the pattern already used on `SharedFile` (same column type, same operator convention). No new infrastructure is required. Filtering is a single array-intersection query on an indexed column. Operators can define arbitrary groupings without schema changes.

## The Downsides

Tags are strings with no validation or enumeration. A typo in a tag silently produces an empty filter result. No enforcement prevents tag collision across unrelated operators on a shared instance.

## The Road Not Taken

A `parent_zone_id` foreign key enforces a strict hierarchy (exactly one parent per zone) but cannot express overlapping membership (a zone belonging to both a region and an event). A separate `zone_groups` join table normalises the many-to-many case but adds a join on every read path and complexity on writes. The tags array covers the common cases without either constraint.

## The Infrequent Use Case

A zone that belongs to no group omits `tags` from its registration payload. Zone-backend stores an empty array. `GET /shards` without a `tags` filter returns it alongside grouped zones, preserving the current flat-list behaviour.

## In Core and Done by Us

- Migration: add `tags TEXT[]` to `zones`
- `Uro.VSekai.Zone` — add `field(:tags, {:array, :string}, default: [])`
- `Zone.changeset/2` — cast `tags`
- `Uro.VSekai.list_fresh_zones/1` — accept optional `tags` filter
- `Uro.ZoneController.index/2` — pass `tags` query param to context function
- `Zone.to_json_schema/1` — include `tags` in serialised response

## Status

Status: Proposed

## Decision Makers

- iFire

## Tags

- Zone, Grouping, Tags, Discovery, Filter, Registration, 20260421-zone-grouping

## Further Reading

1. [20260421-zone-registration-and-discovery.md](20260421-zone-registration-and-discovery.md) — base registration design
2. [20260421-zone-asset-manifest.md](20260421-zone-asset-manifest.md) — per-zone asset listing
3. `multiplayer-fabric-zone-backend/lib/uro/v_sekai/zone.ex`
