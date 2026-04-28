# Headless Test Matrix: Two Client Roles Against One Zone Server

- Status: deferred — focus is on VR ([20260425-godot-player.md](20260425-godot-player.md)) first; matrix resumes after the observer ([20260425-godot-observer.md](20260425-godot-observer.md)) lands
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Testing, Headless, Godot, ZoneServer, Deferred, 20260425-headless-test-matrix

## The Context

The Godot native client has two roles (observer, player). The Three.js client
is no longer being built (see
[20260425-threejs-webgpu-zone-client.md](20260425-threejs-webgpu-zone-client.md)),
so the matrix is now Godot-only. Both phases below depend on the observer
([20260425-godot-observer.md](20260425-godot-observer.md)), which is deferred
while we ship the VR client first — so this matrix is also deferred. Design
content is preserved for when work resumes. Testing them headless first means
no VR hardware and no display required. Tests follow a three-stage promotion
path:

```
local Docker  →  CI headless  →  VR hardware
```

Local Docker confirms the test works on a real network stack before
committing a CI job. CI headless runs on every push. VR hardware is a later
milestone.

The zone server is always the Godot native binary run with `--headless`.
`headless_log_observer.gd` already exists for the Godot observer path.

## The Problem Statement

Two client roles (observer, player) on the Godot native client. No matrix
exists that verifies both connect to one server and that player actions are
reflected in observer state. Tests must pass locally in Docker before being
wired to CI, and must pass in CI before any VR hardware is involved.


## Design

### Two roles

| ID | Client | Role | How to run headless |
| -- | ------ | ---- | ------------------- |
| GO | Godot native | Observer | `--headless --path demo observer.tscn` via `headless_log_observer.gd` |
| GP | Godot native | Player | `--headless --path demo observer.tscn -- --send-player` (new flag, writes CH_PLAYER) |

### Phase 1 — single-client tests (two tests, run serially)

Each test: start zone server → start one client → wait for entities → assert count > 0 → stop.

```
server + GO  →  entity count > 0  (headless_log_observer.gd, --dump-json)
server + GP  →  entity count > 0, CH_PLAYER sent, server ACKs
```

### Phase 2 — dual-client test (one pair)

Start zone server → start GO and GP simultaneously → assert GP's input is
reflected in GO's next observed frame.

```
GO + GP  →  GP action reflected in GO's next frame
```

### Local Docker run (required before CI)

The existing `multiplayer-fabric-hosting` Compose stack already runs a zone
server (`zone-server` service). Add a test service that runs the Godot
binary headlessly inside the same Docker network — no Playwright, no
browser, no Node runtime:

```yaml
# docker-compose.test.yml
services:
  test-runner:
    image: ubuntu:24.04
    depends_on:
      zone-server:
        condition: service_healthy
    volumes:
      - ./multiplayer-fabric-godot/bin:/godot
      - ./tests:/tests
    working_dir: /tests
    environment:
      ZONE_HOST: zone-server
      ZONE_PORT: "17500"
      GODOT_BIN: /godot/godot.linuxbsd.editor.dev.x86_64
    command: bash run_matrix.sh
    network_mode: host   # shares zone-server port
```

Run locally:

```sh
docker compose -f multiplayer-fabric-hosting/docker-compose.yml \
               -f multiplayer-fabric-hosting/docker-compose.test.yml \
               run --rm test-runner
```

A green local Docker run is the gate before the CI job is added.

### Shell orchestration

`run_matrix.sh` starts the Godot binaries, polls for the zone-server port,
diffs the JSON dumps, and exits non-zero on mismatch. No browser engine, no
JavaScript test runner — just GDScript flags and `jq`.

```sh
"$GODOT_BIN" --headless --path "$DEMO_PROJECT" \
  --script scripts/headless_log_observer.gd \
  -- --dump-json=/tmp/go.json --frames=600
```

Same shape for the GP role with `--send-player` instead of `--dump-json`.

### Missing pieces before Phase 1

Two items need implementing before the matrix runs:

1. `headless_log_observer.gd` — add `--dump-json=<path>` flag that writes the
   final entity list as JSON on exit (currently only prints to stdout).

2. Godot player headless — a `--send-player` flag in `fabric_client.gd` or a
   new script that sends one CH_PLAYER datagram after connecting, then exits.

Phase 1 GO can run today with `headless_log_observer.gd` stdout parsing.

## The Downsides

One pair × server startup (~3 s) for Phase 2. The server must bind a fresh
port for each test to avoid inter-test interference; or tests run serially
with a single shared server.

The Docker gate adds one manual step before CI promotion. A developer who skips
the Docker run and pushes directly can still break CI; the gate is enforced by
convention, not by tooling.

## The Road Not Taken

Mocking the server: rejected — a mock cannot reproduce AOI band behaviour,
HLC timestamps, or the actual CH_INTEREST encoding. All matrix tests use the
real server binary.

## Status

Status: Deferred. Not building yet — focus is on the VR client ([20260425-godot-player.md](20260425-godot-player.md)) first; this matrix resumes after the observer ([20260425-godot-observer.md](20260425-godot-observer.md)) lands. Design (shell-based, no Playwright) preserved for that resumption.

## Decision Makers

- iFire

## Further Reading

[@godot_observer]: [20260425-godot-observer.md](20260425-godot-observer.md) — Godot `--headless` observer (GO role).

[@godot_player]: [20260425-godot-player.md](20260425-godot-player.md) — Godot native PCVR player (GP role).

[@dual_client]: [20260425-dual-client-test.md](20260425-dual-client-test.md) — superseded; coverage merged into this matrix as the GO+GP pair.
