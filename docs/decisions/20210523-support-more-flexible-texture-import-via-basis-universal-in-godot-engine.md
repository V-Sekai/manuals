# Support more flexible texture import via Basis Universal in Godot Engine

- Status: draft
- Deciders: fire
- Tags: godotengine,gltf

## Context and Problem Statement

Support more flexible texture import via Basis Universal in Godot Engine. Adding Basis Universal allows more flexibility in the import.
-->

## Considered Options

- Basis Universal

## Decision Outcome

Chosen option: Basis Universal

### Positive Consequences

- More flexibility between mobile and desktop

### Negative Consequences <!-- optional -->

- Dramatically slower import
- Texture limits?

## Pros and Cons of the Options <!-- optional -->

### Basis Universal

Add basis universal to Godot Engine via glTF

- Good, because Basis Universal isn't fully supported in the import pipeline
- Good, because it bridges Web, Desktop and Mobile
- Bad, because makes importing slower

## Links <!-- optional -->

- https://github.com/KhronosGroup/glTF/blob/master/extensions/2.0/Khronos/KHR_texture_basisu/README.md
