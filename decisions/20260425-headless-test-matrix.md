# Headless Test Matrix: Four Client Roles Against One Zone Server

- Status: accepted
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Testing, Headless, Playwright, Godot, Threejs, ZoneServer, 20260425-headless-test-matrix

## The Context

Two clients (Godot native, Three.js WebGPU) each have two roles (observer,
player). Testing them headless first means no VR hardware and no display
required. Tests follow a three-stage promotion path:

```
local Docker  →  CI headless  →  VR hardware
```

Local Docker confirms the test works on a real network stack before
committing a CI job. CI headless runs on every push. VR hardware is a later
milestone.

The zone server is always the Godot native binary run with `--headless`.
`headless_log_observer.gd` already exists for the Godot observer path.

## The Problem Statement

Four client roles × two clients = four test subjects. No matrix exists that
verifies all four connect to one server and that player actions are reflected
in observer state. Tests must pass locally in Docker before being wired to CI,
and must pass in CI before any VR hardware is involved.

## CRIS Score

| Factor       | Score  | Evidence |
| ------------ | ------ | -------- |
| Complexity:  | +1     | Three of the four roles are already partially implemented. headless_log_observer.gd exists. Playwright handles Three.js. |
| Reach:       | +1     | Runs in CI on every push, no hardware dependency. |
| Impediment:  | +1     | Without this matrix, a server-side regression could break one client silently. |
| Stakeholder: | +1     | Pass condition for the aquarium demo requires two simultaneous observers. |
| **Total**    | **+4** | Build now. |

## Design

### Four roles

| ID | Client | Role | How to run headless |
| -- | ------ | ---- | ------------------- |
| GO | Godot native | Observer | `--headless --path demo observer.tscn` via `headless_log_observer.gd` |
| GP | Godot native | Player | `--headless --path demo observer.tscn -- --send-player` (new flag, writes CH_PLAYER) |
| TO | Three.js | Observer | Playwright Chromium, reads `window.__entities` |
| TP | Three.js | Player | Playwright Chromium, reads `window.__entities` + calls `window.__sendPlayer()` |

### Phase 1 — single-client tests (four tests, run serially)

Each test: start zone server → start one client → wait for entities → assert count > 0 → stop.

```
server + GO  →  entity count > 0  (headless_log_observer.gd, stdout parse)
server + GP  →  entity count > 0, CH_PLAYER sent, server ACKs
server + TO  →  window.__entities.length > 0 after WebTransport connect
server + TP  →  window.__entities.length > 0, window.__sendPlayer() sends datagram
```

### Phase 2 — dual-client tests (six pairs, run serially)

Each test: start zone server → start two clients → compare entity ID sets → assert equal.

```
GO + TO  →  same entity IDs observed (Godot stdout == Three.js window.__entities)
GO + GP  →  GP action reflected in GO's next frame
GO + TP  →  TP action reflected in GO's next frame
TO + TP  →  TP action visible in TO's window.__entities
GO + TP + TO  →  three-way cross-check (Phase 3)
GP + TP  →  both players' actions reflected in each other's observer
```

### Local Docker run (required before CI)

The existing `multiplayer-fabric-hosting` Compose stack already runs a zone
server (`zone-server` service). Add a test service that mounts the test
scripts and runs Playwright inside the same Docker network:

```yaml
# docker-compose.test.yml
services:
  test-runner:
    image: mcr.microsoft.com/playwright:v1.44.0-jammy
    depends_on:
      zone-server:
        condition: service_healthy
    volumes:
      - ./multiplayer-fabric-zone-backend/frontend:/app
      - ./multiplayer-fabric-godot/bin:/godot
    working_dir: /app
    environment:
      ZONE_HOST: zone-server
      ZONE_PORT: "17500"
      GODOT_BIN: /godot/godot.linuxbsd.editor.dev.x86_64
    command: npx playwright test headless_matrix --project=chromium
    network_mode: host   # shares zone-server port
```

Run locally:

```sh
docker compose -f multiplayer-fabric-hosting/docker-compose.yml \
               -f multiplayer-fabric-hosting/docker-compose.test.yml \
               run --rm test-runner
```

A green local Docker run is the gate before the CI job is added.

### Playwright orchestration

```ts
async function startZoneServer(): Promise<ChildProcess> {
  const proc = spawn(GODOT_BIN, ["--headless", "--path", ZONE_PROJECT, "scenes/zone_server.tscn"]);
  await waitForPort(17500);  // poll until server accepts TCP
  return proc;
}

async function startGodotObserver(dumpPath: string): Promise<ChildProcess> {
  return spawn(GODOT_BIN, [
    "--headless", "--path", DEMO_PROJECT,
    "--script", "scripts/headless_log_observer.gd",
    "--", `--dump-json=${dumpPath}`
  ]);
}

async function threejsObserver(page: Page): Promise<Entity[]> {
  await page.waitForFunction(
    () => (window as any).__entities?.length > 0, { timeout: 15_000 }
  );
  return page.evaluate(() => (window as any).__entities);
}
```

### Missing pieces before Phase 1

Three items need implementing before the matrix runs:

1. `headless_log_observer.gd` — add `--dump-json=<path>` flag that writes the
   final entity list as JSON on exit (currently only prints to stdout).

2. Godot player headless — a `--send-player` flag in `fabric_client.gd` or a
   new script that sends one CH_PLAYER datagram after connecting, then exits.

3. Three.js `window.__sendPlayer()` — the Stage 2 CH_PLAYER write path
   ([20260425-threejs-player.md](20260425-threejs-player.md)) must expose this
   function before Phase 2 TP tests can run.

Phase 1 GO and TO tests can run today with `headless_log_observer.gd` stdout
parsing and the existing Three.js observer Playwright spec.

## The Downsides

Six pairs × server startup (~3 s each) = ~20 s of CI wall time for Phase 2.
The server must bind a fresh port for each test to avoid inter-test interference;
or tests run serially with a single shared server.

The Docker gate adds one manual step before CI promotion. A developer who skips
the Docker run and pushes directly can still break CI; the gate is enforced by
convention, not by tooling.

## The Road Not Taken

Mocking the server: rejected — a mock cannot reproduce AOI band behaviour,
HLC timestamps, or the actual CH_INTEREST encoding. All matrix tests use the
real server binary.

## Status

Status: Accepted

## Decision Makers

- iFire

## Further Reading

[@dual_client]: [20260425-dual-client-test.md](20260425-dual-client-test.md) — dual observer design.

[@threejs_observer]: [20260425-threejs-observer.md](20260425-threejs-observer.md) — Three.js observer client.

[@threejs_player]: [20260425-threejs-player.md](20260425-threejs-player.md) — Three.js player client (Stage 2).
