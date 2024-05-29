# Proposed: Improve the Godot Ecosystem

## The Context

Godot is a powerful open-source game engine that has been gaining popularity due to its flexibility and ease of use. However, there are still areas where it can be improved, particularly in terms of integration with other tools such as Blender.

## The Problem Statement

The current process of exporting assets from Blender to Godot can be cumbersome and inefficient. Additionally, there are certain features in Blender that cannot be exported to Godot at all. This proposal aims to address these issues and improve the overall workflow between the two tools.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Here are some of the key strategies we propose:

1. **Exporting of Blender materials to Godot via a custom GLTF2 extension as Godot shaders.**

   - Strategy: Add MaterialX as a Godot engine shader and then have Blender export it.
   - Work in progress: Translate MaterialX as a Godot Visual Shader.
   - Plan B: Reuse the Blender exporter and use it to export Godot shaders as a glTF extension.

2. **Exporting Blender scene settings (sky, etc) via custom GLTF2 extension as Godot shaders.**

   - Strategy: Find all Godot engine scene properties and write a glTF extension that can save or export it.

3. **Export Blender collision shapes to Godot.**

   - Strategy: Through KHR physics. Official Khronos ratification will give Blender and Godot engine glTF support through Aaron Franke’s PR.

4. **Create and save unique IDs on Blender objects on export.**

   - This needs to be researched a bit more (may need to be a Blender add-on, GLTF proposal).

5. **Unification of tangent space generation.**

   - The revised design is that we move all tangent generation to the ImporterMesh3D for the importers.

6. **Improve the asset import dialog based on proposal GH-7238.**

7. **Finalization of the IES light importer from pull request GH-63835.**
   - Needs work on the equirectangular transform.

## The Benefits

Improving the Godot ecosystem will make it easier for developers to create and export assets, streamline workflows, and ultimately produce better games.

## The Downsides

The main downside is that this will require a significant amount of development time and resources.

## The Road Not Taken

An alternative approach could be to focus on improving Godot's native tools and capabilities, rather than its integration with other software.

## The Infrequent Use Case

This proposal may not benefit developers who do not use Blender or those who prefer to use other game engines.

## In Core and Done by Us

The proposed improvements will be implemented in the core of the Godot engine and will be carried out by our team.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
