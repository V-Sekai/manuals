# Proposed: VRC and VRM compatibility

## The Context

VRChat (VRC) and Virtual Reality Model (VRM) are two popular things used in the creation of virtual reality content. However, they are not inherently compatible with each other, which can cause issues for developers trying to use both in their projects.

## The Problem Statement

The lack of compatibility between VRC and VRM can lead to inefficiencies and limitations in the development process. This proposal aims to address this issue by providing a solution that allows for seamless integration of these two groups.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

The proposed solution involves a series of steps outlined in the README below:

1. Add face shapes with hana tool
2. DO NOT remove transparent triangles for [hair, face, body]
3. Unpack the prefab.
4. Convert to vrchat. Combine meshes, remove upper chest
5. Delete skirt bones that are not used.
6. Add vrcfury bounding box fix
7. Add vrcfury direct tree
8. Add vrcfury jerry's templates
9. Change the eyes to move up or down [-2, 2].
10. Make sure the `Body` has the perfect sync blend shapes. Delete closed mouth blend shape.
10. Choose either the MPEG4 blendshapes or Perfect sync. Delete one or the other.
11. Remove empty vrc parameters
12. Remove Physbones with missing transforms from secondary.
13. Convert bone clusters in sphere colliders to capsule colliders to go from VERY POOR to POOR.
14. Continue converting capsules until satisfied "POOR".
15. The FX controller must match the name and not be temporary.
16. Remove all face blend shapes.
17. Use the reader to add face blend shapes (perfect sync)
18. Delete `mouthRollUpper`, `mouthRollLower` and `mouthClose`. 
19. Delete VRM tools.
20. Make sure all pipeline IDs are detached.
21. Remember to delete the upper chest from the humanoid.
22. Eye look is behind the nose
23. Make sure the breast bones are parented as the same bone as the clothing chest bones correspond to.
24. Cross eyed fix in vrcfury breaks eye tracking.
25. Upload. (Pick a new slot. DO NOT REUSE A SLOT.)

### Installed packages

1. vrc sdk base
2. vrc sdk avatar
3. vrcfury
4. vrcft - jerry's templates

### List of my default VRCFury components

1. VRCFury blink controller
2. VRCFury blend shape optimizer
3. VRCFury direct tree optimizer
4. VRCFury fix write defaults
5. VRCFury unlimited parameters
6. VRCFury anchor override fix
7. VRCFury GoGo

## The Benefits

The proposed solution will allow developers to use VRC and VRM together in their projects, leading to increased flexibility and efficiency.

## The Downsides

The process may be complex and time-consuming, especially for those unfamiliar with these formats.

## The Road Not Taken

An alternative approach could involve developing a new format that combines the features of both VRC and VRM. However, this would likely require significant resources and may not be feasible for all developers.

## The Infrequent Use Case

This proposal may not be beneficial for developers who only use one of these formats in their projects.

## In Core and Done by Us

The proposed solution has been developed by us and is integrated into our core system.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [vrc-get gui](https://github.com/vrc-get/vrc-get/releases/tag/gui-v0.1.0-beta.16)
1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine
4. https://vcc.vrcfury.com
5. https://Adjerry91.github.io/VRCFaceTracking-Templates/index.json

AI assistant Aria assisted with this article.
