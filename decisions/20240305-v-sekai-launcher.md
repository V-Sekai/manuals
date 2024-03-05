# Proposed Solution: V-Sekai Game Launcher

## The Context

The game project's current distribution and dependency management is a challenge. The existing setup, which involves a Godot project with multiple add-ons, is complex and challenging to manage and distribute.

1. The editor plugin is deeply intertwined with the gameplay elements, making it hard to develop.
2. We aim to make the editor plugin lightweight and easy to distribute so that users can easily incorporate it into their regular projects to convert their existing Godot content into V-Sekai-compatible content.
3. There is a code duplication problem between `vsk_game` and `vsk_editor/sdk`.
4. We must consider what changes we can make to the plugin's design to make it more user-friendly.
5. The lack of a package manager and universal plugins or a dependency graph for plugins is a significant issue, potentially overlapping with a core problem in Godot.

The priority question is how to transform this into an SDK with the cleanest possible distribution method.

## Proposed Solution

To address these issues, we propose the creation of a V-Sekai Game Launcher. This launcher will be built using Godot and will replace the regular Godot project manager. It will handle all package-related tasks, ensuring smooth distribution and dependency management.

## The Benefits

1. Simplified distribution: The launcher will handle the distribution of the game, making it easier for users to access and install the game.
2. Improved dependency management: The launcher will also manage the game's dependencies, resolving the current issues faced due to the lack of a package manager.
3. Enhanced user experience: With the launcher handling package and project management, users can focus on creating content or playing the game.

## The Downsides

1. Development time: Building a new launcher will require additional development time and resources.
2. User adoption: Users may need time to adapt to the new launcher and its functionalities.

## The Road Not Taken

An alternative solution considered was to use the Godot Asset Store for distribution. However, it does not solve the dependency management problem and is not ready yet for such a task.

## The Infrequent Use Case

In cases where users want to manage their packages manually or prefer using the regular Godot project manager, they may find the launcher unnecessary or intrusive.

## In Core and Done by Us

The V-Sekai development team will develop the V-Sekai Game Launcher.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team and community stakeholders.

## Tags

- V-Sekai, Avatar Customization, AI, Facial Expressions, Game Launcher

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this proposal.
