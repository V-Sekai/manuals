# Proposal: Fit Clothing on Humans Without Tearing

## Metadata

- **Status**: Proposed
- **Deciders**: V-Sekai, Fire, Joe Cat
- **Tags**: V-Sekai

## Context

The challenge is to accurately fit clothing on a 3D human model without causing any tearing in the fabric. The proposed solution involves utilizing machine learning technology that ensures constraints are maintained for vertex faces during the fitting process.

# Strategy

Use the cloth simulation's pinning functionality to attach the base mesh hull to the clothing hulls. This is achieved by implementing an algorithm that selects optimal vertices based on certain criteria such as distance from the texel or texture similarity.

Use machine learning technology to maintain constraints for vertex faces and effectively fit clothing on a 3D model.

**Providing Two Hulls**: One on the base mesh and another on the clothing. The goal here is to first generate the material/clothing and then wrap it onto the character.

The constraint solver used in this process is a cloth simulator that can solve backwards and forwards differentially. This is unique as most physics engines can't solve backwards for a large number of vertices.

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
