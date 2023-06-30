# Changelog 2023-06

In June 2023, various developments and discussions took place in the Godot community, particularly within the V-Sekai project. Key highlights include updates to the `godot-vrm` repository, security improvements in the `v-sekai-game` repository, and progress on animation retargeting and PMX character structure. Additionally, a fix was implemented for Skeleton3D's `rest_dirty` reset issue.

- Fork created: `aaronfranke/godot-vrm` (01/06/2023)
- New commits in `V-Sekai/godot-vrm` repository, including updates to `load_at_runtime_scene` for 4.x and adding `files_dropped` functionality (02/06/2023)
- PR 130 closed, bumping `github/codeql-action` from 2.3.5 to 2.3.6 in `V-Sekai/v-sekai-game` (02/06/2023)
- PR 129 closed, bumping `actions/setup-dotnet` from 3.1.0 to 3.2.0 in `V-Sekai/v-sekai-game` (02/06/2023)
- StepSecurity bot opened PR 131 to apply security best practices in `V-Sekai/v-sekai-game` (02/06/2023)
- New commit in `v-sekai-game:main` to avoid the empty avatar crash (02/06/2023)
- New commits in `v-sekai-game:main`, including changes to assert and early return print `_error` (02/06/2023)
- New tag created in `V-Sekai/godot`: `groups-4.x.2023-06-03T034215Z` (02/06/2023)
- PR 131 closed, applying security best practices in `V-Sekai/v-sekai-game` (02/06/2023)
- New commit in `v-sekai-game:main` to make joining a server less crashy (02/06/2023)
- New commit in `v-sekai-game:main` to remove debug points (02/06/2023)
- New branch created in `V-Sekai/v-sekai-game`: `codeql` (02/06/2023)
- PR 132 opened, creating `codeql.yml` in `V-Sekai/v-sekai-game` (02/06/2023)
- New comment on issue #25 in `V-Sekai/godot-vrm` discussing how to make a VRM model pose using GDScript (02/06/2023)
- New commits in `v-sekai-game:main`, including changes to assert and early return print `_error` part 3, avoiding runtime errors, and removing gut (02/06/2023 - 03/06/2023)
- PR 132 closed, creating `codeql.yml` in `V-Sekai/v-sekai-game` (03/06/2023)
- PR 133 opened, hardening GitHub Actions in `V-Sekai/v-sekai-game` (03/06/2023)
- New comments on issue #25 in `V-Sekai/godot-vrm` discussing animation retargeting and PMX character structure (03/06/2023)
- New commits in `v-sekai-game:main`, including removing hardcoded gravity and gravity direction, inverting state machine condition, and setting up work in progress state chart (03/06/2023)
- New branch created in `V-Sekai/v-sekai-game`: `state-chart` (03/06/2023)
- Skeleton3D now correctly resets `rest_dirty` only after all bone transforms have been updated (PR 78025 by lyuma). This also resolves the SkeletonGizmo display issue when there is more than one bone root.

## Simplified Setup and Advanced Solver System

The team has introduced a feature that allows for easy setup with just a single click. Additionally, they're now utilizing an advanced system known as the Many Bones' solver.

## Graphics Processing Unit (GPU) Performance

There were some concerns about how much time the GPU was spending on processing the shader - think of the shader like a set of instructions telling the GPU how to draw each pixel. The frame times, or the speed at which frames are processed, seemed to be slower than expected. However, it was clarified that these tests were being run in a mode designed for finding errors (debug mode), not for optimal performance.

## Comparing Performance Across Platforms

The team discussed how their system's performance stacks up against other virtual reality social platforms. They used different types of hardware for these comparisons, similar to comparing the performance of different cars using various types of roads and conditions.

## Tailoring Performance for Different Devices

The team also talked about how to best optimize their system for different devices. This is akin to tuning a car's engine differently depending on whether it's going to be driven in the city or on a racetrack.

## Rendering Avatars

There were discussions about the challenges of rendering avatars, especially when there are multiple avatars on the screen at once. It's like trying to paint multiple portraits at the same time - the more you have, the harder it gets. The team discussed the need for guidelines to help avatar creators optimize their designs for less powerful hardware.

## Future Plans

Looking ahead, the team plans to conduct more tests, particularly focusing on how well their system handles complex 3D models on Android devices. They also aim to create a benchmark scenario where they expect good performance across most platforms, much like setting a standard track to test different cars' performances.

## V-Sekai Meeting - Friday, June 30, 2023

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
