# Proposed: DreamCraft3D - A Hierarchical 3D Content Generation Method

## Metadata

- **Status:** Proposed
- **Deciders:** V-Sekai, fire, Joseph Cat
- **Tags:** V-Sekai, VRM, Rigging, 3D Modeling, DreamCraft3D

## Context

DreamCraft3D is a hierarchical 3D content generation method that produces high-fidelity and coherent 3D objects. It uses a 2D reference image to guide the stages of geometry sculpting and texture boosting.

## Problem

The main challenge lies in addressing the consistency issue that existing works encounter. To sculpt geometries that render coherently, DreamCraft3D performs score distillation sampling via a view-dependent diffusion model.

## Solution

The strategy for implementing DreamCraft3D involves several steps:

1. Use DreamCraft3D to generate high-fidelity and coherent 3D objects from 2D concept art.
2. Utilize existing projects like [Mixamo](https://www.mixamo.com/) or [AccuRig](https://actorcore.reallusion.com/auto-rig) for rigging models.
3. If the topology isn't suitable for animation, employ tools such as [Quadwild BIMDF](https://github.com/cgg-bern/quadwild-bimdf) or [Exoside's Quad Remesher](https://exoside.com/quadremesher/) to enhance it.
4. Correct bad rigs using delta mush with the help of the [Corrective Smooth Baker](https://github.com/V-Sekai/V-Sekai.blender-game-tools/tree/main/addons/corrective_smooth_baker) addon for Blender.
5. Develop software to perform clothing simulation differentially, referring to [V-Sekai's Cloth Dynamics](https://github.com/V-Sekai/V-Sekai.cloth-dynamics) as a guide.

## Pros

DreamCraft3D, with its tailored 3D priors throughout the hierarchical generation, can generate coherent 3D objects with photorealistic renderings. This advances the state-of-the-art in 3D content generation.

## Cons

The process of converting 2D concept art into a rigged 3D model can be complex and time-consuming. It also requires expertise in 3D modeling and rigging.

## Alternatives

An alternative approach could have been to manually create and rig the 3D models. However, this would be even more time-consuming and require even more expertise.

## Infrequent Use Case

If the feature is used infrequently, it may not justify the time and resources spent on developing it.

## Ownership

This project aligns with our core expertise in VR technologies and 3D modeling. Therefore, it can be done by us.

## References

For further reading, please refer to:

- [V-Sekai GitHub Repository](https://github.com/v-sekai/)
- [DreamCraft3D Code](https://github.com/deepseek-ai/DreamCraft3D)
- AI assists this article.
