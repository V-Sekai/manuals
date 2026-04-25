# Asset Delivery Stack Benchmark

Supersedes: [20260421-asset-delivery-benchmark.md](20260421-asset-delivery-benchmark.md)

## The Context

The delivery stack for V-Sekai game assets is content-addressed chunking via casync. `aria-storage` (Elixir) implements the fetch path: `mix aria_storage.fetch --index <url> --store <url>` downloads chunks from any static HTTP host (GitHub raw, Cloudflare R2, S3), reassembles the asset, and caches chunks at `~/.cache/casync/chunks`. The chunk store is plain static files — no custom server required. The live V-Sekai casync store is at `https://raw.githubusercontent.com/V-Sekai/casync-v-sekai-game/main/store`.

The prior ADR referenced `multiplayer-fabric-desync` (a Go reimplementation that has since been removed) and assumed a custom chunk server. Both assumptions are now incorrect.

## The Problem Statement

No measured baseline exists for the current stack. Before the stack is considered settled, we need numbers: cold download time, patch size on a realistic 10 % asset change, and client reassembly cost. Without these, performance regressions from future changes to chunking parameters have no reference to compare against.

casync serialises the entire directory tree as a `.catar` stream before chunking. Small files (`.tres`, `.import`, `.translation`) are packed together in the stream and land in the same 16–256 KB chunks as their neighbours. A 500 MB export at the default 64 KB average chunk size produces roughly 8 000 unique chunks; aria-storage fetches these 64 at a time.

## Design

Prepare a representative Godot export: one V-Sekai avatar and environment, approximately 500 MB, matching a typical world export file mix.

**Strategy A — casync via aria-storage (current stack)**

```sh
# Chunk and publish
desync make -s s3+https://... output.caibx input_dir/

# Client fetch (aria-storage)
mix aria_storage.fetch --index https://.../output.caibx \
                       --store https://.../store \
                       --output ./local_dir
```

**Strategy B — direct tarball download (baseline)**

```sh
tar czf export.tar.gz input_dir/
# Serve over HTTP. Client downloads the full archive every update.
```

No chunking. Measures the floor for cold download size and the ceiling for patch size (always 100 % of the archive).

Metrics:

| Metric | Method |
|---|---|
| Cold download size | Fresh client, no local cache, 100 Mbps link |
| Patch size | 10 % asset change — one avatar texture replaced |
| Chunk count | Unique chunks fetched on cold download (~8 000 expected) |
| Client CPU on reassembly | Wall time to extract on a 4-core laptop |

Write raw results to `manuals/decisions/attachments/asset-delivery-benchmark-results.csv`.

## The Benefits

A measured baseline confirms the current stack is worth the casync infrastructure cost (chunk store publishing, aria-storage dependency) or reveals that the patch-size savings do not justify it for the current asset mix.

## The Downsides

Requires a representative 500 MB corpus and a controlled test link. Results do not generalise beyond the tested file mix. A single benchmark run is not a production load test.

## The Road Not Taken

No alternative delivery strategy is evaluated here. If results are poor, a follow-on ADR will propose alternatives and require its own benchmark.

## The Infrequent Use Case

A directory containing only very small assets (total archive under 16 KB) produces a single chunk with no deduplication benefit. This edge case does not affect typical V-Sekai world exports.

## In Core and Done by Us

- Benchmark harness: `aria-storage/bench/` (to be written as a Mix task)
- Corpus: V-Sekai world export, committed to `manuals/decisions/attachments/`
- Results: `manuals/decisions/attachments/asset-delivery-benchmark-results.csv`

## Status

Status: Superseded — casync via aria-storage adopted without benchmark. See [20260423-asset-delivery-decision.md](20260423-asset-delivery-decision.md).

## Decision Makers

- iFire

## Tags

- casync, Benchmark, AssetDelivery, CDN, aria-storage, Performance, 20260423-asset-delivery-benchmark
