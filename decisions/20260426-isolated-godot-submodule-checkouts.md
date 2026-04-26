# Isolated Godot engine changes via per-feature submodule checkouts

## The Context

`multiplayer-fabric-godot` carries all engine changes for the project: the
WebTransport/picoquic module, the `multiplayer_fabric` zone-fabric module,
OpenTelemetry, godot-sandbox, and several cross-compile patches. All of these
are combined into a single `multiplayer-fabric` branch via `gitassembly` and
built together in `multiplayer-fabric-build`.

During a single debugging session (2026-04-25/26), three separate Windows
cross-compile failures were found: a `struct cmsghdr` incomplete-type error in
`picosocks.c`, a case-sensitivity error in `wincompat.h` (`Winsock2.h` vs
`winsock2.h`), and a duplicate-method-binding error in `OTelMetric`. Because all
changes live in one combined branch, each failure was invisible until the full
combined build ran — and failures from different features masked each other.

Gall's Law [@gall1977systemantics]: a complex system that works evolved from a
simple system that worked. A complex system designed from scratch never works.

## The Problem Statement

When any one of N independent engine features breaks the Windows (or any
platform) build, the combined CI run fails with no direct attribution. The
developer must bisect across features to find the owner. Adding a new feature
risks breaking existing ones silently.

Each feature cannot be verified in isolation, so the project cannot adopt
continuous integration per-feature — only per-combined-build.

## Design

Keep `multiplayer-fabric-godot` as the **single upstream-tracking repo** with
all feature branches. Do not create separate repos.

Instead, `multiplayer-fabric-build` gains **multiple submodule checkouts of the
same repo**, each pinned to a different feature branch:

```
[submodule "godot"]               # combined build (gitassembly output)
  path = godot
  url  = https://github.com/V-Sekai-fire/multiplayer-fabric-godot.git
  branch = multiplayer-fabric

[submodule "godot-http3"]         # ONLY feat/module-http3
  path = godot-http3
  url  = https://github.com/V-Sekai-fire/multiplayer-fabric-godot.git
  branch = feat/module-http3

[submodule "godot-fabric"]        # ONLY feat/module-multiplayer-fabric (zone protocol)
  path = godot-fabric
  url  = https://github.com/V-Sekai-fire/multiplayer-fabric-godot.git
  branch = feat/module-multiplayer-fabric

[submodule "godot-otel"]          # ONLY feat/open-telemetry
  path = godot-otel
  url  = https://github.com/V-Sekai-fire/multiplayer-fabric-godot.git
  branch = feat/open-telemetry

[submodule "godot-sandbox"]       # ONLY feat/module-sandbox
  path = godot-sandbox
  url  = https://github.com/V-Sekai-fire/multiplayer-fabric-godot.git
  branch = feat/module-sandbox
```

The CI matrix in `multiplayer-fabric-build` adds a **test-plan** job that builds
each `godot-*` checkout independently (Windows + Linux, `double` precision) and
reports a per-feature pass/fail before the combined build runs.

```yaml
test-plan:
  strategy:
    matrix:
      subdir: [godot-http3, godot-fabric, godot-otel, godot-sandbox]
  steps:
    - uses: actions/checkout@v4
      with: { submodules: true }
    - run: just build-platform-target windows editor x86_64 double
      working-directory: ${{ matrix.subdir }}
```

The existing `godot/` combined checkout (gitassembly output) continues to be
the artifact that ships. The `godot-*` checkouts are CI-only and not shipped.

### Feature branch discipline

Each `feat/*` branch in `multiplayer-fabric-godot`:

- Applies **one** logical change on top of upstream `master`
- Has its own `godot_patches/` entry describing the diff vs upstream
- Is independently buildable for Windows + Linux

The gitassembly in `multiplayer-fabric-merge` continues to merge all branches
into `multiplayer-fabric` for the combined build.

## CRIS Score

| Factor          | Score | Evidence |
| --------------- | ----- | -------- |
| **C**omplexity  | −1    | No new repos; same single-repo model, just multiple checkout paths in build |
| **R**reach       | +1    | Affects every developer adding engine changes — immediate isolation feedback |
| **I**mpediment  | +1    | Current combined build masks per-feature failures; this directly unblocks attribution |
| **S**takeholder | +1    | `multiplayer-fabric-build` CI is the gate for all platform releases |
| **Total**       | +2    | Adopt |

## The Downsides

- `multiplayer-fabric-build` checkout takes longer: N submodule clones of the
  same repo (mitigated by `--depth=1` and GitHub's deduplication of packfiles
  for the same remote).
- Each `feat/*` branch author must keep their branch rebased on `master`;
  divergence breaks the isolation build.
- The test-plan matrix does not catch interactions between features — only
  individual feature health.

## The Road Not Taken

**Separate repos per feature** (e.g., `multiplayer-fabric-godot-http3`): rejected
because it multiplies repo administration, complicates upstream PR preparation
(patches live in a different repo from the module), and breaks the existing
`gitassembly` model without adding isolation beyond what multiple checkouts
provide.

**Branch-per-feature CI in `multiplayer-fabric-godot` directly**: GitHub Actions
only runs on push to a branch; adding a matrix job there duplicates the build
setup already in `multiplayer-fabric-build`. Better to keep build logic in one
place.

## Status

Status: Proposed

## Decision Makers

- K. S. Ernest (iFire) Lee
