# Asset Delivery Stack Benchmark

**Superseded by: [20260423-asset-delivery-benchmark.md](20260423-asset-delivery-benchmark.md)**

## The Context

`multiplayer-fabric-desync` is a Go reimplementation of casync: content-defined chunking (SipHash rolling hash, 48-byte window, target 64 KB chunks), SHA-512/256 chunk IDs, and zstd compression. The [20260421-architecture-strategy-2026.md](20260421-architecture-strategy-2026.md) document identifies zchunk as an alternative: HTTP range-request compatible, zstd-compressed, and deployable over a standard CDN without a custom chunk server. No benchmark comparing the two strategies exists. The delivery stack default is unsettled.

## The Problem Statement

Content-defined chunking (CDC) benefits diminish for asset bundles where chunk boundaries do not align with file boundaries. Godot exports mix many small files (`.tres`, `.import`, `.translation`) with large ones (`.glb`, `.png`). Whether casync's CDC parameters suit this layout, and whether zchunk's simpler HTTP-range approach delivers competitive patch sizes, is unknown without measurement.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Prepare a representative Godot export: a V-Sekai avatar and environment, approximately 500 MB, with a mix of file types matching a typical world export.

Apply three delivery strategies:

**Strategy A — casync desync (current)**
Chunk with the existing SipHash CDC parameters. Serve via `multiplayer-fabric-desync`. Measure using `desync make` + `desync extract`.

**Strategy B — zchunk**
Chunk using `zck` with zstd compression. Serve over a plain HTTP server using byte-range requests. No custom chunk server required. Measure using `zck` + `unzck`.

**Strategy C — CDN delta (baseline)**
Compute binary diffs between consecutive exports using `bsdiff`. Serve diffs over HTTP. Measure download size and apply time.

Metrics for each strategy:

| Metric | Method |
|---|---|
| Cold download time | Fresh client, no local cache, 100 Mbps link |
| Patch size | 10% asset change (one avatar texture replaced) |
| Server complexity | Count of required services and configuration files |
| Client CPU on reassembly | Time to extract on a 4-core laptop |

Write raw results to `manuals/decisions/attachments/asset-delivery-benchmark-results.csv`. Write the decision (which strategy becomes the default) as a follow-on ADR that supersedes this one.

## The Benefits

The benchmark produces an evidence-based default rather than a best-guess. If zchunk wins on patch size and server simplicity, it removes the `aria-storage` deployment dependency entirely. If casync wins on cold download time, the current stack is confirmed.

## The Downsides

The benchmark requires a representative asset corpus and a controlled network environment. Results will not generalise beyond the tested file mix and link conditions. A single benchmark run is not a production load test.

## The Road Not Taken

Adopting zchunk without a benchmark risks regressions for large assets where CDC's chunk reuse across versions outperforms zchunk's fixed-boundary approach. Adopting OCI layers (container registry-based delivery) adds infrastructure dependency not compatible with the homelab deployment target.

## The Infrequent Use Case

Very small assets (under 16 KB) are smaller than one casync chunk and gain nothing from deduplication. Both casync and zchunk handle them correctly but wastefully. A size threshold below which assets are served directly (no chunking) is worth measuring separately.

## In Core and Done by Us

- Benchmark harness script: `multiplayer-fabric-desync/bench/`
- Results file: `manuals/decisions/attachments/asset-delivery-benchmark-results.csv`
- Follow-on ADR to record the decision

## Status

Status: Proposed

## Decision Makers

- iFire

## Tags

- casync, zchunk, Benchmark, AssetDelivery, CDN, desync, Performance, 20260421-asset-delivery-benchmark

## Further Reading

1. [20260421-content-addressed-asset-delivery.md](20260421-content-addressed-asset-delivery.md) — current casync design
2. [20260421-architecture-strategy-2026.md](20260421-architecture-strategy-2026.md) — zchunk identified as alternative
3. `multiplayer-fabric-desync/` — Go casync reimplementation
