# Proposed: Enhancing VR Book Reading through SVG Optimization

## Metadata

- **Status**: Proposed
- **Deciders**: V-Sekai
- **Tags**: SVG Optimization, VR Book Reading, V-Sekai

## The Backdrop

V-Sekai is dedicated to advancing the immersive experience in social VR. We can enhance VR book reading, a feature that demands high-quality visuals with efficient resource usage.

## The Challenge

Integrating readable, high-quality SVG-based books into the VR environment presents a dual challenge of maintaining visual clarity while optimizing performance.

## The Strategy

Utilize the `svgcleaner` tool, particularly its Rust implementation, to optimize SVG files for VR book reading. This involves cleaning up SVG files from unnecessary data, thereby reducing file size without compromising visual integrity.

## The Upside

Optimized SVGs lead to faster load times, smoother performance, and an overall enhanced user experience in VR book reading. This aligns with V-Sekai's goal of creating a seamless and engaging VR environment.

## The Downside

The `svgcleaner` tool, particularly its Rust version, is currently archived and read-only, indicating a need for refresh or redevelopment.

## The Road Not Taken

Alternative SVG optimization methods or tools might exist but could lack the specific features or efficiency provided by `svgcleaner`.

## The Infrequent Use Case

While primarily aimed at VR book reading, this optimization could benefit other areas of V-Sekai where SVGs are used.

## In Core and Done by Us?

The task involves integrating an external tool (`svgcleaner`) into the core V-Sekai development process, possibly requiring custom adaptation for the specific VR context.

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine.
3. [svgcleaner on GitHub](https://github.com/RazrFalcon/svgcleaner) - The GitHub repository for `svgcleaner`, a tool to optimize SVG files.

This article was assisted by AI assistant Aria.
