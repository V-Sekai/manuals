# Proposed: Enhancing the Many Bone IK Configuration

## Metadata

- Status: proposed
- Deciders: V-Sekai
- Tags: V-Sekai, VR, Game Development

## Context and Problem Statement

We have identified a limitation in the V-Sekai platform where there are too many variables to pose the kusudama constraints on the desktop. We propose to overcome this limitation by introducing a VR mode.

## Proposed Solution

Our solution involves creating a VR mode specifically for posing Many Bone IK kusudama constraints. The steps for implementation are as follows:

1. Take an off the shelf VR controller.
2. Take an off the shelf multiplayer functionality.
3. Develop a tool selection ui. Collaborate with guillefix.
4. Adjust the kusudama constraint attributes to match posing.
5. Save attributes.

### Definition of a Kusudama

Imagine you have a ball. There are two ways you can move it:

1. **Twist**: Like spinning a globe on its stand.
2. **Swing**: Like moving your finger from one spot to another on the ball.

Think of a Kusudama (a type of origami that forms a sphere) as an example for the swing movement. The pieces of paper move just like your finger would on the ball.

## Implementation

1. Investigate Saracen's VR networking prototype.
1. Rebuild character posing without tracking the physical sensors
1. Apply Many Bone IK tracking
1. Rotation swing (10x Vector4)
1. Rotation twist (From and range)
1. Adjust for quality
1. Complete configuration

Assigning physical sensors to IK points is non-goal.

## Option Graveyard

1. **Desktop Mode Enhancement:** Initially, we considered enhancing the desktop mode to handle the kusudama constraints better. However, this option was discarded due to the inherent limitations of the desktop interface for such complex interactions.

2. **Use of External Tools:** Another option was to use external tools or plugins specifically designed for handling Many Bone IK kusudama constraints. This option was rejected because it would require users to learn and manage additional software, which could lead to a fragmented user experience.

3. **Simplified Kusudama Constraints:** We also thought about simplifying the kusudama constraints to make them more manageable on the desktop. But this option was discarded as it would limit the capabilities and flexibility that our platform currently offers.

4. **Automated Posing:** An automated system for posing the kusudama constraints was also considered. However, this option was rejected because it would take away control from the users, potentially leading to less satisfactory results.

5. **Tutorials and Guides:** Providing extensive tutorials and guides to help users navigate the complexity of posing kusudama constraints on the desktop was another option. This was discarded because it doesn't address the core issue - the difficulty of managing these constraints on a desktop interface.

## Negative Consequences

- Increased complexity in game development.
- Potential need for more resources (time, manpower, etc.) for implementation and testing.

## Option graveyard

This section is reserved for options considered but rejected.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

Posing the avatar is the first interaction a user has when entering our virtual world, V-Sekai. This underlines the necessity of investing in this enhancement to ensure a seamless and engaging user experience right from their first interaction with our platform.

## Is there a reason why this should be core and done by us?

Pose quality is crucial to us. As the creators of V-Sekai, we have an unparalleled understanding of our platform's limitations and potential improvements. This insight puts us in a unique position to enhance the pose quality in a way that aligns with our users' needs and expectations. Therefore, it is essential that we undertake this enhancement.

## References

- [V-Sekai](https://v-sekai.org/)
