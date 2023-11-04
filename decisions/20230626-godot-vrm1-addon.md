# Proposed: Ship Godot Engine VRM1 to solve portable humanoid avatars

## Metadata

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai, fire, lyuma
- Tags: V-Sekai, ai copilot

## Context and Problem Statement

Have portable humanoid avatars.

## Proposed Solution

Ship Godot Engine VRM1 to Godot Engine asset Library.

## Implementation

1. Implement basic humanoid avatar functionality such as rigging, animation, and basic physics through VRM1 spring bones.
2. Implement support for both MToon1 and MToon0 materials, which provide a physically-based rendering approach for anime-style graphics.
3. Implement support for the glTF PBR material type, which provides a more physically-based rendering approach for realistic graphics.
4. Implement facial expressions, eye tracking, and lip syncing for a more immersive experience.
5. Implement export by copying the import code in reverse, and refine it over time.
6. Use the VRM spec's suggested algorithm for implementing first-person view, which eliminates the need for head scaling.
7. Prioritize necessary features and say no to suggestions that are not necessary to avoid feature bloat.
8. Do not implement AnimationTree for this proposal.

## Positive Consequences

- Portable humanoid avatars can be easily created and used in Godot Engine projects.
- The addition of MToon1 material support provides a physically-based rendering approach for anime-style graphics.
- Facial expressions, eye tracking, and lip syncing enhance the immersive experience for users.
- Export functionality allows for easy sharing of avatars between projects and with other users.
- The use of the VRM spec's suggested algorithm for implementing first-person view simplifies the implementation process.

## Negative Consequences

- The implementation of these features may require additional development time and resources.
- The addition of new features may increase the complexity of the codebase and require additional maintenance.
- The use of the MToon1 material may require additional GPU resources and may not be suitable for low-end hardware.
- The implementation of facial expressions, eye tracking, and lip syncing may require additional hardware or software support.

## Option graveyard

We are not implementing support for other material types beyond MToon0, MToon1 and gltf PBR, which could limit the range of visual styles that can be achieved with Godot Engine.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

It is unlikely that these enhancements can be easily worked around with a few lines of script, as they require significant development effort and integration with the Godot Engine codebase.

## Is there a reason why this should be core and done by us?

- Portable humanoid avatars are a key feature for many Godot Engine projects, and the ability to easily create and use them is important for the success of the engine.
- The addition of MToon1 material support and other enhancements will improve the quality and visual fidelity of Godot Engine projects.
- By implementing these features in-house, we can ensure that they are well-integrated with the Godot Engine codebase and meet our quality standards.

## References

- [V-Sekai](https://v-sekai.org/)
- https://github.com/vrm-c/vrm-specification
- https://github.com/vrm-c/vrm-specification/blob/master/specification/VRMC_vrm-1.0/firstPerson.md#meshannotationauto-algorithm
