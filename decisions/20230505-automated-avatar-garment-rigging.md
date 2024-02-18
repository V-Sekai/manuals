# Proposed: Automated avatar garment rigging

## Metadata

- Status: proposed
- Deciders: V-Sekai,
- Tags: V-Sekai, chatgpt4, automated rigging, avatar customization, garment application, 3d modelling, Blender addons,

## Context and Problem Statement

Rigging every possible avatar and garment combination is not feasible. We need a system that allows garments to be easily applied to various avatars without manual rigging each time a new garment or avatar is created.

## Describe the problem or limitation you have in your project, e.g., in free form, using two to three sentences. Consider articulating the case in the form of a question.

How can we create a system that allows garments to be easily applied to various avatars without the need for manual rigging each time a new garment or avatar is created?

## Describe the proposed option and how it helps to overcome the problem or limitation

Implement an automated rigging and wrapping system using known base meshes and garments for easy application of garments to avatars without manual rigging.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

1. **Create avatar and garment models**: Create a 3D model representing the basic shape and structure of an avatar without any clothing or accessories, and a 3D model of a piece of clothing or accessory.
2. **Rig models**: Rig the avatar and garment models by creating a skeleton structure that defines how they move and deform. Use the Blender Dem Bones add-on to automate the rigging process.
3. **Generate cage mesh**: Generate a simplified "cage" mesh around the avatar base mesh using the Simplicage add-on. This cage will be used to help apply the garment to the avatar.
4. **Attach garment to cage**: Attach the garment model to the cage created in the previous step, so that it follows the cage's movement and deformation.
5. **Conform garment to avatar**: Utilize the Mesh Materializer add-on to conform the garment model to the avatar base mesh, using a UV texture map to guide the wrapping process. This ensures the garment fits correctly on the avatar.
6. **Manage multiple layers**: Develop a system to manage multiple layers of clothing or accessories on the avatar, allowing for proper layering and interaction between clothing items.

## Positive Consequences

- Reduced manual rigging efforts for each garment and avatar combination
- Streamlined process of applying garments to avatars
- Easier customization and creation of new avatars with various garments

## Negative Consequences

- Additional development time required to implement the automated system
- Potential compatibility issues with existing assets or workflows
- Dependent on third party addons
  - Research and evaluate alternative solutions or develop custom tools to replace or supplement the functionality provided by these third-party add-ons. This will help ensure long-term stability and maintainability of the project.
- Performance concerns with complex avatars and garments
  - Optimize the algorithms used in the automated rigging and wrapping process to handle complex models efficiently. Additionally, consider implementing a level of detail (LOD) system to reduce the complexity of models during runtime without compromising visual quality.
- Difficulty in handling edge cases.
  - Develop a set of guidelines for creating avatar and garment models that work well with the automated system. Additionally, provide manual intervention options for users to fine-tune the rigging and wrapping results in case of edge cases.

## Option graveyard

- Relying solely on creators is inefficient; they need tools.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement requires a more complex solution involving multiple tools and processes.

## Is there a reason why this should be core and done by us?

This enhancement requires a complex solution involving multiple tools and processes, and cannot be worked around with a few lines of script. Implementing this feature as part of the core functionality will greatly improve the user experience and streamline the process of creating and customizing avatars with different garments.

## References

- [V-Sekai](https://v-sekai.org/)
- [Blender Dem Bones](https://blendermarket.com/products/blender-dembones)
- [Simplicage](https://blendermarket.com/products/simplicage)
- [Mesh Materializer](https://blendermarket.com/products/mesh-materializer)
