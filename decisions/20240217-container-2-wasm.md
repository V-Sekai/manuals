# Proposed: Container2Wasm Integration in V-Sekai

## Context

V-Sekai is a project focused on social VR functionality for the Godot Engine. It aims to bring social VR/VRSNS/metaverse components to the Godot Engine, enhancing avatar customization and AI-driven facial expressions.

## Problem Statement

Integrating complex backend services directly within a browser or lightweight client environments can be challenging. This integration is crucial for enhancing avatar customization and AI-driven facial expressions by leveraging containerized services.

## Proposed Solution

We propose to use `container2wasm`, a tool that converts container images to WebAssembly (WASM) format. This will enable these containers to run on WASM with emulation support for x86_64 and riscv64 containers. The tool works with various WASI runtimes like wasmtime, wamr, wasmer, wasmedge, and wazero, and it can also run in the browser.

1. Convert container image to WASM using container2wasm
2. Deploy the WASM module in the desired environment
3. Run the WASM module using a suitable WASI runtime

## Benefits

- Enables running of containerized services directly in the browser or lightweight client environments.
- Enhances avatar customization and AI-driven facial expressions in V-Sekai.
- Leverages the power of WASM for efficient, safe, and portable execution.

## Downsides

- Requires understanding and maintenance of WASM modules.
- Potential compatibility issues with certain containerized services.

## The Road Not Taken

An alternative would be to run the backend services on dedicated servers and communicate with them via APIs. However, this could introduce latency and require more resources.

## The Infrequent Use Case

In scenarios where the backend service is not frequently used, converting it to WASM might not provide significant benefits.

## In Core and Done by Us

The integration of `container2wasm` will be done by the V-Sekai development team with support from the community stakeholders.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team and community stakeholders.

## Tags

- V-Sekai, Avatar Customization, AI, Facial Expressions

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)
3. [Container2Wasm · GitHub](https://github.com/ktock/container2wasm)

_This proposal was assisted by Aria, an AI assistant._
