# Build Cache and Test Pipeline: Under 10 Minutes

- Status: accepted
- Deciders: V-Sekai, fire
- Tags: V-Sekai, CI, SCons, Cache, Docker, Pipeline, Testing, BranchProtection, 20260425-build-cache-test-pipeline

## The Context

The headless test matrix ([20260425-headless-test-matrix.md](20260425-headless-test-matrix.md))
requires a Godot binary. Building from scratch takes > 10 minutes. The
project already uses a two-layer scons cache via `godot-cache-restore` and
`godot-cache-save` composite actions (`.scons_cache/` in the workspace).
Test jobs must never rebuild — they download a pre-built artifact.

The user wants tests to pass in CI before a branch can merge (branch
protection rule), with local Docker as the gate before pushing.

## The Problem Statement

Without separating build and test jobs, every test run rebuilds Godot.
Without branch protection, a developer can merge a broken branch. Without
scons cache, incremental builds still take > 10 minutes.

## CRIS Score

| Factor       | Score  | Evidence |
| ------------ | ------ | -------- |
| Complexity:  | +1     | The scons cache actions already exist. Artifact upload/download is standard GitHub Actions. |
| Reach:       | +1     | Every developer and every CI run benefits from sub-10-minute builds. |
| Impediment:  | +1     | Long builds block the headless test matrix from being practical in CI. |
| Stakeholder: | +1     | Aquarium demo CI depends on this to stay green without excessive wait. |
| **Total**    | **+4** | Build now. |

## Design

### Two-job pipeline

```
build-godot (runs when sources change)
  ├── godot-cache-restore   (.scons_cache/, two-layer: main branch + PR branch)
  ├── scons dev_build=yes … → bin/godot.linuxbsd.editor.dev.x86_64
  ├── godot-cache-save
  └── upload-artifact: godot-headless-bin

headless-tests (runs after build-godot)
  ├── download-artifact: godot-headless-bin
  ├── start zone server (downloaded binary, --headless)
  ├── run Playwright matrix (Four Roles × phases 1 and 2)
  └── report results
```

The test job never calls scons. Under 10 minutes from artifact download to
test results.

### scons cache: two-layer strategy (existing)

The `godot-cache-restore` action already implements this:

```
key:           {cache-name}|{default_branch}|{sha}
restore-keys:  {cache-name}|{default_branch}   ← main-branch warm cache
               {cache-name}|{branch}            ← PR-specific warm cache
```

PRs restore the main-branch cache first so they inherit all previous
incremental build objects, then overlay PR-specific objects. No changes
needed here — the existing actions handle it.

### Local Docker: mount pre-built binary

The test container does not build Godot. It mounts the binary from the
developer's local `bin/` directory:

```yaml
# docker-compose.test.yml
services:
  test-runner:
    image: mcr.microsoft.com/playwright:v1.44.0-jammy
    volumes:
      - ../multiplayer-fabric-godot/bin/godot.linuxbsd.editor.dev.x86_64:/godot/godot:ro
      - ../multiplayer-fabric-zone-backend/frontend:/app
    environment:
      GODOT_BIN: /godot/godot
      ZONE_HOST: zone-server
      ZONE_PORT: "17500"
    depends_on:
      zone-server:
        condition: service_healthy
```

The developer builds once (`gescons` on the host or pull from the latest
CI artifact), then runs the Docker test suite as many times as needed
without rebuilding.

### Where the workflow lives

The `headless-tests` job is added to
`multiplayer-fabric-godot/.github/workflows/runner.yml` as a fourth stage,
after `docker-images`:

```yaml
# runner.yml (excerpt)
headless-tests:
  name: 🧪 Headless matrix
  needs: linux-build
  uses: ./.github/workflows/headless_tests.yml
  with:
    godot-artifact: godot-headless-bin
```

`headless_tests.yml` is a new workflow file in the same directory. It
downloads the artifact, starts the zone server, and runs Playwright.

The branch protection rule applies to the `multiplayer-fabric` branch of
`github.com/V-Sekai-fire/multiplayer-fabric-godot` — the assembled branch
that gitassembly pushes to:

```
Repository: V-Sekai-fire/multiplayer-fabric-godot
Branch:     multiplayer-fabric
Settings → Branches → Add rule:
  Branch name pattern: multiplayer-fabric
  ✓ Require status checks to pass before merging
    ✓ 🧪 Headless / GO — Godot observer
    ✓ 🧪 Headless / TO — Three.js observer
    ✓ 🧪 Headless / GP — Godot player
    ✓ 🧪 Headless / TP — Three.js player
    ✓ 🧪 Headless / GO+TO — dual observer cross-check
```

Five checks: four single-client (one per role) and the key dual-client
cross-check. The remaining five dual-client pairs are informational — they
run but do not block merge until all four single-client roles are green.

### CI artifact retention

`godot-headless-bin` is retained for 3 days. Developers can download the
latest green CI binary instead of building locally:

```sh
gh run download --repo V-Sekai-fire/multiplayer-fabric-godot \
  --name godot-headless-bin --dir multiplayer-fabric-godot/bin/
```

This eliminates the local build entirely for developers whose only goal
is to run the test suite.

## The Downsides

If no green CI artifact exists (first push, cache cold), the developer
must build locally or wait for CI to produce one. The first build on a
new branch takes the full compile time even with a warm cache (scons
cache miss rate for new files).

## The Road Not Taken

Build inside the test container: rejected — scons and all build
dependencies would bloat the test image and add > 10 minutes to every
test run regardless of source changes.

Baking the binary into the test Docker image: rejected — the image would
need rebuilding on every source change, negating the cache benefit.

## Status

Status: Accepted

## Decision Makers

- iFire

## Further Reading

[@godotcacherestore]: `.github/actions/godot-cache-restore/action.yml` in multiplayer-fabric-godot — existing two-layer scons cache restore.

[@ghactionscache]: "Caching dependencies to speed up workflows." GitHub Docs. <https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/caching-dependencies-to-speed-up-workflows>
