# Proposal: Fit Clothing on Humans Without Tearing

## Metadata

- **Status**: Proposed
- **Deciders**: V-Sekai, Fire, Joe Cat
- **Tags**: V-Sekai

## Context

The challenge is to accurately fit clothing on a 3D human model without causing any tearing in the fabric. The proposed solution involves utilizing machine learning technology that ensures constraints are maintained for vertex faces during the fitting process.

## Strategy

The cloth simulation's user interface allows for the pinning of vertex positions. This functionality should enable the corresponding base mesh hull to be pinned to clothing hulls. The strategy revolves around finding a method to establish correspondence between these two elements.

Instead of selecting random vertices that are near the same texel, akin to a shrink wrap operator, consider implementing an algorithm that selects the most optimal vertices based on certain criteria such as distance from the texel or similarity in texture. This approach could provide a more accurate and consistent fit for the clothing on the 3D model.

### Technical Discussion

The discussion primarily focuses on the use of machine learning technology to maintain constraints for vertex faces and effectively fit clothing on a 3D model. The author suggests the use of colliders, but this introduces a complex problem. An alternative method discussed involves providing two hulls, one on the base mesh and another on the clothing. The objective here is to first generate the material/clothing and then wrap it onto the character.

The constraint solver employed in this process is a reasonably fast cloth simulator. It solves backwards and forwards differentially, which is unique as most physics engines can't solve backwards for a large number of vertices.

While the topology may not be perfect, one suggestion is to project clothing material onto a subdivided quad and then employ the seam sewing method. However, this would limit the style of clothing.

Another idea is to use UV'd texels for the seam sewing method if you're okay with simulating for a while. The artist provides a base mesh with a single hull and a clothing mesh with two hulls, one on the base mesh and the second on the clothing on the base mesh.

## Identified Problems and Proposed Solutions

1. **Problem**: The use of colliders introduces complexity.
   **Solution**: Instead of using colliders, consider using a more straightforward approach such as a bounding volume hierarchy (BVH) for collision detection. This can simplify the process and reduce computational overhead.

2. **Problem**: The proposed method may limit the style of clothing.
   **Solution**: To overcome this limitation, consider implementing a more flexible system that allows for different types of clothing styles. This could involve creating a library of pre-defined clothing styles that can be fitted onto the 3D model.

## Pros and Cons

To be determined.

## Alternatives

To be determined.

## Rare Use Cases

To be determined.

## Core Functionality?

To be determined.

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine

_This article was assisted by Aria, an AI assistant._
