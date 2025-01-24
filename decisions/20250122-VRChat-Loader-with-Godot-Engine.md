# Proposed: VRChat Loader with Godot Engine HTTP Server

## What is the context of the proposal?

We plan to integrate a VRChat loader that fetches scenes from a Godot Engine HTTP server, enabling dynamic content updates.

## What is the problem being solved?

Facilitate updates and management of complex scenes in VRChat by allowing external tools to efficiently modify and synchronize the world environment.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams.

### Stage 1: GLB with Repacked DDS Support

Implement a protocol in Godot Engine for HTTP GET requests of GLB files with repacked DDS textures.

#### Scenario: Retrieve current scene from Godot Engine via HTTP GET request

##### Given

- A VRChat loader accepting scene URLs

##### When

- A request is sent to the Godot Engine HTTP server with a scene ID

##### Then

- The server returns the current scene with a DDS writer (MSFT_texture_dds) on the Godot side
- VRChat loads the GLB file from the DDS response

### Stage 2: 3D Tiles 1.1 Support

Extend the protocol to support HTTP GET requests of Cesium 3D Tiles 1.1 meta files.

#### Scenario: Retrieve current scene from Godot Engine via HTTP GET request

##### Given

- A VRChat loader accepting scene URLs

##### When

- A request is sent to the Godot Engine HTTP server with a scene ID

##### Then

- The server returns the current scene with a DDS writer (MSFT_texture_dds) on the Godot side
- VRChat loads the Cesium 3D Tiles 1.1 meta file from the DDS response

## What are the benefits of the proposal?

- Supports real-time content updates in VRChat
- Leverages existing Godot Engine HTTP capabilities
- Extends VRChat’s functionality

## What are the downsides of the proposal?

- Involves extra development and testing
- Possible compatibility challenges with VRChat loaders

## What are the alternative proposals?

- Continue using static scene loading
- Create a specialized VRChat loader

## When might the proposed solution be used rarely or not at all?

- If static scenes suffice
- If the Godot Engine HTTP server is unavailable

## Is this a V-Sekai core responsibility, and should it be done by us?

This solution could broaden social VR possibilities. A thorough review of feasibility and integration with VRChat is necessary before adopting it as core.

## What is the status of the proposal?

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Who is making decisions on the proposal?

- V-Sekai development team
- Fire
- Astral Druid
- HumbleTim

## What tags does the proposal have?

- V-Sekai

## List further reading references.

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)
3. [VRChat GLB Loader](https://github.com/vr-voyage/vrchat-glb-loader)
4. [Galbi SDK](https://galbi-sdk-docs.pages.dev/en/)
5. [World Name: Project Galbi](https://vrchat.com/home/launch?worldId=wrld_068ed758-68b1-40bc-b647-f54c3b3d92fc)
6. [The-Cheap-or-Nasty-Pattern](https://zguide.zeromq.org/docs/chapter7/#The-Cheap-or-Nasty-Pattern)
7. [CesiumGS/3d-tiles](https://github.com/CesiumGS/3d-tiles)

## Future Work

- Auto-reload every 30-120 seconds
- Replace VRChat with Godot Engine Game
- Expose local Godot server to the web using Tailscale
- Optimize to prevent loader lag
- Use 3D Tiles 1.1 as a container for glTF2, downloadable by VRChat world, e.g., `https://example.com/3d-tiles-1.1.glb?uri=https%3A%2F%2Fgithub.com%2FCesiumGS%2F3d-tiles-samples%2Fblob%2Fmain%2F1.1%2FBoundingBoxTests%2F2_0_0-4_1_1%2Ftileset.json`
