# Accepted: Godot Engine HTTP Server for GLB Download and Repack

## What is the context of the proposal?

We plan to integrate a VRChat loader that fetches scenes from a Godot Engine HTTP server, enabling dynamic content updates.

## What is the problem being solved?

Allow external tools to efficiently modify and synchronize the world environment to facilitate updates and management of complex scenes in VRChat.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams.

### GLB with Repacked DDS Support

Implement a protocol in Godot Engine for HTTP GET requests of GLB files with repacked DDS textures.

https://example.com/MSFT_texture_dds-proxy/raw.githubusercontent.com/KhronosGroup/glTF-Sample-Assets/main/Models/CompareRoughness/glTF-Binary/CompareRoughness.glb

## Is this a V-Sekai core responsibility, and should it be done by us?

This solution could broaden social VR possibilities. A thorough review of feasibility and integration with VRChat is necessary before adopting it as core.

## What is the status of the proposal?

Status: Accepted <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

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
7. [V-Sekai-fire/godot-http-glb-host](https://github.com/V-Sekai-fire/godot-http-glb-host)

AI assistant Aria assisted with this article.
