# Proposed: Use junit xml based tests in github

### Metadata

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,

### Context and Problem Statement

V-Sekai is not robust.

### Describe the proposed option and how it helps to overcome the problem or limitation

I want to make V-Sekai more robust using best practices like unit tests.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

When CICD runs it will run gut and parse the junit xml that is outputted.

We will also need to use pending head git workflow techniques.

### Positive Consequences

We will be able to use unit tests for gdscript, not just for C++ to make v-sekai more robust.

### Negative Consequences

We cannot get other features in.

### Option graveyard

- Option: The status quo. <!-- List the proposed options no longer open for consideration. -->
- Rejection Reason: This solves nothing. <!-- List the reasons for the rejection: (the bad traits) -->

### If this enhancement will not be used often, can it be worked around with a few lines of script?

This is a cicd change and is able scripting the github actions.

### Is there a reason why this should be core and done by us?

We manage cicd.

### References

- [V-Sekai](https://v-sekai.org/)
- https://martinfowler.com/bliki/PendingHead.html
