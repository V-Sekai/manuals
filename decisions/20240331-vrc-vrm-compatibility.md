# Proposed: VRC and VRM compatibility

## The Context

VRChat (VRC) and Virtual Reality Model (VRM) are two popular things used in the creation of virtual reality content. However, they are not inherently compatible with each other, which can cause issues for developers trying to use both in their projects.

## The Problem Statement

The lack of compatibility between VRC and VRM can lead to inefficiencies and limitations in the development process. This proposal aims to address this issue by providing a solution that allows for seamless integration of these two groups.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

The proposed solution involves a series of steps outlined in the README below:

1. DO NOT remove transparent triangles for [hair, face, body]
2. Make sure the `Body` has all blend shapes deleted.
3. Add face shapes with hana tool
4. Split the skin from the clothing using separate by material.
5. On all the clothing delete vertex groups.
6. Use Robust Weight Transfer for Blender to rig clothing
7. Unpack the prefab.
8. Convert to vrchat. Combine meshes, remove upper chest
9. Delete skirt bones that are not used.
10. Add vrcfury direct tree
11. Add vrcfury fix write defaults
12. Add vrcfury anchor override fix
13. Add vrcfury jerry's templates
14. Add vrcfury unlimited parameters
15. Make sure the `Body` has the perfect sync blend shapes.
16. Remember that VRM Mouth Joy is similar to jawOpen.
17. Remember that brown down and eye blink can be buggy.
18. Choose either the MPEG4 blendshapes or Perfect sync. Delete one or the other.
19. Remove empty vrc parameters
20. Remove Physbones with missing transforms from secondary.
21. Convert bone clusters in sphere colliders to capsule colliders to go from VERY POOR to POOR.
22. Continue converting capsules until satisfied "POOR".
23. The FX controller must match the name and not be temporary.
24. Use Auto VRMColliders.
25. Make sure all pipeline IDs are detached.
26. Remember to delete the upper chest from the humanoid.
27. Eye look is behind the nose bridge
28. Make sure the breast bones are parented as the same bone as the clothing chest bones correspond to.
29. Cross eyed fix in vrcfury breaks eye tracking.
30. Upload. (Pick a new slot. DO NOT REUSE A SLOT.)

### Installed packages

1. vrc sdk base
2. vrc sdk avatar
3. vrcfury
4. vrcft - jerry's templates

### Overly bright

1. in liltoon turn saturation to 2.

### Seams when moving

1. Try in blender to merge by distance

### Weight Transfer matching

1. 0.0125 m for distance
2. 15 degrees for angle match

### How to prioritize spring bone removal

1. Core movement
2. Ears :3

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
1. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine
1. [https://vcc.vrcfury.com]
1. [https://Adjerry91.github.io/VRCFaceTracking-Templates/index.json]
1. [https://esperecyan.github.io/VRMConverterForVRChat/registry.json]
1. [https://vpm.nadena.dev/vpm.json]
1. [https://lilxyzw.github.io/vpm-repos/vpm.json]
1. [https://fujisunflower.booth.pm/items/2087178]
1. [VRM Downgrader](https://vrm-downgrader.pages.dev/)
1. [GoGo Loco](https://franadavrc.gumroad.com/l/gogoloco)

AI assistant Aria assisted with this article.
