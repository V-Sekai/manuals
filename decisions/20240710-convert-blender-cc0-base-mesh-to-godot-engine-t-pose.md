# Proposed: Convert Blender CC0 Base Mesh to Godot Engine T-Pose

## The Context

We would like to have several base meshes for testing and for skeleton merge clothing tests.

## The Problem Statement

The current process of converting Blender CC0 base meshes to a format compatible with the Godot Engine is cumbersome and lacks a standardized approach. This proposal aims to streamline the conversion process, ensuring consistency and efficiency.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

1. **Install Blender 4.1.1**
2. **Download "Human Base Meshes bundle by Blender Studio CC0 Licensed"**
3. **Test Auto Rig Pro version 3.70.38**
4. **Pick a category**:

   - A. Stylized
   - B. Realistic
   - C. Stylized Parts
   - D. Realistic Parts

   We're picking realistic.

5. **Pick feminine or masculine**: We're picking feminine.
6. **Select all the meshes**
7. **Use Auto-Rig Pro Smart**: "Get Selected Objects"
8. **Add armature**: Human
   - Set biped
   - Add additional: Twist
9. **Click on the body parts**:
   1. Neck (This is the base of the neck)
   2. Chin (This is the tip of the chin)
   3. Shoulder (It's in between the arm.)
   4. Spine root (Crotch area.)
   5. Ankles (Above the foot.)
10. **Set skeleton type to "UE5 Manny-Quinn"**
11. **Add facial**
12. **Remember to set eyes (required)**
13. **Set pelvis up to be enabled**
14. **Click on the facial areas**:
    1. Eyebrows
    2. Eyes
    3. Mouth
15. **Set character name** (it's an option in misc tab) to `body_feminine_realistic`
16. **Click match to rig**
17. **Select all meshes, and the rig. Then go to the Skin tab**
18. **Select scale fix**
19. **Do not enable preserve volume**
20. **Then hit bind** (Ensure the engine is heat map, voxel skinning gives poor results around the shoulder blades on base meshes.)
21. **Go to Rig**
22. **Do not set pose to T-Pose**. It is not reversible.
23. **Set the pose to "UE5 Manny-Quinn"**
24. **TODO: Create a new animation action and name it "A-POSE"**
28. **Configure FBX exporter**:
    1. Unity humanoid
    2. Click fix rig (again)
    3. Select advanced
    4. Full facial
    5. Export root bone `c_traj`
    6. Set root motion
29. **Ensure that the multi-mesh `GEO-body_female_realistic` is set to render disabled**
30. **Export as GLB**
31. **Open GLB in Godot Engine**
32. **TODO: Instructions on the bone map**
33. **TODO: Instructions on silhouette fixer**:
    1. Disable list:
       1. LeftFoot
       2. RightFoot
       3. Neck
       4. Head
       5. UpperChest

## The Benefits

- **Improved Efficiency**: Streamlining the conversion process saves time and reduces manual effort.
- **Consistency**: Standardizing the approach ensures uniformity across different base meshes.
- **Enhanced Compatibility**: Ensures that the converted meshes are fully compatible with the Godot Engine.

## The Downsides

- **Initial Learning Curve**: Team members may need time to familiarize themselves with the new process.
- **Tool Dependency**: Reliance on specific tools like Auto Rig Pro may limit flexibility.

## The Road Not Taken

Alternative approaches such as manual rigging or using different software were considered but ultimately deemed less efficient or effective.

## The Infrequent Use Case

In rare cases where highly specialized or technical requirements arise, additional human oversight may be necessary to ensure accuracy and appropriateness.

## In Core and Done by Us

This proposal aligns with our core values of efficiency and professionalism and will be implemented by our team.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [Human Base Meshes bundle by Blender Studio CC0 Licensed](https://www.blender.org/wp-content/uploads/2023/11/human_base_meshes_bundle_v1.1.jpg) - Human Base Meshes bundle by Blender Studio includes 17 separate meshes, including complete male and female figures, plus individual body parts like feet, hands, heads, jaws, and eyeballs.
4. [Auto Rig Pro](https://blendermarket.com/products/auto-rig-pro)

AI assistant Aria assisted with this article.
