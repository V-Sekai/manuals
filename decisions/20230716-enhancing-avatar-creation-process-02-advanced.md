# Proposed: Enhancing Avatar Creation Process in V-Sekai Advanced

## Metadata

- Status: proposed 
- Deciders: V-Sekai
- Tags: V-Sekai

## Context and Problem Statement

V-Sekai currently has limitations when it comes to creating avatars with specific features and customizations. This can be a hindrance for users who want to have more control over the appearance of their avatars. To address this, we propose an enhancement that introduces various tools and techniques to overcome these limitations and provide a more comprehensive avatar creation process.

## Proposed Solution

Here is a list of raw processes to be broken down.

### To create a source, filter, sink pipeline system for this project, we can use the following mime labels:

1. Source: The source will provide the initial avatar model and any additional assets required. The input mime type for the source could be `application/gltf+json` or `model/gltf+json` if the avatar is in GLTF format, or `image/png` or `image/svg+xml` if the avatar is provided as a 2D image.

2. Filter: The filter will handle all the customization steps mentioned above. It will take the input from the source and apply the necessary modifications to create the desired avatar. The input mime type for the filter would be the same as the output mime type of the source, depending on whether the avatar is in GLTF format or represented as an image.

3. Sink: The sink will receive the customized avatar from the filter and store it as the final output. For this project, the sink should support both PNG and SVG images for 2D avatars, and GLTF for 3D avatars. Therefore, the output mime types for the sink would be `image/png` or `image/svg+xml` for 2D avatars, and `application/gltf+json` or `model/gltf+json` for 3D avatars.

Note: To avoid lossy formats, we are using PNG or SVG for 2D images and GLTF for 3D formats. PNG and SVG are lossless image formats, while GLTF is a lossless 3D format that preserves the fidelity of the avatar model.

### Advanced Customization Steps:

Here are the converted inputs and outputs in the xstate format for each step:

1. **Importing the avatar into Godot Engine and "Project Mirage":**
   - Input: `.vrm` file
   - Output: `.vrm` file

2. **Refining the imported avatar:**
   - Input: `.vrm` file
   - Output: `.vrm` file

3. **Converting spring bone to physical simulation bones and colliders:**
   - Input: `.vrm` file
   - Output: assetpackage file

4. **Addressing painting errors:**
   - Input: `.vrm` file
   - Output: `.vrm` file

5. **Choosing a material:**
   - Input: `.vrm` file
   - Output: `.vrm` file

6. **Resolving issues with materials and bones:**
   - Input: `.vrm` file
   - Output: `.vrm` file

7. **Correcting colors and addressing pleated folds:**
   - Input: `.vrm` file
   - Output: `.vrm` file

8. **Creating complex geometric structures:**
   - Input: `.vrm` file
   - Output: `.vrm` file

10. **Utilizing Vroid Hub's hair painter and mesh generator:**
   - Input: `.vrm` file
   - Output: `.vrm` enhanced data

11. **Adding facial expressions for motion capture:**
   - Input: `.vrm` file
   - Output: `.gltf` motion capture data

12. **Setting up motion capture:**
   - Input: `.vrm` file
   - Output: vrm animations data stored as `.gltf`.

## Positive Consequences

- Users will be able to create highly customizable avatars with specific features.
- The avatar creation process will be enhanced with a variety of tools and techniques.
- Detailed customization of colors, clothing, accessories, and facial expressions will be possible.
- Motion capture capabilities can be integrated for more realistic animations.

## Negative Consequences

- The implementation process is complex and may require advanced technical skills from users.
- Some steps, like creating a 3D model of the back of the avatar, may not always be successful.
- Painting errors and other imperfections may remain in the final avatar.

## Option graveyard

- Excessive complexity or technical requirements: We want the avatar creation process to be user-friendly and accessible to a wide range of users, so any options that require advanced technical skills or have excessively complex customization controls will not be included.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, the proposed enhancement involves a multi-step process that cannot be easily replicated with just a few lines of script.

## Is there a reason why this should be core and done by us?

The proposed enhancement addresses the limitations in V-Sekai's avatar creation process, providing users with a comprehensive solution for creating highly customizable avatars. By implementing these tools and techniques within the platform, V-Sekai can offer a more robust and user-friendly experience for its community.

## References

- [V-Sekai](https://v-sekai.org/)
