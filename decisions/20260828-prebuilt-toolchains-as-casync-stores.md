# Prebuilt toolchains are casync stores, compressed once

## The Context

V-Sekai builds Windows binaries with `llvm-mingw`, and every machine that does
so downloads the same release archive from GitHub. Release 20260826 publishes
ten assets. The three the workspace uses come to 399 MB compressed and 2.1 GB
extracted, and the three of them are largely the same toolchain: the same
headers, the same MinGW-w64 CRT, the same target libraries for `aarch64`,
`armv7`, `i686` and `x86_64`, differing in the host binaries that drive them.

Two repositories in `6-datasource` already hold content this way.
`casync-v-sekai-game` keeps game builds as a casync chunk store with one index
per platform, and `multiplayer-fabric-casync-seed` does the same for RISC-V
ELF programs. Neither uses Git LFS, which is on the workspace blocklist.

Storing the toolchain the same way turns 2.1 GB of extracted tree into a
410 MB store shared by all three hosts, with a 4 KB index per host naming the
chunks it needs.

## The Problem Statement

Three questions had no written answer, and each was decided by whoever moved
first.

Where does a prebuilt third-party toolchain live? A release archive downloaded
per machine has no shared history, no deduplication between versions, and no
record of which build used which bytes. Vendoring the archive into Git stores
an opaque 191 MB blob that changes wholly on every upstream release.

Is content stored compressed? An archive committed as an archive is compressed
by the publisher and compressed again by whatever stores it. The cost that
matters is not the CPU. A chunker looking at a compressed stream sees an
entirely new file whenever one byte changes early in it, because compression
propagates that change through every byte after it. Deduplication between two
releases of the same toolchain falls to nothing, which is the whole reason for
keeping them together.

How large should a chunk be? casync's default cuts at 16:64:256 KB, which
produces 17,558 files for these three toolchains. Every one of them is an
HTTP request when the store is served over Pages, a file in the working tree,
and 4 KB of block padding on disk. GitHub rejects a file over 100 MB, so the
opposite extreme has a hard ceiling nearby.

What does a verification tool's exit code mean? `desync verify` prints
`invalid chunk <id>: corruption detected` for a chunk whose bytes no longer
match its name, and then exits 0. A gate that reads `$?` passes on a store the
tool has just declared broken.

## Design

A prebuilt toolchain that more than one repository depends on is published as
a casync chunk store in `6-datasource`, one index per host, all indexes sharing
one store. The store is carried by plain Git. Chunks are small enough that no
file approaches the 100 MB limit, so LFS stays off, and a clone stays a clone
rather than a clone plus a second protocol with its own credentials and quota.

Content is stored decompressed and chunked, in casync's native form: a catar
split into zstd-compressed `.cacnk` chunks. An upstream `.zip` or `.tar.xz` is
decompressed exactly once, on the way in. Nothing in a store is an archive.

Chunks are cut at 1024:4096:16384 KB. The setting was chosen by building the
same three toolchains at six chunk sizes and then measuring what adding the
previous upstream release, 20260812, costs on top of each store.

| min:avg:max KB | store MB | chunk files | largest chunk MB | chunks per index | 20260812 adds MB |
| --- | --- | --- | --- | --- | --- |
| 16:64:256 | 404 | 17558 | 0.2 | 8549 | 204 |
| 64:256:1024 | 408 | 4650 | 0.6 | 2205 | 221 |
| 256:1024:4096 | 407 | 1118 | 2.0 | 468 | 228 |
| 1024:4096:16384 | 410 | 240 | 8.5 | 102 | 235 |
| 4096:16384:65536 | 439 | 34 | 25.3 | 12 | 264 |
| 6144:24576:98304 | 438 | 23 | 36.8 | 8 | 264 |

Almost all of the file count is gone by 4 MB, at 1.5% of store size and 15% of
the cost of the next release. The rows below it buy a further 206 files for
29 MB on the base store and 29 MB on every release after it, which is the
dedup damage arriving as predicted: larger chunks share fewer cut points
between two builds of the same toolchain.

Chunking against a 96 MB maximum, close to GitHub's limit, produced a largest
chunk of 36.8 MB. Cut points arrive where the rolling hash puts them and the
maximum only truncates the tail, so the limit cannot be approached
deliberately. What it can do is land a future release in the 50 MB band where
GitHub warns, for a saving the table shows is already spent.

The archives are extracted on a POSIX filesystem before chunking. Extracting
on Windows flattens the symlinks and mode bits that the macOS and Linux
toolchains carry, and the catar then records the flattened tree. On a Windows
workstation the build runs under WSL.

Every store ships a gate that reads what its tools say rather than what they
return. `20260828-gates-run-on-the-path-a-change-actually-takes` states that
rule for `repo sync`; `desync verify` is the second instance, and the gate
greps its output for `invalid chunk` in addition to checking the status. The
gate carries a negative control that corrupts a copy of one chunk and requires
the check to fail on it, because a check that passes on known-broken input
certifies the defect.

## CRIS Score

| Factor          | Score | Evidence |
| --------------- | ----- | -------- |
| **C**omplexity  | 8 | One build script, one extract script, one gate per store; `casync-llvm-mingw` is the worked example. |
| **R**each       | 6 | Everyone who builds Windows binaries, plus every future third-party toolchain the workspace pins. |
| **I**mpediment  | 6 | 399 MB fetched per machine per release today, with no sharing between releases. |
| **S**takeholder | 6 | Build, packaging, and anyone reproducing a build from its recorded inputs. |
| **Total**       | 6.5 | Schedule. |

## The Downsides

A 410 MB store in Git is a 410 MB clone for everybody who syncs the manifest,
whether or not they build for Windows. `repo` fetches the whole project, and
there is no partial-clone story here yet. Serving the store over GitHub Pages
lets a consumer fetch only the chunks an index names, so the clone is avoidable
for consumers and not for contributors.

Deduplication between releases is the argument for this arrangement, and the
measurement above is the only one taken so far. Adding the Windows and Linux
hosts of 20260812 to the 410 MB store cost 235 MB for 1.35 GB of extracted
tree, against 617 MB for the two of them stored whole. Two releases two weeks
apart is a thin sample, and a release that rebuilds LLVM against a new version
will share less.

Git grows monotonically. A store that gathers a year of toolchain releases
cannot be shrunk by deleting old indexes, because the chunks stay in history.
Pruning means rewriting history or starting a new repository.

The gate greps tool output, which is fragile in the ordinary way: the string
`invalid chunk` is not part of any interface `desync` promises to keep.

## The Road Not Taken

Git LFS is the obvious answer for large binaries and it is blocklisted here,
so it was not weighed again.

Vendoring the upstream archives unchanged would keep the bytes provably
identical to what GitHub published. It stores them compressed, which forfeits
every byte of sharing between releases, and it is what a checksum in the build
recipe already gives; `sources.sha256` records the upstream hashes, so the
provenance survives without the archives.

A binary cache keyed by hash, such as the one Nix or Bazel would provide,
solves this problem and several others. It also introduces a service to run
and a toolchain to adopt. A Git repository and a 15 MB tool already work
everywhere the workspace runs, including CI runners with no infrastructure of
their own.

Fetching from GitHub releases on demand and caching per machine keeps the
repository small. It leaves each machine to answer for itself what it
downloaded, which is the state this decision is replacing.

## Status

Status: Proposed

`casync-llvm-mingw` implements it for llvm-mingw 20260826. No other toolchain
is stored this way yet.

## Decision Makers

- K. S. Ernest (iFire) Lee
