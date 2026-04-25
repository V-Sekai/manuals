# Baker Zone Lifecycle: One Godot Process Per Zone

## The Context

The baker and zone server are the same Godot headless binary in different
lifecycle states. Zone visibility is controlled by a `status` field already
needed for private player-owned zones. Baking is not special — a baking zone
is simply a private zone whose owner has not yet made it public.

## The Decision

One Godot process per zone. On boot the process registers via `POST /shards`
with `status` set to whatever the owner chooses (private zones start private;
public zones start public). The baker starts private, posts progress through
`status` on each `PUT /shards/:id` heartbeat, and flips to public when the
pipeline finishes. Each zone's `map` field (set to the asset UUID) gives it an
isolated Hilbert spatial partition.

## Zone schema additions

| Field | Type | Notes |
|-------|------|-------|
| `status` | string | Owner-controlled. Conventions: `"private"`, `"public"`, `"draining"`. Baker uses `"baking:validate"` → `"baking:export"` → `"baking:chunk"` → `"baking:upload"` → `"public"`. |
| `public` | boolean | `GET /shards` (unauthenticated) returns only `public: true` zones. Zone owner can always see their own zones. |

Both fields apply equally to creator-owned private zones and baker zones.
Setting `public: false` keeps any zone off the public listing for any reason.

## Boot sequence (baker)

```
boot
  → POST /shards  {map: asset_id, status: "baking:validate", public: false, …}
  → validate scene
  → PUT /shards/:id  {status: "baking:export"}
  → export .scn
  → PUT /shards/:id  {status: "baking:chunk"}
  → chunk with casync
  → PUT /shards/:id  {status: "baking:upload"}
  → upload chunks to /chunks
  → PUT /shards/:id  {status: "public", public: true}
  → enter WebTransport event loop
  → PUT /shards/:id  heartbeat every 25 s (status unchanged)
```

A private player-owned zone follows the same pattern with `status: "private"`
and `public: false` indefinitely.

## Spatial isolation

`map` is set to the `asset_id` UUID. Concurrent bakers with different
`asset_id` values occupy disjoint Hilbert regions by definition.

## Status

Status: Accepted

## Decision Makers

- iFire

## Tags

- baker, zone, lifecycle, WebTransport, spatial-partitioning, private-zones, 20260423-baker-zone-lifecycle
