# Accepted: Challenges in managing and synchronizing multiple assets and libraries across different git repositories

### Metadata

- Status: accepted <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire
- Tags: V-Sekai,chatgpt4 summary,

### Context and Problem Statement

V-Sekai projects currently face challenges in managing and synchronizing multiple assets and libraries across different branches. How can we improve the workflow to better maintain the project's organization and compatibility?

### Describe the proposed option and how it helps to overcome the problem or limitation

Implement a Git subrepo management system to separate assets and libraries, enabling easier tracking and synchronization between branches. This solution streamlines the development proces

### Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Configure the Git subrepo to automatically update and synchronize with the main project.

Use the Git subrepo in each branch to maintain consistent asset and library versions.

Avoid storing godot and modules inside of the v-sekai-game.

### Positive Consequences

* Improved organization and compatibility of assets and libraries across branches.
* Simplified workflow for project updates and synchronization.

### Negative Consequences

 * Potential learning curve for developers unfamiliar with Git subrepo management.
 * Possible limitations in implementing other features.


### Option graveyard

Workarounds using scripts may be possible, but they are likely to be less efficient and more prone to errors compared to a Git subrepo management system.


### If this enhancement will be used infrequently, can it be worked around with a few lines of script?

Not a few lines of code. It is also devops.

### Is there a reason why this should be core and done by us?

Integrating a Git subrepo management system as a core feature ensures consistency and maintainability across the entire V-Sekai project. It promotes better collaboration among team members and streamlines the development process.


### References

- [V-Sekai](https://v-sekai.org/)
- [Git Subrepo Documentation](https://github.com/ingydotnet/git-subrepo)
