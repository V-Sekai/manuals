# Proposed: Create a process for testing V-Sekai.

## The Context

We're making V-Sekai, an immersive VR game that brings social VR/VRSNS/metaverse components to the Godot Engine.

## The Problem Statement

Sometimes our flow doesn't work and we can't play the game because we broke the script.

We want to introduce automated testing to make it easier to debug.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

We propose to use a test-driven development (TDD) approach.

## The Benefits

- Reduced time spent on debugging.
- Increased confidence in the stability of the game.
- Faster development cycle as bugs are caught early.

## The Downsides

- Initial setup of automated testing can be time-consuming.
- Tests need to be maintained and updated as the game evolves.

## The Road Not Taken

We could continue without automated testing, but this could lead to more time spent on debugging and less time on developing new features.

## The Infrequent Use Case

In cases where new features are added infrequently, the overhead of maintaining tests might outweigh the benefits.

## In Core and Done by Us

The testing framework would be part of the core game engine and maintained by us, the V-Sekai development team.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai
- Automated Testing
- Game Development

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
