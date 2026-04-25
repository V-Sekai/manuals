# Dual-Client Test: Native Desktop and Three.js Against One Godot Zone Server

- Status: accepted
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Testing, Playwright, Godot, Threejs, DualClient, ZoneServer, 20260425-dual-client-test

## The Context

The jellyfish game has two clients: a Godot native PCVR client and a Three.js
WebGPU browser observer. Both connect to the same Godot zone server via
WebTransport. The pass condition requires both to be visible simultaneously.
Testing them separately proves each works; testing them together proves they
interoperate against a shared server state.

## The Problem Statement

There is no test that runs both clients against one server at the same time and
verifies they observe the same entity state. Without it, a server-side bug that
affects only one client could go undetected.

## CRIS Score

| Factor       | Score  | Evidence |
| ------------ | ------ | -------- |
| Complexity:  | +1     | Playwright already drives the Three.js client. The Godot headless client is one more process. Shared state comparison is a DataView diff. |
| Reach:       | +1     | Catches any server bug that manifests differently on the two wire encodings. |
| Impediment:  | +1     | The jellyfish pass condition explicitly requires two simultaneous observers. |
| Stakeholder: | +1     | V-Sekai demo smoke test. |
| **Total**    | **+4** | Build now. |

## Design

### Test topology

```
Zone server (Godot headless)
  ├── Godot native client (headless, reads CH_INTEREST, writes to stdout)
  └── Three.js browser client (Playwright Chromium, reads CH_INTEREST via WebTransport)
```

One server, two clients, one Playwright test orchestrating all three.

### Process setup in Playwright

```ts
import { spawn, ChildProcess } from "child_process";

async function startServer(): Promise<ChildProcess> {
  return spawn(GODOT_BIN, ["--headless", "--path", ZONE_PROJECT, "scenes/zone_server.tscn"]);
}

async function startNativeClient(): Promise<ChildProcess> {
  return spawn(GODOT_BIN, ["--headless", "--path", DEMO_PROJECT, "scenes/observer.tscn",
    "--", "--zone-host=127.0.0.1", "--zone-port=17500", "--dump-state=/tmp/native_state.json"]);
}
```

### Three.js client in Playwright

```ts
const { server, port } = await serveWithCOOP(THREEJS_DIST);
const page = await browser.newPage();
await page.goto(`http://localhost:${port}/`);
await page.waitForFunction(() => (window as any).__entities?.length > 0, { timeout: 15_000 });
const browserEntities = await page.evaluate(() => (window as any).__entities);
```

The Three.js client writes parsed CH_INTEREST state to `window.__entities` each
frame, accessible via `page.evaluate()`.

### State comparison

Both clients read from the same server. After one server tick, both should
observe the same set of `global_id` values and matching positions within
floating-point tolerance:

```ts
const nativeState  = JSON.parse(fs.readFileSync("/tmp/native_state.json", "utf8"));
const browserState = await page.evaluate(() => (window as any).__entities);

const nativeIds  = new Set(nativeState.map((e: any) => e.id));
const browserIds = new Set(browserState.map((e: any) => e.id));

expect([...nativeIds].sort()).toEqual([...browserIds].sort());

for (const ne of nativeState) {
  const be = browserState.find((e: any) => e.id === ne.id);
  expect(be).toBeDefined();
  expect(be.pos[0]).toBeCloseTo(ne.pos[0], 1);  // 10 cm tolerance
  expect(be.pos[1]).toBeCloseTo(ne.pos[1], 1);
  expect(be.pos[2]).toBeCloseTo(ne.pos[2], 1);
}
```

Position tolerance is 10 cm — larger than the double-precision encoding error,
small enough to catch a wire decode bug.

### Godot native client state dump

The observer scene needs a `--dump-state` flag that writes the last received
CH_INTEREST batch to a JSON file on exit. This is a one-function addition to
`operator_camera.gd` or a new `headless_dump.gd` script:

```gdscript
func _on_fabric_client_state(entities: Array) -> void:
    if OS.has_feature("headless"):
        var path := OS.get_cmdline_user_args().filter(
            func(a): return a.begins_with("--dump-state=")
        ).map(func(a): return a.split("=")[1]).front()
        if path:
            FileAccess.open(path, FileAccess.WRITE).store_string(JSON.stringify(entities))
```

### Playwright spec structure

```
dual_client.spec.ts
  setup:   start zone server, wait for port open
  test 1:  native client connects, receives entities, dumps state
  test 2:  Three.js client connects, receives entities, exposes via window.__entities
  test 3:  both run simultaneously; compare entity sets
  teardown: kill server and native client
```

## The Downsides

Three processes running simultaneously in CI is noisy. Zone server startup time
adds ~3 s to the test. The `--dump-state` flag needs implementing in GDScript.

## The Road Not Taken

Testing via a mock server: rejected — a mock cannot reproduce the actual
server's entity scheduling, HLC timestamping, or AOI band behaviour. The dual
client test must use the real server.

## Status

Status: Accepted

## Decision Makers

- iFire

## Further Reading

[@jellyfish_pass]: [20260425-jellyfish-pass-condition.md](20260425-jellyfish-pass-condition.md) — the pass condition this test validates.

[@threejs_observer]: [20260425-threejs-observer.md](20260425-threejs-observer.md) — Three.js observer client design.
