# Proposed: Godot Engine as Wasm Importer

## The Context

There are concerns regarding the security of gltf and fbx document code in Godot Engine.

## The Problem Statement

The current implementation of gltf and fbx document code in Godot Engine may pose potential security risks.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

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

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team, Fire, Benbot

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [Elixi Nodejs](https://github.com/revelrylabs/elixir-nodejs)
4. [orb-runtime to run wasm](https://github.com/benbot/orb/blob/master/orb-runtime/src/lib.rs)

AI assistant Aria assisted with this article.