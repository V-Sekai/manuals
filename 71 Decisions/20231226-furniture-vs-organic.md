# Proposal: Hardsurface vs Organic

## Metadata

- **Status:** Proposed
- **Deciders:** V-Sekai, fire, msstabby
- **Tags:** V-Sekai, VR, Godot Engine, 3D Modeling, Performance Optimization

## Context

V-Sekai is a vibrant platform for social VR experiences built on the Godot Engine. Its success hinges on the seamless integration of visually appealing 3D environments and characters that perform optimally across various VR hardware.

## Problem

The challenge lies in striking a balance between hardsurface (static objects) and organic (characters) modeling within V-Sekai. The goal is to optimize both types of models, reducing geometric complexity without compromising on visual richness or functional requirements of rigging and animation.

## Possible Solution

Adopt different strategies for hardsurface and organic modeling. For hardsurface models, focus on reducing the number of triangles, especially for non-moving geometry like furniture. For organic models, ensure even distribution of triangles to meet the unique requirements of rigging and deformation during animation.

## Pros

Such optimization can lead to improved performance, reduced latency, and a more immersive VR experience for users.

## Cons

It may require rethinking and overhauling existing modeling workflows, which could be resource-intensive.

## Alternatives

Ignoring the optimization could result in suboptimal performance, impacting the user experience and the scalability of V-Sekai projects.

## Special Considerations

Rare or unique objects and characters that require a departure from standard optimization practices to maintain their distinctiveness or functionality.

## Implementation

The proposal recommends integrating these optimization practices into the core development workflow of V-Sekai, handled by the internal team.

## References

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine.

_This proposal was assisted by Aria, an AI assistant._
