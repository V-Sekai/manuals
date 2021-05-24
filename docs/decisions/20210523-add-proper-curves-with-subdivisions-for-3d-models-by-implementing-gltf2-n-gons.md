# Add proper curves with subdivisions for 3d models by implementing glTF2 n-gons in Godot Engine

- Status: draft
- Deciders: @fire
- Tags: gltf,3d,godotengine

## Context and Problem Statement

To have proper curves with subdivisions, for 3d models, 3d models require using quads; otherwise, the shapes are just wrong in some cases. 

## Considered Options

- glTF n-gons proposal

## Decision Outcome

Chosen option: glTF2 n-gons proposal

### glTF2 n-gons proposal

- Good, because it allows better decimation
- Good, because it allows better curves
- Bad, because it increases render complexity

## Links <!-- optional -->

- KhronosGroup/glTF-Blender-IO#622 
- KhronosGroup/glTF#1620
