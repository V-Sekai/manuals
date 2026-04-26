# Godot Web Client WebTransport: Implementation Record

> **Note (active focus):** the browser/web client direction is currently
> **deferred** while we ship VR ([20260425-godot-player.md](20260425-godot-player.md))
> first. Browser observation is SOMEDAY (per
> [20260425-godot-observer.md](20260425-godot-observer.md)), and no new
> Playwright work is being added — the spec referenced below is a one-time
> historical PoC that proved the bug fixes recorded here. Future test
> orchestration is shell-based (see
> [20260425-headless-test-matrix.md](20260425-headless-test-matrix.md)).

## The Context

The Infinite Aquarium / Virtual Creator Market targets web browsers as the
primary client delivery mechanism — zero install, URL-based discovery. The
`feat/module-http3` module provides `WebTransportPeer` for both native
(picoquic) and web export (browser's native WebTransport API via
`quic_web_glue.js`). This ADR records the bugs found and the proof-of-concept
that the web client works end-to-end.

## The Problem Statement

Four independent bugs prevented the Godot wasm32 web export from using
`WebTransportPeer` from GDScript. Without all four fixed, datagrams could not
flow between a browser-loaded Godot game and a Godot zone server.

## The Bugs and Fixes

### Bug 1: JS library not reaching Emscripten linker

`modules/http3/SCsub` called `env_quic.AddJSLibraries(...)` on a cloned
environment. `platform/web/SCsub` reads `sys_env["JS_LIBS"]` (the root env).
Cloned env changes do not propagate upward — `quic_web_glue.js` was never
passed as `--js-library` to `em++`.

**Fix**: `env.Append(JS_LIBS=[File("#modules/http3/quic_web_glue.js")])`
directly on the root env.

### Bug 2: Duplicate symbol silences web backend

`quic_picoquic_backend.cpp`'s `#else !GODOT_QUIC_NATIVE_BACKEND` branch
provides empty stubs for `register_quic_picoquic_backend()`. Since both
`.cpp` files compile with the same `env_quic` (which has
`GODOT_QUIC_WEB_BACKEND` defined), the linker sees two definitions and
silently picks the empty stub. The web backend was never registered.

**Fix**: Guard the empty stubs with
`#elif !defined(GODOT_QUIC_WEB_BACKEND)` so they are only compiled when
neither backend is active.

### Bug 3: Worker thread cannot call browser WebTransport API

Godot's game loop runs in a pthread worker. `quic_web_glue.js` functions
like `godot_wt_connect` call `new WebTransport(url)` — a browser API
unavailable in workers. The original file had a misnamed proxy declaration
(`godot_WTServerSession__proxy`) that did nothing. Emscripten 5.x rejects
orphaned proxy declarations.

**Fix**: Add `__proxy: 'sync'` to every exported function in
`quic_web_glue.js`. Each call from the worker is proxied to the main
browser thread synchronously.

### Bug 4: poll() never ingests incoming datagrams

`web_transport_peer.cpp::poll()` was extended to call `session_state_func`
for the web backend, but returned immediately afterward without pulling
received datagrams from `sess.datagrams_in` (the JS queue) into the C++
`incoming` queue. `get_available_packet_count()` always returned 0.

**Fix**: Add `poll_incoming_func` static pointer. `quic_web_backend.cpp`
implements `_web_poll_incoming` which calls `godot_wt_recv_datagram` in a
loop, forwarding each datagram to `_push_wt_incoming_datagram`. `poll()`
calls it after `session_state_func`.

## Proof of Concept

`modules/http3/demo/` contains `wt_client_web.gd` (extends Node), a scene,
and a Godot project. Exported as PCK with `--export-pack "Web"` and loaded
via `bin/.web_zip/godot.js` (wasm32 threaded) plus a Node.js COOP/COEP HTTP
server in the Playwright test.

`e2e/godot_wt_e2e.spec.ts` (in `multiplayer-fabric-zone-backend/frontend/`)
starts `wt_server_demo.gd` as echo server, loads the web export in Chromium,
injects `window.WT_CERT_HASH` and monkey-patches `window.WebTransport` to
add `serverCertificateHashes`, waits for `window.__wt_beacons` to contain a
`{"event":"pass"}` beacon.

**Result**: PASS in 3.3 s.

```
browser: {"event":"init","host":"127.0.0.1","port":54370}
browser: [WT patch] connecting to: https://127.0.0.1:54370/wt
browser: [WT patch] ready: https://127.0.0.1:54370/wt
browser: {"event":"sent","msg":"Hello Godot WebTransport"}
browser: {"event":"pass","echo":"Hello Godot WebTransport"}

server:  {"count":1,"event":"recv"}
server:  {"event":"echo","len":24,"mode":0}
```

## What Is Not Decided Here

- Production cert pinning: the monkey-patch approach is test-only.
  Production connections use normal TLS (no `window.WT_CERT_HASH`).
- Loading a full game project in the browser (requires export templates).
  The PoC uses `--export-pack` with `bin/.web_zip` engine files.
- Replacing the gescons32 manual web_zip copy step with a proper SCons
  install target.

## Status

Status: Accepted

## Decision Makers

- iFire

## Tags

- WebTransport, web-client, Emscripten, wasm32, threads, proxy-sync,, 20260425-godot-web-client-webtransport
  Godot, GDScript, datagram, e2e
