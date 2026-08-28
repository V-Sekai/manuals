# A store ships the tool that opens it

## The Context

`casync-llvm-mingw` holds the llvm-mingw toolchain as a casync chunk store, as
`20260828-prebuilt-toolchains-as-casync-stores` describes. The chunks are
reachable only through `desync`, so the first line of its readme told the
reader to run `go install github.com/folbricht/desync/cmd/desync@latest`.

That line asks somebody to install a Go toolchain before they can download a
clang toolchain. On a fresh CI runner it is another provisioning step, and on
a workstation without Go it is an unrelated language runtime installed to open
one archive.

The store cannot hold `desync` itself. Everything in it is addressed by chunk,
and the only thing that can turn chunks back into files is the tool being
fetched.

## The Problem Statement

The one path a first-time reader takes was the path with an unstated
prerequisite on it. Nothing else about the repository needs anything installed:
the indexes are files, the store is files, the scripts are `sh`.

The same gap ran through CI, which installed Go and built `desync` from source
on every run. What the gate exercised was therefore never the binary a reader
would be running.

## Design

The binaries live in the repository, under `desync/<os>_<arch>/`, taken from
upstream's release rather than built here. `desync` v1.1.0 covers `linux`,
`darwin` and `windows` for both `amd64` and `arm64`, which is 215 MB in a
checkout and roughly 72 MB packed. Upstream's BSD 3-Clause licence sits beside
each one.

Each binary was checked against upstream's published `checksums.txt` when it
was vendored, and its own hash is recorded in `desync/sha256sums.txt`.
`check_store.sh` verifies those hashes on every run, with a negative control
that alters a byte and requires the check to fail.

`build.sh`, `extract.sh` and `check_store.sh` all source `find_desync.sh`,
which picks the binary for the host and falls back to one on `PATH`. CI
installs no toolchain and runs the same binary the readme hands out, so the
gate now measures what a reader actually executes.

The readme gives one `curl` line per platform. A reader downloads a binary,
marks it executable on Unix, and fetches a toolchain.

## CRIS Score

| Factor          | Score | Evidence |
| --------------- | ----- | -------- |
| **C**omplexity  | 9 | A directory of binaries, a twenty-line picker, and one check in an existing gate. |
| **R**each       | 7 | Every reader of the store, and every CI job that fetches from it. |
| **I**mpediment  | 7 | A Go toolchain installed to open one archive, or a reader who stops there. |
| **S**takeholder | 6 | Build and CI, plus anyone the store is handed to outside V-Sekai. |
| **Total**       | 7.25 | Schedule soon. |

## The Downsides

215 MB of third-party binaries sit in every checkout, carried by everyone who
syncs the manifest, most of whom will use one of the six. Git grows
monotonically, so each refresh adds another 72 MB or so that cannot be removed
without rewriting history.

V-Sekai now redistributes binaries it did not build. The recorded hashes prove
these are the bytes upstream published on 2026-08-23 and prove nothing about
how upstream built them. Anyone who needs more than that should build `desync`
from source and set `DESYNC`.

The vendored copy goes stale on its own. A new `desync` release changes nothing
here until somebody refreshes it by hand, and no check reports the gap, because
a checked-in binary has no upstream to compare against without a network call
the gate deliberately does not make.

## The Road Not Taken

`go install` is what this replaces, and it remains in the readme for anyone who
prefers it.

Package managers reach many machines and not all of them, and the versions they
carry lag. Guidance that works for some readers and silently fails for others
is the shape of problem being removed here.

Linking upstream's release archives from the readme costs no repository space.
It puts a download and an unpack in front of the reader, leaves nothing to
check the bytes against, and breaks whenever upstream retires a release, which
is the failure this decision is meant to make impossible.

Building in CI only, and leaving readers to arrange their own tool, is the
arrangement that produced the readme this decision rewrote.

## Status

Status: Proposed

Implemented in `casync-llvm-mingw` at `desync` v1.1.0. No other repository
ships its extractor this way.

## Decision Makers

- K. S. Ernest (iFire) Lee
