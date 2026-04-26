# Three.js WebGPU Client Against the Godot Zone Server

Superseded by: [20260425-godot-observer.md](20260425-godot-observer.md) and [20260425-godot-player.md](20260425-godot-player.md)

- Status: superseded — not being built
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Threejs, WebGPU, WebTransport, ZoneServer, Client, 20260425-threejs-webgpu-zone-client

## The Context

The Godot web export path requires a wasm32/wasm64 build, COOP/COEP headers,
SharedArrayBuffer, and a service worker. Three.js r171+ ships a production-ready
WebGPU renderer [@threejswebgpu2026] supported on all major browsers including
iOS Safari since September 2025. The zone server already speaks WebTransport.
The CH_INTEREST packet format is fully specified in `fabric_zone_types.h` —
100 bytes per entity, fixed offsets, no Godot dependency.

## The Problem Statement

The Godot web export client blocks on a multi-minute wasm build for every
iteration. Three.js + WebTransport eliminates the build step entirely: connect,
parse the 100-byte wire format, render. The operator camera overlay — load bars,
dot clustering — becomes plain DOM/Canvas over a Three.js scene.

## CRIS Score

| Factor       | Score  | Evidence |
| ------------ | ------ | -------- |
| Complexity:  | +1     | The packet format is bounded and documented. Three.js WebGPU is production-ready. Dual-client risk is real but contained to the read path. |
| Reach:       | +1     | Pure browser, no WASM, no install, no service worker. Works wherever WebGPU is supported. |
| Impediment:  | +1     | The wasm build blocks every iteration of the operator camera and overlay work. Three.js removes the bottleneck. |
| Stakeholder: | +1     | The aquarium demo needs to ship. A Three.js client reaches the demo faster than the Godot wasm path. |
| **Total**    | **+4** | Build it. |

## Design

### Wire protocol — CH_INTEREST (read only, 100 bytes per entity)

```
Offset  Size  Field
  0       4   global_id (int32)
  4      24   cx, cy, cz (float64 × 3)
 28      12   vx, vy, vz (int16 × 3, scale V_SCALE)
 34       6   ax, ay, az (int16 × 3, scale A_SCALE)
 40       4   hlc = tick(24b) | counter(8b)
 44      56   payload[14] (uint32 × 14)

payload[0] bits:
  [31:24] entity_class   (0=NPC, 1=player, 2=prop, 3=effect, 4=humanoid bone)
  [23: 8] owner_id
  [ 7: 0] state_flags
```

For class=4 (V-Sekai humanoid bone):
```
payload[1] = axis_x int16 (lo) | axis_y int16 (hi)  — swing ±1 → ±32767
payload[2] = axis_z int16 (lo) | reserved            — twist axis
```

Bones are stored as swing/twist triplets in [-1, 1], consistent with
`TransformUtil.swing_twist` in the humanoid project and the camera ADR
[20260425-operator-camera-2-5d.md](20260425-operator-camera-2-5d.md).

### TypeScript packet parser

```ts
const V_SCALE = 1 / 100;   // int16 → m/s
const A_SCALE = 1 / 1000;  // int16 → m/s²

interface Entity {
  id: number;
  pos: [number, number, number];
  vel: [number, number, number];
  entityClass: number;
  ownerId: number;
  payload: Uint32Array;
}

function parseInterest(buf: ArrayBuffer): Entity[] {
  const view = new DataView(buf);
  const count = buf.byteLength / 100;
  const out: Entity[] = [];
  for (let i = 0; i < count; i++) {
    const o = i * 100;
    out.push({
      id:    view.getInt32(o, true),
      pos:   [view.getFloat64(o + 4,  true),
              view.getFloat64(o + 12, true),
              view.getFloat64(o + 20, true)],
      vel:   [view.getInt16(o + 28, true) * V_SCALE,
              view.getInt16(o + 30, true) * V_SCALE,
              view.getInt16(o + 32, true) * V_SCALE],
      entityClass: (view.getUint32(o + 44, true) >> 24) & 0xff,
      ownerId:     (view.getUint32(o + 44, true) >>  8) & 0xffff,
      payload:     new Uint32Array(buf, o + 44, 14),
    });
  }
  return out;
}
```

### Three.js WebGPU scene

