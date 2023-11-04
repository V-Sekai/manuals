# Proposed: Solve a V-Sekai naming convention limitation.

## Metadata

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,chatgpt4,naming conventions,standardization,code organization,documentation,project management,

## Context and Problem Statement

We use different kinds of names for V-Sekai, such as `v-sekai`, `V-Sekai`, `vsk`, and `v_sekai`. It is confusing to find a scheme that fits the various naming conventions. Hyphens are banned in Godot Engine file systems, but allowed in GitHub branch names. We also use the `godot_addon` convention sometimes. How can we document and unify the naming conventions across different platforms and contexts?

## Describe the proposed option and how it helps to overcome the problem or limitation

Create a standardized naming convention guideline that defines the preferred format for all instances of V-Sekai's name in code, documentation, and other materials, taking into account the specific requirements and limitations of each platform and context.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

1. Define the preferred naming convention for V-Sekai in different contexts:
   - Godot Engine file systems: `vsk_default`
   - GitHub branch names: `v-sekai-wasm`
   - Addon naming: `addons/vsk_avatar`
   - Github repository names must all be lowercase:
      - GitHub is case-insensitive: this can result in users or devs inadvertently typing the wrong case in one case
      - Windows is case-insensitive, so the above mistake can go unnoticed until the addon is used on a different OS
2. Create a guideline document outlining the naming convention rules for each context.
3. Update existing code, documentation, and materials to follow the new naming conventions.
4. Enforce the naming conventions in future development and contributions.

```python
# Example of following the naming convention in Godot Engine file system
vsk_default/core/object.gd

# Example of following the naming convention in GitHub branch names
v-sekai-wasm

# Example of following the naming convention for addons
addons/vsk_avatar # in the file system
godot_vsk_avatar # on Github
```

## Positive Consequences

- Consistent naming conventions across different platforms and contexts.
- Reduced confusion among developers and users.

## Negative Consequences

- Time and effort required to update existing code and materials to follow the new naming conventions.

## Option graveyard

Doing nothing is a problem.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, establishing consistent naming conventions requires updating all instances of V-Sekai's name across the project and cannot be achieved with a simple script.

## Is there a reason why this should be core and done by us?

Yes, maintaining consistent naming conventions is essential for a professional and well-organized project. It will improve the overall quality of the codebase and documentation, making it easier for developers and users to understand and work with V-Sekai.

## References

- [V-Sekai](https://v-sekai.org/)
- goblin.tools: https://goblin.tools/
- openai: https://openai.com/