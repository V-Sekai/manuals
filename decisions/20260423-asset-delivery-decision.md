# Asset Delivery: casync via aria-storage Adopted

Supersedes: [20260423-asset-delivery-benchmark.md](20260423-asset-delivery-benchmark.md), [20260421-asset-delivery-benchmark.md](20260421-asset-delivery-benchmark.md)

## Decision

casync via `aria-storage` is the asset delivery stack for V-Sekai. No benchmark against alternatives is required.

## Rationale

- `aria-storage` is built and tested. The fetch path (`mix aria_storage.fetch`), chunk cache (`~/.cache/casync/chunks`), parallel download (64 concurrent), and SHA-512/256 verification are all working against the live V-Sekai casync store.
- casync's archive-level chunking (serialised `.catar` stream) groups small files into properly-sized chunks. The concern about per-file chunk overhead does not apply.
- The chunk store is plain static files. No custom server is required — GitHub raw CDN or S3 suffices.
- The stack is interoperable with the Godot C++ `FabricMMOGAsset` module (same SHA-512/256, same two-level store layout, same platform-correct cache path via `OS.get_cache_path()`).

## Status

Status: Accepted

## Decision Makers

- iFire

## Tags

- casync, AssetDelivery, aria-storage, CDN, 20260423-asset-delivery-decision
