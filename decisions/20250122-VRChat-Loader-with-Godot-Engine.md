# Proposed: VRChat Loader with Godot Engine HTTP Server

## What is the context of the proposal?

We plan to integrate a VRChat loader that fetches scenes from a Godot Engine HTTP server, enabling dynamic content updates.

## What is the problem being solved?

Facilitate updates and management of complex scenes in VRChat by allowing external tools to efficiently modify and synchronize the world environment.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams.

Implement a protocol in Godot Engine for HTTP GET requests of `.glb` files.

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
- HumbleTim

## What tags does the proposal have?

- V-Sekai

## List further reading references.

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)
3. [VRChat GLB Loader](https://github.com/vr-voyage/vrchat-glb-loader)
4. [Galbi SDK](https://galbi-sdk-docs.pages.dev/en/)
5. [World Name: Project Galbi](https://vrchat.com/home/launch?worldId=wrld_068ed758-68b1-40bc-b647-f54c3b3d92fc)

## Future Work

- Add colliders
- Replace VRChat with Godot Engine Game
- Expose local Godot server to the web using Tailscale
- Implement automatic reloader every 30-120 seconds
- Optimize and set limits to prevent loader lag
- Load colliders first, followed by bounding boxes, meshes, and materials
- Create a JSON manifest for placing one `.glb` per object in world space

```json
{
  "extensionsRequired": ["MSFT_texture_dds", "KHR_implicit_shapes"],
  "extensionsUsed": ["MSFT_texture_dds", "KHR_implicit_shapes"],
  "objects": [
    {
      "id": "object1",
      "mimeType": "model/gltf-binary",
      "uri": "path/to/object1.glb",
      "boundingVolume": {
        "sphere": [0, 0, 0, 1]
      },
      "transform": {
        "translation": [1, 0, 0],
        "rotation": [0, 0, 0, 1],
        "scale": [1, 1, 1]
      }
    },
    {
      "id": "object2",
      "mimeType": "model/gltf-binary",
      "uri": "path/to/object2.glb",
      "boundingVolume": {
        "box": [0, 0, 0, 1, 1, 1]
      }
    },
    {
      "id": "object3",
      "mimeType": "model/gltf-binary",
      "uri": "path/to/object3.glb",
      "boundingVolume": {
        "cylinder": [0, 0, 0, 1, 0.5, 0.5]
      }
    },
    {
      "id": "object4",
      "mimeType": "model/gltf-binary",
      "uri": "path/to/object4.glb",
      "boundingVolume": {
        "capsule": [0, 0, 0, 1, 0.5, 0.5]
      }
    }
  ]
}
```

- Implement a space-efficient query string for shifting objects into world space by using a compact JSON format:
- Encode the JSON object into a base64 string to minimize the query string length:
- http://godot-server/load-scenes.glb?data=eyJvYmplY3RzIjpbeyJpZCI6Im9iamVjdDEiLCJ0eXBlIjoibWVzaDovL2dpdGh1Yi5jb20vdi1zZWthaS92cmMtZ2xiLWVuY29kZWQvZ2xURjIuMCtERFMrUE5HIiwicmVzb3VyY2UiOiJwYXRoL3RvL29iamVjdDEuZ2xiIiwidHJhbnNmb3JtIjpbMSwwLDAsMCwwLDEsMCwwLDAsMCwxLDAsMCwwLDAsMCwxXX0seyJpZCI6Im9iamVjdDIiLCJ0eXBlIjoibWVzaDovL2dpdGh1Yi5jb20vdi1zZWthaS92cmMtZ2xiLWVuY29kZWQvZ2xURjIuMCtERFMrUE5HIiwicmVzb3VyY2UiOiJwYXRoL3RvL29iamVjdDIuZ2xiIiwidHJhbnNmb3JtIjpbMC45MjM4Nzk1MDQyMDM3OTY0LDAsMC4zODI2ODM0NTU5NDQwNjEzLDAsMCwwLDEsMCwwLC0wLjM4MjY4MzU1OTQwNjEzLDAsMC45MjM4Nzk1MDQyMDM3OTY0LDAsMTAsMCw1LDFdfV19
