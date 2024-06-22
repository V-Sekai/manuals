# Proposed: Validator Service for V-Sekai

## Metadata

- Status: Proposed
- Deciders: iFire, Bioblaze Payne, V-Sekai Team
- Tags: V-Sekai, Validator Service, Godot Engine, GLTF, Websockets, API

## Context

V-Sekai is an open-source project that brings social VR/VRSNS/metaverse components to the Godot Engine. The team is considering implementing a validator service to enhance the functionality and reliability of their projects.

## Problem

The current backend system lacks a mechanism to validate scenes, count triangles, convert GLTF to Godot scene, and strip bad code from Godot scenes. This can lead to errors and inefficiencies in the development process.

## Proposed Solution

The proposed solution is to create a validator service that conforms to a specific specification. This service would:

1. Convert GLTF to Godot scene.
2. Go over the scene and print the number of triangles.
3. If necessary, run LOD on the scene.
4. Run a validation that strips the bad code from the Godot scene.
5. Use websockets and an API for communication and function calls.

The front-end for this service could be a CLI that calls the function locally. The asset service would call the validator service, which would then notify the websocket service via its API call.

## Benefits

Implementing this validator service would provide several benefits:

1. Improved accuracy and efficiency in the development process.
2. Enhanced error detection and prevention.
3. Streamlined communication between different parts of the system.

## Potential Downsides

Potential challenges or downsides could include:

1. Complexity in setting up and maintaining the validator service.
2. Need for thorough testing to ensure the validator service works as expected.

## Alternatives Considered

An alternative approach could be to use gdscript + webrtc instead of websockets + API for communication and function calls. However, this would need to be evaluated for feasibility and efficiency.

## Next Steps

The next steps would be to:

1. Finalize the specification for the validator service.
2. Develop the validator service according to the agreed-upon specification.
3. Test the validator service thoroughly to ensure it works as expected.
4. Implement the validator service in the V-Sekai system.

## References

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine

This proposal was assisted by AI assistant Aria.
