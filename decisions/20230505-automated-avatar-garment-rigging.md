# Automated avatar garment rigging

## Metadata

- Status: proposed
- Deciders: V-Sekai,
- Tags: V-Sekai, chatgpt4, automated rigging, avatar customization, garment application, 3d modelling, Blender addons,

## Context and Problem Statement

It is not feasible to rig every possible avatar when a new garment is created.

It is not feasible to rig every possible garment when a new avatar is created.

It is not possible to do rigging when the garment and avatar are separated by time and space.

We want to change the portable avatar garment problem so that one garment does not need to be rigged to all other avatars and vice versa.

## Describe the problem or limitation you have in your project, e.g., in free form, using two to three sentences. Consider articulating the case in the form of a question.

How can we create a system that allows garments to be easily applied to various avatars without the need for manual rigging each time a new garment or avatar is created?

## Describe the proposed option and how it helps to overcome the problem or limitation

Implement an automated rigging and wrapping system that uses known base meshes and garments, allowing for easy application of garments to avatars without the need for manual rigging.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

1. Create a 3D model representing the basic shape and structure of an avatar without any clothing or accessories.
2. Create a 3D model of a piece of clothing or accessory that will be applied to the avatar.
3. Rig the avatar and garment models by creating a skeleton structure that defines how they move and deform. Use the Blender Dem Bones add-on to automate the rigging process.
4. Generate a simplified "cage" mesh around the avatar base mesh using the Simplicage add-on. This cage will be used to help apply the garment to the avatar.
5. Attach the garment model to the cage created in the previous step, so that it follows the cage's movement and deformation.
6. Utilize the Mesh Materializer add-on to conform the garment model to the avatar base mesh, using a UV texture map to guide the wrapping process. This ensures the garment fits correctly on the avatar.
7. Develop a system to manage multiple layers of clothing or accessories on the avatar. For example, underwear can be wrapped around the base mesh, and pants can be wrapped around the underwear, allowing for proper layering and interaction between clothing items.

## Positive Consequences

- Reduces manual rigging efforts for each garment and avatar combination.
- Streamlines the process of applying garments to avatars.
- Allows for easier customization and creation of new avatars with various garments.

## Negative Consequences

- May require additional development time to implement the automated system.
- Potential compatibility issues with existing assets or workflows.

## Option graveyard

* It is not feasible to only use creators because of the inefficiency. Creators need tools.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement requires a more complex solution involving multiple tools and processes.

## Is there a reason why this should be core and done by us?

Yes, implementing this feature as part of the core functionality will greatly improve the user experience and streamline the process of creating and customizing avatars with different garments.

## References

- [V-Sekai](https://v-sekai.org/)
- [Blender Dem Bones](https://blendermarket.com/products/blender-dembones)
- [Simplicage](https://blendermarket.com/products/simplicage)
- [Mesh Materializer](https://blendermarket.com/products/mesh-materializer)
