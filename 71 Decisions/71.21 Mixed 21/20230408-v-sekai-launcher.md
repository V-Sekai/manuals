# Proposed: Provide v-sekai-game in a launcher to make it easier to use v-sekai

### Metadata

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

### Context and Problem Statement

Provide v-sekai-game in a launcher.

### Describe the proposed option and how it helps to overcome the problem or limitation

Make a graphical launcher that runs scoop.

Run scoop bucket add v-sekai-central https://github.com/v-sekai/v-sekai-central.

To install, do scoop install v-sekai-game.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Create a scoop bucket at https://github.com/V-Sekai/v-sekai-central
2. Store game builds in git repos using desync to put seperate the files into chunks.
3. In the manifest decompress the desync files.

### Positive Consequences

We are able to use V-Sekai easier.

### Negative Consequences

We cannot get other features in.

### Option graveyard

Do nothing.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

This is a json manifest which is a bit more than a few lines of script.

### Is there a reason why this should be core and done by us?

Want to make it easier to use v-sekai.

### References

- [V-Sekai](https://v-sekai.org/)
