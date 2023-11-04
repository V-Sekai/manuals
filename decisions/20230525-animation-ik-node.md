# Proposed: Convert IK solvers to be using the AnimationTree

## Metadata

- Status: proposed
- Deciders: V-Sekai, fire,
- Tags: V-Sekai, GPT-4

## Project

As part of the V-Sekai project we're working on virtual worlds and avatars usable for all.

## Context and Problem Statement

There is no robust, and production quality inverse kinematic solver for full body tracking virtual reality tracking and other inverse kinematic uses like foot planting and hand grabbing.

In addition to the limitations of the current IK system due to its implementation as a SkeletonIK3D node, the IK system can be improved by reimplementing it as an animation node. This can address these limitations and improve the overall functionality.

## Proposed Solution

1. Reimplement the IK system as an animation node to gain better control over the processing order, ensure accurate pose states.
2. Reuse the track filtering code that exists in the AnimationTree system to enhance the new IK system's capabilities.

## Implementation

In order to improve the Inverse Kinematics (IK) system, we will replace SkeletonIK3D with a new custom AnimationNode called `IKAnimationNode`. This new node will ensure accurate pose states and provide precise control over the IK system.

To enhance the blending between animations and handle IK more efficiently, we will reuse track filtering code from the existing AnimationTree. This will allow for smoother transitions and better performance.

Next, we will implement the IK solver within the new `IKAnimationNode`. This solver will be responsible for calculating target positions and rotations for each bone in the skeleton.

After implementing the IK solver, we will update the AnimationTree to use the new `IKAnimationNode`. This will involve adding an empty track, reading from the transform's position, and blending between different animations to create seamless motion.

As we develop this new IK system, it is crucial to address potential issues such as filter usability, duplicate subtrees versus multiple outputs, and designing a reasonable full body setup. This includes handling jumping and foot IK interactions with the ground.

Finally, we will test and optimize the new IK system to ensure correct functionality and optimal performance. This will result in a more robust and efficient IK solution for our animation needs.

## Positive Consequences

- Improved control over the processing order of the IK system.
- Accurate pose states for better animation quality.
- Potential performance improvements by executing the animation tree outside of the main thread.
- Enhanced capabilities of the new IK system by reusing the track filtering code.

## Negative Consequences

- Increased complexity in the animation system.
- Possible compatibility issues with existing projects.

## Option graveyard

1. Keeping the current SkeletonIK3D node and trying to improve its functionality.
2. Implementing a custom IK solver without reusing the track filtering code from the AnimationTree system.
3. Using third-party IK solvers instead of developing an in-house solution.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, the enhancement involves a significant change in the IK system's implementation and cannot be easily worked around with a script.

## Is there a reason why this should be core and done by us?

Yes, addressing the limitations of the current IK system is crucial for improving V-Sekai's functionality and providing a better experience for users.

## References

- [V-Sekai](https://v-sekai.org/)
- ManyBoneIK3D (mentioned for reference purposes only)