```ts
import * as THREE from "three";
import { WebGPURenderer } from "three/webgpu";

const renderer = new WebGPURenderer({ antialias: true });
await renderer.init();

const scene = new THREE.Scene();
const camera = new THREE.OrthographicCamera(...);
camera.rotation.x = -(0.153 * Math.PI * 2);  // SWING_ELEVATION

// One InstancedMesh per entity class — 1800 entities, one draw call.
const jellyMesh = new THREE.InstancedMesh(jellyGeom, jellyMat, 1800);
scene.add(jellyMesh);
```

### WebTransport connection

```ts
const wt = new WebTransport(`https://${host}/zone`);
await wt.ready;
const reader = wt.datagrams.readable.getReader();

(function pump(result: ReadableStreamReadResult<Uint8Array>) {
  if (result.done) return;
  const entities = parseInterest(result.value.buffer);
  updateScene(entities);
  reader.read().then(pump);
})(await reader.read());
```

The datagram reader is captured once and reused — the same exclusive-lock
invariant proved in [20260425-jellyfish-game.md](20260425-jellyfish-game.md)
and the WebTransport audit.

### Operator overlay

Load bars and dot clustering (see [20260425-operator-overlay.md](20260425-operator-overlay.md))
become a `<canvas>` element over the Three.js canvas — plain 2D Context API,
no CanvasLayer needed.

## Client split

Two clients replace the previous Godot wasm web export:

| Client | Transport | Use case |
| ------ | --------- | -------- |
| Godot native PCVR | WebTransport (picoquic) | High-fidelity VR, full entity control |
| Three.js WebGPU | WebTransport (browser API) | Browser: operator view, WebXR VR, godot-sandbox WASM scripts, taskweft WASM planner |

The Godot wasm32/wasm64 build is dropped. The COOP/COEP service worker,
SharedArrayBuffer build flags, and gescons wasm targets are no longer needed
for the client path.

## Extending the browser client

Two components can move into the browser without a Godot runtime:

godot-sandbox runs GDScript as RISC-V ELF guests via libriscv. The ELF is
compiled once and stored in the CDN. libriscv is the VM:

```
GDScript  → RISC-V ELF   (compile once; CDN asset)
libriscv  → WASM          (Emscripten; browser loads VM, feeds it the ELF)
```

No binary equivalence is required. `WasmEquiv.lean` proves `vm_deterministic`:
the VM is a pure function, so the same ELF + same state always yields the
same result on any host.

taskweft standalone headers (`standalone/tw_planner.hpp`) are header-only C++20
with no BEAM dependency and no libriscv layer — they compile directly to WASM
via Emscripten. `emcc standalone/tw_planner.hpp -o tw_planner.wasm` produces a
module that runs RECTGTN planning in the browser, using the same species domain
JSON-LD files that drive the native zone server.

VR presence uses Three.js + WebXR Device API (`renderer.xr.enabled = true`,
`VRButton.createButton(renderer)`). The Godot XR layer is not required.

## The Downsides

Implementing CH_PLAYER datagrams in TypeScript to send entity input is a second
scope of work; the initial Three.js client is observer-only.

The actual integration risk is the godot-sandbox guest ABI (syscall shim from
RISC-V `ecall` to Emscripten host) and taskweft Emscripten build constraints.
These are engineering work. `WasmEquiv.lean` proves `vm_deterministic` (the
VM is a pure function); it does not prove the ABI shim is correct.

The packet format is internal and could change without versioning. A format
version byte in the first octet of CH_INTEREST would protect against silent
breakage; that change belongs in a separate ADR.

## The Road Not Taken

Godot wasm32/wasm64 web export: dropped. Build friction (multi-minute compile,
COOP/COEP, service worker, SharedArrayBuffer) exceeded the benefit once the
native PCVR client covers VR and Three.js covers the browser.

## Status

Status: Accepted

## Decision Makers

- iFire

## Further Reading

[@threejswebgpu2026]: "What's New in Three.js (2026): WebGPU, New Workflows & Beyond." utsubo.com. <https://www.utsubo.com/blog/threejs-2026-what-changed>

[@threejswebgpudocs]: "WebGPU — three.js docs." Three.js. <https://threejs.org/docs/pages/WebGPU.html>

[@threejswebgpurenderer]: "WebGPURenderer — three.js docs." Three.js. <https://threejs.org/docs/pages/WebGPURenderer.html>
