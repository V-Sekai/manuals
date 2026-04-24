# Asset Delivery Stack Benchmark

Supersedes: `20260421-asset-delivery-benchmark.md`

## The Context

The delivery stack for V-Sekai game assets is content-addressed chunking via casync. `aria-storage` (Elixir) implements the fetch path: `mix aria_storage.fetch --index <url> --store <url>` downloads chunks from any static HTTP host (GitHub raw, Cloudflare R2, S3), reassembles the asset, and caches chunks at `~/.cache/casync/chunks`. The chunk store is plain static files — no custom server required. The live V-Sekai casync store is at `https://raw.githubusercontent.com/V-Sekai/casync-v-sekai-game/main/store`.

The prior ADR referenced `multiplayer-fabric-desync` (a Go reimplementation that has since been removed) and assumed a custom chunk server. Both assumptions are now incorrect. zchunk remains an untested alternative worth measuring before the stack is finalised.

## The Problem Statement

Content-defined chunking (CDC) benefits diminish when chunk boundaries do not align with file boundaries. A Godot export mixes many small files (`.tres`, `.import`, `.translation`) with large ones (`.glb`, `.png`). Chunks smaller than 16 KB gain nothing from deduplication; at one HTTP GET per chunk, 10 000 tiny chunks is worse than a tarball regardless of patch size. Whether casync's CDC parameters suit this layout, and whether zchunk's fixed-boundary HTTP-range approach delivers competitive patch sizes with lower chunk overhead, is unknown without measurement.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Prepare a representative Godot export: one V-Sekai avatar and environment, approximately 500 MB, matching a typical world export file mix.

Apply three delivery strategies:

**Strategy A — casync via aria-storage (current)**

```sh
# Chunk and publish
desync make -s s3+https://... output.caibx input_dir/

# Client fetch (aria-storage)
mix aria_storage.fetch --index https://.../output.caibx \
                       --store https://.../store \
                       --output ./local_dir
```

No custom server. Chunks are static files on S3 or GitHub raw CDN.

**Strategy B — zchunk**

```sh
zck --output asset.zck input_dir.tar
# Serve asset.zck over any HTTP server.
# Client fetches only changed chunks via byte-range requests.
unzck asset.zck
```

No custom server. One file per asset instead of a chunk store directory tree.

**Strategy C — bsdiff delta (baseline)**

```sh
bsdiff old_export.tar new_export.tar delta.patch
bspatch old_export.tar new_export.tar delta.patch
```

Binary diff served over HTTP. Measures the floor for patch size.

Metrics for each strategy:

| Metric | Method |
|---|---|
| Cold download size | Fresh client, no local cache |
| Patch size | 10 % asset change — one avatar texture replaced |
| Chunk count | Total HTTP requests for a cold fetch (proxy for reassembly latency) |
| Server complexity | Count of required services and config files |
| Client CPU on reassembly | Wall time to extract on a 4-core laptop |

The chunk count metric is new relative to the prior ADR. At one round-trip per chunk, 10 000 chunks at 50 ms RTT costs 500 s sequentially; aria-storage's parallel fetch (64 concurrent requests) brings this to ~8 s, but chunk count still sets the floor.

Write raw results to `manuals/decisions/attachments/asset-delivery-benchmark-results.csv`. The follow-on ADR recording the chosen default supersedes this one.

## The Benefits

Evidence-based default. If zchunk wins on chunk count and server simplicity it removes the casync store infrastructure entirely. If casync wins on patch size for large assets the current stack is confirmed with measured data.

## The Downsides

Requires a representative 500 MB corpus and a controlled 100 Mbps test link. Results do not generalise beyond the tested file mix. A single benchmark run is not a production load test.

## The Road Not Taken

Adopting zchunk without a benchmark risks regressions for large assets where CDC chunk reuse across versions outperforms zchunk's fixed-boundary approach. OCI layer delivery (container registry) adds infrastructure incompatible with the homelab deployment target and was not measured.

## The Infrequent Use Case

Assets under 16 KB are smaller than one casync chunk and gain nothing from deduplication. Both strategies handle them correctly but wastefully. A size threshold below which assets are served directly — no chunking — should be measured as a follow-on once the primary comparison is settled.

## In Core and Done by Us

- Benchmark harness: `aria-storage/bench/` (to be written as a Mix task)
- Corpus: V-Sekai world export, committed to `manuals/decisions/attachments/`
- Results: `manuals/decisions/attachments/asset-delivery-benchmark-results.csv`
- Follow-on ADR to record the chosen default

## Status

Status: Active

## Decision Makers

- iFire

## Tags

- casync, zchunk, Benchmark, AssetDelivery, CDN, aria-storage, Performance
