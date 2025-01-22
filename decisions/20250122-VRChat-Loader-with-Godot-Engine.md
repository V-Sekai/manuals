# Proposed: VRChat Loader with Godot Engine HTTP Server

## What is the context of the proposal?

We plan to integrate a VRChat loader that fetches scenes from a Godot Engine HTTP server, enabling dynamic content updates.

## What is the problem being solved?

The existing loader cannot directly use the Godot Engine HTTP server, limiting on-the-fly scene loading.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams.

### Scenario: Retrieve current scene from Godot Engine via HTTP GET request

#### Given

- A VRChat loader accepting scene URLs

#### When

- A request is sent to the Godot Engine HTTP server with a scene ID

#### Then

- The server returns the current scene with a DDS writer on the Godot side
- VRChat loads the .glb file from the DDS response

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

## What tags does the proposal have?

- V-Sekai

## List further reading references.

1. [VRChat GLB Loader](https://github.com/vr-voyage/vrchat-glb-loader)
2. [V-Sekai · GitHub](https://github.com/v-sekai)
3. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)

AI assistant Aria assisted with this article.
