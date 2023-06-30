
# V-Sekai Meeting - Friday, June 30, 2023

## Principles

- Optimally piggybacking on systems others have built / are maintaining.
- Determining what we can feasibly build and what we can enable others to build.

## Foundational Runtime Features (Provided by the Platform)

1. Environment
2. Scene loading support
3. World hosting (network protocol)
4. Holepunching (users host?) or relay system. Multi-instance server system?

### Interaction with Others

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

## Additional Features

- Doodling (with a builtin script to save to a file)
- Cameras (take a picture - screenshot?)
- Mirrors + camera
- Video player (static + playback of videos without a duration aka live) libvlc or ffmpeg

## Local API (http OR jsonrpc OR local pipe OR OSC etc.) for Extending the Platform

- Allow users to write scripts and plugins for v-sekai
- Or allow a local user to write custom GDScript into v-sekai
- API to create an object.

## Web Requests to Servers

- Needs API or scripting language. What RPCs or functions can you use?

## Foundational Static Content Creation/SDK Features (in the Editor)

- VRM import (avatars)
- Godot editor
- World creation
- Uploading / sharing content items to an inventory.

## Features that We Can Source from Third Parties

- Screen sharing (OBS)

## Features that We Can Enable Platform Developers to Build

- Text chat
- Collaboration features / meeting spaces
  - Doodling
  - 3D doodling/modeling tools sketch
  - Saving and loading of content at runtime
- Support for proprietary video hosting websites
