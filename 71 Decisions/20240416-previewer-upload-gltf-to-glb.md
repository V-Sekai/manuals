# Proposed: Implementing a 3D Previewer for GLTF with XMP Metadata

## Context

The current project involves the use of 3D models in GLTF format. These models also contain XMP metadata which needs to be previewed.

## Problem Statement

The challenge lies in creating a 3D previewer that handles GLTF files and their associated XMP metadata. The aim is to have one file per entry, making it easier to manage and organize the data.

## Proposed Solution

The proposed solution involves loading a GLTF file and saving it as a GLB file. This process is lossless, meaning no data will be lost during the conversion. The GLB file will then preview the 3D model and its metadata.

```pseudo
function convertToGLB(gltfFile) {
    // Load the GLTF file
    var gltf = loadGLTF(gltfFile);

    // Convert the GLTF to GLB
    var glb = gltf.toGLB();

    // Save the GLB file
    saveGLB(glb);
}
```

## Benefits

- Simplifies the workflow by having only one file per entry.
- No loss of data during the conversion from GLTF to GLB.
- Makes it easier to compress in Godot Engine's workflow.

## Downsides

- Requires additional processing to convert GLTF files to GLB.
- Might increase the overall size of the project due to the conversion.

## The Road Not Taken

An alternative approach could be to keep the GLTF and XMP metadata separate and create a previewer that can handle multiple files. However, this would complicate the workflow and make it harder to manage the data.

## The Infrequent Use Case

This proposal might not be beneficial for projects that do not require a 3D previewer or do not use GLTF files.

## In Core and Done by Us

The implementation of this proposal will be done by the V-Sekai development team.

## Status

Proposed

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

_This proposal was assisted by AI assistant Aria._
