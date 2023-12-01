# Proposed: Seamless Integration of XR Tracking in Godot Engine

## Metadata

- **Status**: Proposed
- **Deciders**: V-Sekai Project Maintainers
- **Tags**: XR, Hand Tracking, Full Body Tracking, OpenXR, Godot Engine, Animation Retargeting

## The Backdrop

The document outlines the need for supporting hand and full body tracking in extended reality (XR) applications. As virtual and augmented reality technologies improve, developers seek methods to integrate external skeleton data, such as OpenXR hand tracking or "full body tracking" skeletons, with existing imported and skinned meshes within the Godot Engine.

## The Challenge

OpenXR currently provides a bone structure model for hand tracking data, which the Godot Engine incorporates through an `OpenXRHand` helper node. This implementation transforms global position and orientation data into local space. However, this approach is restrictive due to the requirement that mesh structures strictly adhere to the OpenXR standard, causing compatibility issues. Moreover, there's an impending need to support solutions in anticipation of vendor APIs offering "full body tracking" skeletons.

## The Strategy

To address these limitations, we propose the introduction of an `OpenXRSkeleton3D` node, which would feature:

- A canonical hand skeleton conforming to the OpenXR standard for consistency.
- Hardcoded rest poses based on open hands recorded using OpenXR to simplify development.
- Functionality to apply tracked OpenXR data dynamically to generate pose animations.

This approach enables various advanced retargeting scenarios, such as applying partial tracking data to hand meshes, integrating with humanoid skeletons, and blending tracked poses with static ones for specific interactions like object manipulation.

### Unique Use Cases Catered To

#### Augmented Reality (AR)

For AR, the ability to deform mesh to match the player's actual hands and fingers can enhance realism significantly.

#### Virtual Reality (VR)

VR enables the representation of fixed-size avatar hands that do not vary with the player's actual hand size, much like the hands seen in games like "Half-Life Alyx."

## Compatibility with Other Systems

Provisions would be made for interoperability with other systems and standards, such as:

- **Apple's Vision Pro**: Implementing an `AppleSkeleton3D` node to accommodate format and skeleton definitions differences.
- **WebXR**: Potentially aligning with the OpenXR system.
- **Godot Engine**: Including additional metacarpal bones in the engine's humanoid skeleton for accurate retargeting.
  a# Proposed: Enhanced XR Tracking in Godot Engine with OpenXRSkeleton3D Node

## Metadata

- **Status**: Proposed
- **Deciders**: V-Sekai Project Maintainers
- **Tags**: XR, Hand Tracking, Full Body Tracking, OpenXR, Godot Engine, Animation Retargeting

## The Backdrop

This proposal introduces the need for enhanced hand and full body tracking in extended reality (XR) applications within the Godot Engine. As virtual and augmented reality technologies advance, developers are seeking methods to integrate external skeleton data, such as OpenXR hand tracking or "full body tracking" skeletons, with existing imported and skinned meshes.

## The Challenge

The current implementation of OpenXR provides a bone structure model for hand tracking data, which is incorporated into the Godot Engine through an `OpenXRHand` helper node. This node transforms global position and orientation data into local space. However, this approach has compatibility issues due to the requirement that mesh structures strictly adhere to the OpenXR standard. Additionally, there's a growing need to support solutions for vendor APIs offering "full body tracking" skeletons.

## The Strategy

To address these limitations, we propose the introduction of an `OpenXRSkeleton3D` node. This new node will:

- Conform to the OpenXR standard for consistency.
- Include hardcoded rest poses based on open hands recorded using OpenXR to simplify development.
- Apply tracked OpenXR data dynamically to generate pose animations.

This strategy enables advanced retargeting scenarios and improves the integration of partial tracking data to hand meshes, humanoid skeletons, and blending of tracked poses with static ones for specific interactions like object manipulation.

### Unique Use Cases Catered To

#### Augmented Reality (AR)

In AR, deforming the mesh to match the player's actual hands and fingers can significantly enhance realism.

#### Virtual Reality (VR)

In VR, this strategy enables the representation of fixed-size avatar hands that do not vary with the player's real hand size, similar to games like "Half-Life Alyx."

## Compatibility with Other Systems

The proposed solution will improve interoperability with other systems and standards, such as:

- **Apple's Vision Pro**: By implementing an `AppleSkeleton3D` node to accommodate format and skeleton definitions differences.
- **WebXR**: Potentially aligning with the OpenXR system.
- **Godot Engine**: Including additional metacarpal bones in the engine's humanoid skeleton for accurate retargeting.

## Non-XR Use Cases Showcasing Broader Utility

The system could also be beneficial for non-XR applications such as:

- Adjusting leg movement to avoid ground collision.
- Supporting procedural foot-planting techniques for realistic animation.
- Tracking arms for dynamic motion capture.
- Allowing inverse kinematics setups similar to classic shooters like Doom (2016).
- Providing active ragdolls for lifelike physics responses, exemplified in [Godot Engine Active Ragdolls](https://www.youtube.com/watch?v=0MHY2TDeMLM).

## Core Components

1. **XR-Specific Node**: This component extracts and refines hand-tracking data into a specialized `Skeleton3D` node.
2. **Animation BlendTree Node**: This node handles the complex task of retargeting data across different skeletons, enabling a mix-and-match approach to animation and physical interactions.

## Application Scenarios

A typical use case may involve two hand skeletons from different tracking sources being retargeted onto a third skeleton dedicated to visual representation within the Godot Engine environment or for physics-based interactions.

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine.

_AI assistant Aria assisted with this article._

## Non-XR Use Cases Showcasing Broader Utility

The system could also be beneficial for non-XR applications such as:

- Adjust leg movement, avoiding a ground collision.
- Support procedural foot-planting techniques for realistic animation.
- Track arms for dynamic motion capture.
- Allow Inverse kinematics setups similar to classic shooters like Doom (2016).
- Active ragdolls provide lifelike physics responses, exemplified in [Godot Engine Active Ragdolls](https://www.youtube.com/watch?v=0MHY2TDeMLM).

## Core Components

1. **XR-Specific Node**: Extracts and refines hand-tracking data into a specialized `Skeleton3D` node.
2. **Animation BlendTree Node**: Handles the complex task of retargeting data across different skeletons, enabling a mix-and-match approach to animation and physical interactions.

## Application Scenarios

A typical use case may involve two hand skeletons from different tracking sources being retargeted onto a third skeleton dedicated to visual representation within the Godot Engine environment or for physics-based interactions.

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine.

_AI assistant Aria assisted with this article._
