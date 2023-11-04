# Proposed: Pmx module integration

## Metadata

- Status: proposed
- Deciders: V-Sekai
- Tags: V-Sekai, GPT-4

## Context and Problem Statement

State process for importing a godot engine module work and publish.

## Proposed Solution

Integrate the Godot PMX module into the V-Sekai project by following the implementation steps below.

## Implementation

1. Go to `https://github.com/V-Sekai/godot`
2. Make sure the 4.0 branch is synced with `https://github.com/godotengine/godot`
3. Create a branch.
   - Let's use an example like `vsk-pmx`.
4. Switch to the branch.
5. Run `git subrepo clone https://github.com/V-Sekai/godot-pmx modules/pmx` in the terminal or command prompt.
6. Code the module.
7. Run `git subrepo pull modules/pmx` in the terminal or command prompt to merge with upstream repo.
6. Code the module.
8. Run `git subrepo push modules/pmx` in the terminal or command prompt to publish.
9. Make sure GitHub CI/CD tests pass.

## Positive Consequences

- Seamless integration of the PMX module into the V-Sekai project
- Improved functionality and features for users
- Easier maintenance and updates for the module

## Negative Consequences

- Potential increase in complexity and dependencies
- Possible performance impact if not optimized properly

## Option graveyard

1. **Manual integration of the PMX module**: Instead of using `git subrepo`, manually copy and integrate the PMX module into the V-Sekai project. This option is less efficient and harder to maintain, as it requires manual updates and synchronization with the original PMX repository.

2. **Using Git Submodules**: Use `git submodule` to include the PMX module in the V-Sekai project. While this approach allows for easier updates and maintenance, it can be more complex to set up and manage compared to `git subrepo`.

3. **Creating a separate plugin**: Develop the PMX module as a standalone plugin that users can install and enable in their projects. This option reduces the complexity of the core V-Sekai project but may result in less seamless integration and increased setup effort for users.

4. **Forking the Godot Engine**: Fork the entire Godot Engine and directly modify its source code to include the PMX module. This option is not recommended, as it would make it difficult to keep the fork updated with upstream changes and could lead to compatibility issues.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

This enhancement cannot be easily worked around with a few lines of script, as it involves integrating a new module into the core project.

## Is there a reason why this should be core and done by us?

Integrating the PMX module into the core project ensures that it is maintained and updated alongside the main project, providing a consistent and reliable experience for users.

## References

- [V-Sekai](https://v-sekai.org/)