# Three.js WebGPU Client — Stage 1: Observer

Supersedes: [20260425-threejs-webgpu-zone-client.md](20260425-threejs-webgpu-zone-client.md) (split)

Superseded by: [20260425-godot-observer.md](20260425-godot-observer.md)

- Status: superseded
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Threejs, WebGPU, WebTransport, Observer, ZoneServer, 20260425-threejs-observer

## The Context

The zone server speaks WebTransport. The CH_INTEREST packet format is fully
specified in `fabric_zone_types.h` — 100 bytes per entity, fixed offsets. A
read-only observer client needs no Godot runtime, no wasm build, and no
service worker.

## The Problem Statement

The operator view needs a browser client that starts in minutes, not after a
multi-minute wasm compile. Stage 1 delivers that: connect, parse datagrams,
render entities.

## CRIS Score

| Factor       | Score  | Evidence |
| ------------ | ------ | -------- |
| Complexity:  | +1     | Packet parser is 20 lines of TypeScript. Three.js WebGPU is production-ready. |
| Reach:       | +1     | Pure browser, no install. Works wherever WebGPU is supported. |
| Impediment:  | +1     | Unblocks operator camera, overlay, and smoke-test runbook immediately. |
| Stakeholder: | +1     | Aquarium demo Phase 1 operator view depends on this. |
| **Total**    | **+4** | Build now. |

## Design

### Wire protocol — CH_INTEREST (100 bytes, read only)

```
Offset  Size  Field
  0       4   global_id (int32)
  4      24   cx, cy, cz (float64 × 3)
 28      12   vx, vy, vz (int16 × 3, scale 1/100 m/s)
 34       6   ax, ay, az (int16 × 3, scale 1/1000 m/s²)
 40       4   hlc = tick(24b) | counter(8b)
 44      56   payload[14] (uint32 × 14)

payload[0]: entity_class(8b) | owner_id(16b) | state_flags(8b)
```

### TypeScript packet parser

```ts
function parseInterest(buf: ArrayBuffer): Entity[] {
  const view = new DataView(buf);
  const out: Entity[] = [];
  for (let i = 0; i < buf.byteLength / 100; i++) {
    const o = i * 100;
    out.push({
      id:          view.getInt32(o, true),
      pos:         [view.getFloat64(o+4,true), view.getFloat64(o+12,true), view.getFloat64(o+20,true)],
      entityClass: (view.getUint32(o+44,true) >> 24) & 0xff,
      payload:     new Uint32Array(buf, o+44, 14),
    });
  }
  return out;
}
```

### WebTransport connection

```ts
const wt = new WebTransport(`https://${host}/zone`);
await wt.ready;
const reader = wt.datagrams.readable.getReader();
(function pump(r) {
  if (r.done) return;
  updateScene(parseInterest(r.value.buffer));
  reader.read().then(pump);
})(await reader.read());
```

Reader captured once; exclusive-lock invariant holds (proved in WebTransport audit).

### Three.js WebGPU scene

Orthographic camera at SWING_ELEVATION twist/swing, one `InstancedMesh` per
entity class — 1800 entities, one draw call. Operator overlay (load bars, dot
clustering) is a `<canvas>` over the Three.js canvas per
[20260425-operator-overlay.md](20260425-operator-overlay.md).

## The Downsides

Read-only — no entity input. Stage 2 adds the CH_PLAYER write path.

## The Road Not Taken

Stage 2 features (libriscv, taskweft WASM, WebXR) are deferred; adding them to
Stage 1 would delay shipping the operator view.

## Status

Status: Superseded by [20260425-godot-observer.md](20260425-godot-observer.md). Not being built.

## Decision Makers

- iFire

## Further Reading

[@threejswebgpu2026]: "What's New in Three.js (2026)." utsubo.com. <https://www.utsubo.com/blog/threejs-2026-what-changed>

[@threejswebgpurenderer]: "WebGPURenderer — three.js docs." Three.js. <https://threejs.org/docs/pages/WebGPURenderer.html>
