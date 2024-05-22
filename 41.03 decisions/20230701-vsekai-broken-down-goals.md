# Proposed: V-Sekai Feature Enhancement Proposal

## Metadata

- **Status**: Proposed
- **Deciders**: V-Sekai
- **Tags**: V-Sekai, ai summarized

## Context and Problem Statement

We are developing a virtual reality platform, V-Sekai. To ensure the platform meets user needs and expectations, we have identified several features that need to be implemented. These features have been categorized based on their priority and necessity for the initial release.

## Proposed Solution

The features have been organized into three categories: Must-Have, Nice-to-Have, and Out of Scope Initially. The priority within each category reflects the relative importance of the features for an initial release.

### Must-Have Features

| Priority | Feature                                                            | Dependencies |
| :------: | :----------------------------------------------------------------- | :----------- |
|    1     | Environment (scene loading, world hosting, instancing)             | None         |
|    2     | Web requests to servers (HTTP/WebSocket API)                       | Environment  |
|    3     | Person to person interaction (avatars, animation, synchronization) | Environment  |
|    4     | Interaction with the world (interactive elements, physics)         | Environment  |

### Nice-to-Have Features

| Priority | Feature                                                           | Dependencies                                   |
| :------: | :---------------------------------------------------------------- | :--------------------------------------------- |
|    5     | Collaboration features (doodling, modeling, content loading)      | Environment, Person to person interaction      |
|    6     | Static content creation in editor (import avatars, create worlds) | Environment                                    |
|    7     | Shareable content (inventory)                                     | Environment, Static content creation in editor |
|    8     | Local API for extending platform                                  | Environment, Web requests to servers           |
|    9     | Video playback                                                    | Environment                                    |
|    10    | Support for proprietary video hosting                             | Video playback                                 |

### Out of Scope Initially

| Priority | Feature                            | Dependencies                                   |
| :------: | :--------------------------------- | :--------------------------------------------- |
|    11    | Text chat                          | Environment, Person to person interaction      |
|    12    | Screen sharing (OBS)               | Environment, Person to person interaction      |
|    13    | Modeling and 3D Creation (Blender) | Environment, Static content creation in editor |

## Implementation

The implementation details will be determined once the proposal is accepted and the features are finalized.

## Positive Consequences

- A well-structured and prioritized feature list will guide development efforts.
- Clear categorization helps manage stakeholder expectations about what will be included in the initial release.

## Negative Consequences

- Some features may require more time and resources than initially estimated.
- Stakeholders may have different opinions on the priority of certain features.

## Option Graveyard

This section will include any options considered but ultimately rejected during the decision-making process.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

This question will be addressed during the implementation phase for each feature.

## Is there a reason why this should be core and done by us?

As these features form the core functionality of the V-Sekai platform, they should be developed by our team to ensure quality and consistency.

## References

- [V-Sekai](https://v-sekai.org/)
