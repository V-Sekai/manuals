# Enhancing Avatar Creation Process in V-Sekai

## Metadata

- Status: proposed 
- Deciders: V-Sekai
- Tags: V-Sekai

## Context and Problem Statement

V-Sekai currently has limitations when it comes to creating avatars with specific features and customizations. This can be a hindrance for users who want to have more control over the appearance of their avatars. To address this, we propose an enhancement that introduces various tools and techniques to overcome these limitations and provide a more comprehensive avatar creation process.

## Proposed Solution

Here is a list of raw processes to be broken down.

### Avatar Creation Steps:

1. **Creating the avatar face:** Use digital drawing techniques to design and create the facial features of the avatar. 

2. **Changing colors:** Utilize a digital paintbrush tool like Penpot to modify and customize the colors of the avatar.

3. **Selecting the best-looking avatars:** Evaluate and choose the most visually appealing avatars from a pool of options.

3. **Removing the background Image:** Remove the background image to make rework easier. May provide worse results with edge details.

4. **Adding a body:** Incorporate a body to the avatar using Blender's CC0 base mesh or a similar tool.

5. **Creating a 3D model of the back of the avatar:** If feasible, attempt to create a 3D model of the back of the avatar for a more comprehensive representation.

6. **Simplifying images:** Use a tool to simplify and refine the entire avatar image as a whole, removing any unnecessary image details or complexities.

7. **Adding clothing and accessories:** Enhance the avatar by adding clothing and accessories using tools like Vroid Hub.

8. **Using a 2D reference image in Blender:** Use a 2D reference image within Blender to guide the customization process.

9. **Placing the 2D image as a reference:** Position the 2D reference image in front of the 3D model to serve as a visual guide during customization.

10. **Capturing and enhancing images:** Capture images from various angles using a camera and enhance them to improve the overall quality.

11. **Generating text captions:** Create descriptive text captions for the captured images to provide additional context or information.

### Advanced Customization Steps:

1. **Correcting colors and addressing pleated folds:** Address any color correction issues in the clothing and ignore pleated folds initially, if present.

2. **Creating complex structures:** Utilize sculpting and rigging techniques to create intricate and detailed structures.

3. **Importing the avatar into Godot Engine and "Project Mirage":** Import the customized avatar into the Godot Engine and the "Project Mirage" framework for further development.

4. **Refining the imported avatar:** Fine-tune and refine the avatar within "Project Mirage" to ensure optimal appearance and functionality.

5. **Converting spring bone to physical simulation bones and colliders:** Convert spring bone "jiggle bones" to physics bones and colliders for enhanced realism and interaction.

6. **Addressing painting errors:** Resolve any painting errors such as mesh clipping or seams on clothing to improve the overall visual quality.

7. **Choosing a material:** Decide whether to use the existing VRM MToon material or implement a custom SCSS shader in "Project Mirage".

8. **Resolving issues with materials and bones:** Rectify any issues related to material counts and bone structure in "Project Mirage".

9. **Establishing file transfer process:** Set up a seamless file transfer process between "Project Mirage" and the Godot Engine for efficient collaboration and asset management.

10. **Utilizing Vroid Hub's hair painter and mesh generator:** Utilize Vroid Hub's hair painting tools and mesh generation capabilities to customize and enhance the avatar's hairstyle.

11. **Adding facial expressions for motion capture:** Implement "perfect sync" facial expressions for capturing realistic facial movements through motion capture technology.

12. **Setting up motion capture:** Configure motion capture using the Steam VR Lighthouse system or a similar setup to capture and translate physical movements onto the avatar.

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
