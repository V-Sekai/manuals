# Proposed: Blender to Godot API Conversion

## The Context

The current project involves transferring scene tree, mesh data, animation data, and sometimes textures from Blender to Godot. There are challenges due to extra data hiding in metadata and the shifting Blender API.

## The Problem Statement

The Blender API keeps changing, causing issues with the transfer of data to Godot. Additionally, dumping all properties from Blender can cause crashes.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Instead of trying to adapt to the shifting Blender API, we propose to keep the Blender API the same and create a converter on the Godot side. This way, the Blender side only needs to focus on sending/linking data, while Godot handles the conversion and integration.

## The Benefits

- Reduces dependency on Blender's shifting API.
- Simplifies the process for engineers on both Blender and Godot sides.
- Makes it easier to update if things change.

## The Downsides

- Requires development of a robust converter on the Godot side.
- Any changes in Blender's data structure might still require updates to the converter.

## The Road Not Taken

An alternative approach would be to continually adapt to the shifting Blender API, but this could lead to more complex maintenance and potential crashes.

## The Infrequent Use Case

In cases where there is additional metadata or other non-standard data types, these would need to be handled separately by the converter.

## In Core and Done by Us

This proposal suggests a core change in our approach to handling Blender data, moving the conversion responsibility to the Godot side.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team and community stakeholders.

## Tags

- V-Sekai, Blender, Godot, API Conversion

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
