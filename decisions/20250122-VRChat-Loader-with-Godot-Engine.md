# Proposed: Godot Engine HTTP Server for GLB Download and Repack

## What is the context of the proposal?

We plan to integrate a VRChat loader that fetches scenes from a Godot Engine HTTP server, enabling dynamic content updates.

## What is the problem being solved?

Facilitate updates and management of complex scenes in VRChat by allowing external tools to efficiently modify and synchronize the world environment.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams.

### GLB with Repacked DDS Support

Implement a protocol in Godot Engine for HTTP GET requests of GLB files with repacked DDS textures.

https://example.com/MSFT_texture_dds?uri=https%3A%2F%2Fraw.githubusercontent.com%2FKhronosGroup%2FglTF-Sample-Assets%2Fmain%2FModels%2FCompareRoughness%2FglTF-Binary%2FCompareRoughness.glb

#### Scenario: Retrieve current scene from Godot Engine via HTTP GET request

##### Given

- A VRChat loader accepting scene URLs

##### When

- A request is sent to the Godot Engine HTTP server with the uri

##### Then

- The server returns the current scene with a DDS writer (MSFT_texture_dds) on the Godot side
- VRChat loads the GLB file from the DDS response

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
- VRChat
- Godot Engine
- HTTP Server
- GLB
- DDS
- Real-time Updates
- Scene Management

## List further reading references.

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)
3. [VRChat GLB Loader](https://github.com/vr-voyage/vrchat-glb-loader)
4. [Galbi SDK](https://galbi-sdk-docs.pages.dev/en/)
5. [World Name: Project Galbi](https://vrchat.com/home/launch?worldId=wrld_068ed758-68b1-40bc-b647-f54c3b3d92fc)
6. [The-Cheap-or-Nasty-Pattern](https://zguide.zeromq.org/docs/chapter7/#The-Cheap-or-Nasty-Pattern)
