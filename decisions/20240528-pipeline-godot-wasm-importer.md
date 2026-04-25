# Draft: Godot Engine as Wasm Importer

## The Context

There are concerns regarding the security of gltf and fbx document code in Godot Engine.

## The Problem Statement

The current implementation of gltf and fbx document code in Godot Engine may pose potential security risks.

## Design

The proposal is to compile Godot Engine as wasm and run the wasm workers in batch on the incoming files. This can be achieved without the need for node, using Rustler + wasmtime.

```pseudo
1. Compile Godot Engine as wasm
2. Run wasm workers on incoming files
```

## The Benefits

- Enhanced security for gltf and fbx document code.
- Efficient handling of incoming files.

## The Downsides

- Potential increase in complexity due to the introduction of wasm.
- Possible performance overhead from running wasm workers.

## The Road Not Taken

An additional layer of Godot Engine text scene and text resource to JSON could be implemented to avoid parsing errors.

## The Infrequent Use Case

This solution might not be beneficial for smaller projects or those that do not use gltf and fbx document code extensively.

## In Core and Done by Us

This proposal involves core changes to the Godot Engine and will be implemented by the V-Sekai development team.

## Status

Status: Draft <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team, Fire, Benbot

## Tags

- V-Sekai, 20240528-pipeline-godot-wasm-importer

## Further Reading

[@elixi_nodejs_2024]: "Elixi Nodejs."  <https://github.com/revelrylabs/elixir-nodejs>
[@orbruntime_run_wasm_2024]: "orb-runtime to run wasm."  <https://github.com/benbot/orb/blob/master/orb-runtime/src/lib.rs>

