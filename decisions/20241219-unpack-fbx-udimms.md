# Draft: Use FBX UDIMMs with FBX UDIM Unpacker in Godot Engine

## The Context

The increasing need for higher texture resolution on 3D models often necessitates the use of multiple textures, a technique known as UDIMs. This approach, originating from the VFX industry, allows for a single material to utilize multiple texture "tiles" at varying resolutions, providing greater detail and flexibility.

## The Problem Statement

Currently, Godot Engine lacks native support for UDIMs, hindering efficient workflows for artists who require high-resolution textures. This limitation forces developers to split materials during modeling or employ workarounds that can be cumbersome and time-consuming.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

This proposal suggests implementing a dedicated UDIM importer and integration within Godot's material system. The importer would process FBX files containing UDIM information, correctly assigning texture tiles to the corresponding UV coordinates. This would streamline the workflow for artists, enabling them to import and utilize high-resolution textured models seamlessly.

> This tool takes an input FBX file that uses UDIMs by having UVs that are outside the 0-1 range. For example, if a polygon's UVs are in the range (1-2, 0-1), it's the UDIM tile 1002 (conceptually one to the right of the main UV space), wheras UVs in the range (0-1, 0-1) are UDIM tile 1001.
>
> Any polygon UVs which reference UDIM tiles outside 1001 trigger the splitting of the material "Foo" into "Foo_U1001", "Foo_U1002", "Foo_U1010" and so on based on the UDIM tile. Polys are then changed to reference the material corresponding to their UDIM tile, and the UVs are adjusted back to the 0-1 range.
>
> The tool then writes the result to another FBX file. If you import that FBX into a 3D engine, it will have extra materials from the original, depending on how many UDIM tiles were used. You can then hook up materials to the correct UDIM texture tiles, one per texture, and use the model like normal.
>
> <https://github.com/V-Sekai/fbx-udim-unpack?tab=readme-ov-file#what-this-tool-does> from <https://github.com/sinbad>

## The Benefits

Implementing UDIM support offers several advantages:

- **Improved Artist Workflow:** Streamlines the process of importing and working with high-resolution models.
- **Enhanced Visual Fidelity:** Allows for greater detail and realism in 3D assets.
- **Industry Standard Compatibility:** Aligns Godot with industry-standard practices in texture management.

## The Downsides

- **Development Time and Resources:** Requires dedicated effort to implement and integrate UDIM support.
- **Potential Performance Impact:** May introduce minor performance overhead depending on the implementation.

## The Road Not Taken

Alternative solutions, such as manual texture assignment or third-party plugins, were considered less efficient and maintainable compared to native UDIM support.

## The Infrequent Use Case

While UDIMs are becoming increasingly common, simpler projects with lower texture resolution requirements may not necessitate this feature.

## Why is it in Core and done by us?

Native UDIM support aligns with Godot's goal of providing a comprehensive and artist-friendly game development environment. Implementing this feature within the core engine ensures its availability and maintainability for all users.

## Status

Status: Draft

## Decision Makers

- V-Sekai development team
- Godot Engine developers

## Tags

- V-Sekai
- Godot Engine
- UDIM
- Texturing

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [V-Sekai/fbx-udim-unpack](https://github.com/V-Sekai/fbx-udim-unpack)
4. [better-fbx-importer--exporter](https://blendermarket.com/products/better-fbx-importer--exporter)

AI assistant Aria assisted with this article.
