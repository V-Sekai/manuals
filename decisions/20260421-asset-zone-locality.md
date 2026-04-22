# Asset Zone Locality

## The Context

SharedFile records are uploaded by a user, baked into casync chunks, and referenced by `baked_url`. The zone server that will serve an entity is the Hilbert-authority for the entity's position. There is currently no explicit link between a SharedFile and the zone responsible for it.

## The Problem Statement

Without a `zone_id` on `shared_files`, a zone cannot enumerate the assets it owns. On restart, a zone must re-derive its asset set from `CMD_INSTANCE_ASSET` history rather than querying its own records. `GET /shards` returns connection metadata but not the assets associated with a zone, so clients cannot make pre-connection routing decisions.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Add an optional `zone_id` foreign key to `shared_files`:

```sql
ALTER TABLE shared_files
  ADD COLUMN zone_id UUID REFERENCES zones(id) ON DELETE SET NULL;
```

The column is nullable. Assets uploaded without a zone association remain valid and are accessible to any zone by asset UUID. When a zone server processes `CMD_INSTANCE_ASSET` and the asset has no `zone_id`, the authority zone stamps its own `id` onto the record.

Zone schema gains a logical reverse association:

```elixir
# Uro.VSekai.Zone
has_many :shared_files, Uro.SharedContent.SharedFile, foreign_key: :zone_id
```

The zone-backend context gains a lookup:

```elixir
def list_zone_assets(zone_id) do
  SharedFile
  |> where([f], f.zone_id == ^zone_id and not is_nil(f.baked_url))
  |> Repo.all()
end
```

## The Benefits

A zone can enumerate its own assets without replaying history. Zone restart recovery is deterministic: load the snapshot, then query `list_zone_assets/1` to confirm which assets are already baked. The foreign key enables `GET /shards/:id/assets` (see `20260421-zone-asset-manifest.md`).

## The Downsides

Assets shared across zones (the same avatar instanced in multiple zones) have at most one `zone_id`. Cross-zone asset sharing still works by asset UUID; the `zone_id` field records origin, not exclusivity.

## The Road Not Taken

A join table (`zone_assets`) normalises the many-to-many case but adds a join on every read path and complexity on every write. A nullable foreign key on `shared_files` covers the common case (one asset, one origin zone) without that overhead.

## The Infrequent Use Case

An asset uploaded directly via the REST API without a zone context has a null `zone_id`. It remains addressable by UUID and is baked and chunked normally. Any zone can instance it via `CMD_INSTANCE_ASSET`.

## In Core and Done by Us

- Migration: add `zone_id` to `shared_files`
- `Uro.SharedContent.SharedFile` — add `belongs_to :zone`
- `Uro.VSekai.Zone` — add `has_many :shared_files`
- `Uro.VSekai.list_zone_assets/1` — query by zone_id

## Status

Status: Proposed

## Decision Makers

- iFire

## Tags

- Asset, SharedFile, Zone, Locality, Migration, CasSync

## Further Reading

1. `20260421-zone-asset-manifest.md` — exposes zone assets via GET /shards/:id/assets
2. `20260421-content-addressed-asset-delivery.md` — casync baking pipeline
3. `multiplayer-fabric-zone-backend/lib/uro/shared_content/shared_file.ex`
