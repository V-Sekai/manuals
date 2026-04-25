# Zone Asset Manifest

## The Context

`GET /shards` returns zone connection metadata: `address`, `port`, `cert_hash`, and `desync_index_url`. Clients have no way to discover which SharedFiles are hosted at a zone without first opening a WebTransport or WebSocket connection to it.

## The Problem Statement

Discovery requires a live connection. Clients cannot make pre-connection routing or interest decisions based on zone content. A client that wants to find zones containing a specific asset type must connect to each candidate zone in turn.

## Design

Add a read-only endpoint `GET /shards/:id/assets`. This requires [20260421-asset-zone-locality.md](20260421-asset-zone-locality.md) to be implemented first (SharedFile must carry a `zone_id`).

Response shape:

```json
{
  "data": {
    "assets": [
      {
        "id": "550e8400-e29b-41d4-a716-446655440000",
        "name": "KitsuneAvatarV2",
        "mime_type": "model/gltf-binary",
        "baked_url": "https://versitygw.example.com/chunks/abc123.caidx",
        "tags": ["avatar", "vrm"],
        "is_public": true
      }
    ]
  }
}
```

Only assets with a non-null `baked_url` are returned — assets still in the baking pipeline are not surfaced. No authentication is required for assets where `is_public` is true.

Context function:

```elixir
# Uro.VSekai
def list_zone_assets(zone_id) do
  SharedFile
  |> where([f], f.zone_id == ^zone_id and not is_nil(f.baked_url) and f.is_public == true)
  |> select([f], [:id, :name, :mime_type, :baked_url, :tags])
  |> Repo.all()
end
```

The existing `GET /shards` response is unchanged. No existing client breaks.

Route addition in `router.ex`:

```elixir
get "/shards/:id/assets", ZoneController, :assets
```

## The Benefits

Clients can filter and rank zones by content before connecting. The endpoint is stateless and cacheable. No new data model is required beyond the `zone_id` FK on SharedFile.

## The Downsides

The asset list reflects the state at query time. A zone that adds an asset between a client's manifest fetch and its connection will not surface that asset in the cached response. Polling or the `zone_updated` WebSocket event covers this.

## The Road Not Taken

Embedding the asset list directly in `GET /shards` would return it for all zones in a single request but multiplies payload size with the number of assets per zone. Clients interested in only connection metadata pay the full asset enumeration cost. A separate endpoint keeps the two concerns independent.

## The Infrequent Use Case

A zone with no baked assets returns `"assets": []`. A zone whose assets are all private (`is_public: false`) also returns an empty list to unauthenticated clients. Authenticated requests with sufficient ReBAC permission return private assets; this gating is deferred to a follow-on decision.

## In Core and Done by Us

- `Uro.VSekai.list_zone_assets/1` — query SharedFile by zone_id and baked_url
- `Uro.ZoneController.assets/2` — new action
- `router.ex` — new route
- Requires [20260421-asset-zone-locality.md](20260421-asset-zone-locality.md)

## Status

Status: Proposed

## Decision Makers

- iFire

## Tags

- Zone, Asset, Manifest, Discovery, API, SharedFile, 20260421-zone-asset-manifest

## Further Reading

1. [20260421-asset-zone-locality.md](20260421-asset-zone-locality.md) — zone_id FK prerequisite
2. [20260421-zone-registration-and-discovery.md](20260421-zone-registration-and-discovery.md) — base zone API
3. [20260421-content-addressed-asset-delivery.md](20260421-content-addressed-asset-delivery.md) — baked_url pipeline
