# Rejected: Additional 3D Import Functionality

## Metadata

- Status: rejected <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,ChatGPT-4,AI_assistance
 
## Propose a possible solution to solve a V-Sekai limitation. If this doesn't look right, choose a different type.

Improve the 3D import functionality in Godot Engine for V-Sekai by enhancing the existing import process and adding support for more file formats.

***This proposal is rejected because it doesn't improve the 3D import functionality compared to its effort***

## Metadata

- Status: proposed
- Deciders: V-Sekai
- Tags: V-Sekai, GPT-4

## Context and Problem Statement

V-Sekai has implemented `.fbx` and `.gltf` 3D import, and `.obj` is already part of Godot Engine. However, there is still room for improvement in the import process and support for additional file formats. The current Blender importer for Godot Engine 4.0 requires an additional installation and injects a Python script into Blender.

## Proposed Solution

1. Develop an addon that can simultaneously export colliders, occluders, and LOD variants for a given mesh without requiring an additional Blender importer.
2. Enhance the existing import process by providing better error handling, reporting, and automatic fixes for common issues.
3. Improve the performance of the import process, especially for large and complex 3D models.

## Implementation

1. Create an addon that automatically searches for and sets Geometry Nodes input constants with relevant names (e.g., `is_occluder`, `is_collider`, and `LOD`) while exporting, giving modelers maximum flexibility on how different versions of a mesh should be exported. This addon should not require an additional Blender importer or Python script injection.
2. Update the import pipeline to handle errors gracefully and provide helpful feedback to users.
3. Optimize the import process by implementing caching, parallel processing, and other performance improvements.

## Positive Consequences

1. Users will have more control over the export process, allowing them to easily manage colliders, occluders, and LOD variants without needing an additional Blender importer.
2. The improved import process will reduce the time spent on fixing import-related issues.
3. Faster import times will lead to a smoother development experience.

## Negative Consequences

1. Developing an addon may require additional resources and maintenance.
2. There might be potential licensing issues with integrating third-party libraries.

## Option Graveyard

1. Relying solely on community plugins for additional import functionality.
2. Limiting support to only a few popular file formats.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement addresses a core limitation in the engine and requires significant changes to the import pipeline.

## Is there a reason why this should be core and done by us?

Yes, improving the 3D import functionality is essential for providing a better user experience and supporting a wider range of 3D modeling tools. It also ensures that V-Sekai remains competitive with other game engines.

## References

- [V-Sekai](https://v-sekai.org/)