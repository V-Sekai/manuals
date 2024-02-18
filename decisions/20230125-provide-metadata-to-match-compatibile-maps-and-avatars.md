# Proposed: Provide metadata to pre-check if maps and avatars are compatible to load

### Metadata

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,lyuma
- Tags: V-Sekai,

### Context and Problem Statement

We don't know which are maps and avatars are compatible to load.

### Describe the proposed option and how it helps to overcome the problem or limitation

> Add date and version number to maps list

Can also be add xmp metadata packets to each packed scene.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

When the user presses launches the game, there should be no unnecessary steps.

### Positive Consequences

It is easier to pick content that is loadable.

### Negative Consequences

We cannot get other features in.

### Option graveyard

- Option: The status quo. <!-- List the proposed options no longer open for consideration. -->
- Rejection Reason: This solves nothing. <!-- List the reasons for the rejection: (the bad traits) -->

### If this enhancement will not be used often, can it be worked around with a few lines of script?

1. this requires a server change
2. this requires a godot engine change

### Is there a reason why this should be core and done by us?

Usability is a core feature.

### References

- [V-Sekai](https://v-sekai.org/)
- [KHR_xmp_json_ld](https://github.com/KhronosGroup/glTF/tree/main/extensions/2.0/Khronos/KHR_xmp_json_ld)
