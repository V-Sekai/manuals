# Proposed: Enhancing Avatar Creation Process in V-Sekai Regular

## Metadata

- Status: proposed
- Deciders: V-Sekai
- Tags: V-Sekai

## Context and Problem Statement

V-Sekai currently has limitations when it comes to creating avatars with specific features and customizations. This can be a hindrance for users who want to have more control over the appearance of their avatars. To address this, we propose an enhancement that introduces various tools and techniques to overcome these limitations and provide a more comprehensive avatar creation process.

## Proposed Solution

Here is a list of raw processes to be broken down.

### Avatar Creation Steps:

To implement the requested changes, here are the modified instructions:

1. **Creating the avatar face:** Utilizes digital drawing techniques to design and create the facial features of the avatar.

   - Input mime type: None
   - Output mime type: Digital drawing/image file (e.g., PNG, SVG)

2. **Changing colors:** Utilizes a digital paintbrush tool like Penpot to modify and customize the colors of the avatar.

   - Input mime type: Digital drawing/image file (e.g., PNG, SVG)
   - Output mime type: Digital drawing/image file (e.g., PNG, SVG)

3. **Selecting the best-looking avatars:** Evaluates and chooses the most visually appealing avatars from a pool of options.

   - Input mime type: Digital drawing/image file (e.g., PNG, SVG)
   - Output mime type: Digital drawing/image file (e.g., PNG, SVG)

4. **Removing the background image:** Removes the background image to make rework easier. May provide worse results with edge details.

   - Input mime type: Digital drawing/image file (e.g., PNG, SVG)
   - Output mime type: Digital drawing/image file (e.g., PNG, SVG)

5. **Adding a body:** Incorporates a body to the avatar using Blender's CC0 base mesh or a similar tool.

   - Input mime type: Digital drawing/image file (e.g., PNG, SVG)
   - Output mime type: Digital drawing/image file (e.g., PNG, SVG)

6. **Creating a 3D model of the back of the avatar:** If feasible, attempts to create a 3D model of the back of the avatar for a more comprehensive representation.

   - Input mime type: Digital drawing/image file (e.g., PNG, SVG)
   - Output mime type: Digital drawing/image file (e.g., PNG, SVG)

7. **Simplifying images:** Uses a tool to simplify and refine the entire avatar image as a whole, removing any unnecessary image details or complexities.

   - Input mime type: Digital drawing/image file (e.g., PNG, SVG)
   - Output mime type: Digital drawing/image file (e.g., PNG, SVG)

8. **Adding clothing and accessories:** Enhances the avatar by adding clothing and accessories using tools like Vroid Hub.

   - Input mime type: Digital drawing/image file (e.g., PNG, SVG)
   - Output mime type: Digital drawing/image file (e.g., PNG, SVG)

9. **Placing the 2D image as a reference:** Positions the 2D reference image in front of the 3D model to serve as a visual guide during customization.

   - Input mime type: Digital drawing/image file (e.g., PNG, SVG), 3D model file (e.g., GLTF)
   - Output mime type: 3D model file (e.g., GLTF), Digital image file (e.g., PNG, SVG)

10. **Capturing and enhancing images:** Captures images from various angles using a camera and enhances them to improve the overall quality.

- Input mime type: Digital drawing/image file (e.g., PNG, SVG)
- Output mime type: Digital image file (e.g., PNG, SVG)

11. **Generating text captions:** Creates descriptive text captions for the captured images to provide additional context or information.

- Input mime type: Digital image file (e.g., PNG, SVG)
- Output mime type: Text file (e.g., TXT)

12. **Using a 2D reference image in Blender:** Uses a 2D reference image within Blender to guide the customization process.

- Input mime type: Digital drawing/image file (e.g., PNG, SVG)
- Output mime type: 3D model file (e.g., GLTF), Digital image file (e.g., PNG, SVG)

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
- [Detail Tweaker](https://civitai.com/models/58390/detail-tweaker-lora-lora)
- [InstructBLIP: Towards General-purpose Vision-Language Models with Instruction Tuning](https://github.com/gfodor/instructblip-replicate)
- [Petals](https://github.com/bigscience-workshop/petals)
