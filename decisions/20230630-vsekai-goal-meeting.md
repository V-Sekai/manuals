# Accepted: V-Sekai Meeting - Friday, June 30, 2023

Original pad (90 day expiration): https://pad.sfconservancy.org/p/v-sekai-goals-meet-2023-06-30.md /timeslider#937

## Context and Problem Statement

Meeting goal: determine what we can feasibly build and what we can enable others to build.

## Principles

- Optimally piggybacking on systems others have built / are maintaining.
- Build things we would want to use

## Foundational Runtime Features (Provided by the Platform)

### Environment

- Scene loading support
- World hosting (network protocol)
- Instancing: Holepunching (users host?) and relay system and Multi-instance server system?

### Person to person interaction

- Avatar support
- Avatar animation system
- VoIP (voice communication)
- IK synchronization and other player / avatar synchronization
- Object parenting support (chairs)

### Interaction with the World

- Interactive elements
- Grabbable objects
- Buttons
- Physics

### Additional Features

- Doodling (with a builtin script to save to a file)
- Cameras (take a picture - screenshot?)
- Mirrors + camera
- Video player (static + playback of videos without a duration aka live) libvlc or ffmpeg
- Local API (http OR jsonrpc OR local pipe OR OSC etc.) for Extending the Platform
  - Allow users to write scripts and plugins for V-Sekai
  - Or allow a local user to write custom GDScript into V-Sekai
  - API to create an object.
  - Determine RPCs or functions to expose)

## Web Requests (HTTP or WebSocket) to Servers

- Needs API or scripting language.

## Foundational Static Content Creation/SDK Features (in the Editor)

- VRM import (avatars)
- Godot editor
- World creation
- Uploading / sharing content items to an inventory.

## Features that We Can interface with Third Parties

- Screen sharing (OBS)
- Modeling and 3D Creation (Blender)

## Features that We Can Enable Platform Developers to Build

- Text chat
- Collaboration features / meeting spaces
  - Doodling
  - 3D doodling/modeling tools sketch
  - Saving and loading of content at runtime
- Support for proprietary video hosting websites

## References

- [V-Sekai](https://v-sekai.org/)
