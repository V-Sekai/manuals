# Accepted: Git Subrepo Addon Management

## Context and Problem Statement

We are currently managing separate repositories for each addon in the V-Sekai game. This has led to difficulties in synchronizing updates and maintaining consistency across different components of the project.

## Proposed Solution

We propose to continue maintaining separate repositories for each addon, but use Git subrepo to merge them into the main V-Sekai game repository. This would result in the following structure:

```bash
v-sekai-game
│
└───addons
    │
    ├───vrm (from godot-vrm/only-addon)
    │
    └───Godot-MToon-Shader (from Godot-MToon-Shader)
```

This way, all addons will be part of the main game repository but can still be managed independently.

## Implementation

The implementation will involve the following steps:

1. Changes are made in the respective addon repositories.
2. These changes are then merged into the main V-Sekai game repository using Git subrepo.

This ensures that the addons remain up-to-date with their respective repositories.

## Positive Consequences

- Streamlined workflow for managing addons.
- Easier synchronization of updates across different components of the project.
- Reduced complexity in project management.

## Negative Consequences

- Initial setup may require some time and effort.
- Developers will need to adapt to the new workflow.

## Option graveyard

Previously, we considered maintaining separate repositories for each addon without using Git subrepo. However, this approach was discarded due to the difficulties in synchronizing updates and maintaining consistency across different components of the project.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement is fundamental to the project structure and cannot be worked around with a few lines of script.

## Is there a reason why this should be core and done by us?

Yes, this change affects the core structure of our project and should therefore be implemented by us to ensure consistency and control over the project.

## References

- [V-Sekai](https://v-sekai.org/)
