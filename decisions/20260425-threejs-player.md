# Three.js WebGPU Client — Stage 2: Player

Supersedes: [20260425-threejs-webgpu-zone-client.md](20260425-threejs-webgpu-zone-client.md) (split)
Requires: [20260425-threejs-observer.md](20260425-threejs-observer.md)

- Status: draft
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Threejs, WebGPU, WebTransport, Player, ZoneServer, libriscv, taskweft, WebXR, 20260425-threejs-player

## The Context

Stage 1 ([20260425-threejs-observer.md](20260425-threejs-observer.md)) delivers
a read-only browser observer. Stage 2 adds entity control, GDScript behavior
via libriscv WASM, RECTGTN planning via taskweft WASM, and VR presence via WebXR.

## The Problem Statement

The observer cannot send entity input or run behavior scripts. An operator who
wants to interact with entities — spawn jellyfish, trigger behavior changes,
enter VR — needs the player layer.

## CRIS Score

| Factor       | Score  | Evidence |
| ------------ | ------ | -------- |
| Complexity:  | -1     | libriscv WASM ABI shim and taskweft Emscripten build are untested. WebXR adds a VR rendering loop. |
| Reach:       | +1     | Turns the browser observer into a full peer of the native PCVR client for non-VR-headset users. |
| Impediment:  | +1     | Without CH_PLAYER writes, browser users cannot participate — only watch. |
| Stakeholder: | +1     | Creator market depends on browser-native jellyfish creation. |
| **Total**    | **+2** | Schedule soon; normal priority. Unblock Stage 1 first. |

## Design

### CH_PLAYER write path

```ts
function sendPlayer(wt: WebTransport, entityId: number, payload: Uint32Array): void {
  const buf = new ArrayBuffer(100);
  const view = new DataView(buf);
  view.setInt32(0, entityId, true);
  // ... fill position, velocity, payload fields
  wt.datagrams.writable.getWriter().write(new Uint8Array(buf));
}
```

### GDScript behavior via libriscv WASM

The ELF is compiled once and stored in the CDN. `vm_deterministic` in
`WasmEquiv.lean` proves the VM produces the same result on any host:

```
GDScript  → RISC-V ELF   (compile once; CDN asset)
libriscv  → WASM          (Emscripten; browser loads VM, feeds it the ELF)
```

The integration risk is the godot-sandbox guest ABI — the syscall shim mapping
RISC-V `ecall` to Emscripten host calls. This must be verified before Stage 2
ships.

### RECTGTN planning via taskweft WASM

`standalone/tw_planner.hpp` is header-only C++20 with no BEAM dependency.
It compiles directly to WASM via Emscripten and runs the same species domain
JSON-LD files that drive the native zone server. Emscripten build constraints
(no dynamic linking, POSIX subset) must be verified.

### VR presence via WebXR

```ts
renderer.xr.enabled = true;
document.body.appendChild(VRButton.createButton(renderer));
```

The Godot XR layer is not required. Three.js WebXR handles headset rendering.

## The Downsides

libriscv WASM ABI shim and taskweft Emscripten build are unverified. Shipping
Stage 2 before these are tested risks a broken browser VR experience.

## The Road Not Taken

Godot native PCVR client handles high-fidelity VR and is the reference
implementation. Stage 2 is the browser peer; it does not replace the native client.

## Status

Status: Draft

## Decision Makers

- iFire

## Further Reading

[@wasmequiv]: `multiplayer-fabric-taskweft/lean/WasmEquiv.lean` — `vm_deterministic` proof.

[@libriscv]: libriscv — RISC-V interpreter with Emscripten target. <https://github.com/fwsGonzo/libriscv>

[@webxr]: "WebXR Device API." MDN. <https://developer.mozilla.org/en-US/docs/Web/API/WebXR_Device_API>
