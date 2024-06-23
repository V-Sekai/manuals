# Proposed: Use GitHub Actions and Digital Ocean Spaces for a V-Sekai Launcher

## Context

V-Sekai is an open-source project that brings social VR/VRSNS/metaverse components to the Godot Engine. The current setup for providing a launcher to players via itch.io is too complicated and needs simplification.

## Problem Statement

We need a more streamlined process to provide a launcher to players.

## Proposal

Leverage GitHub Actions to build the launcher and then upload it to Digital Ocean Spaces using the casync protocol (with the Desync golang library). This approach will replace the current reliance on gocd.

## Benefits

- Simplified deployment process.
- Reduced dependency on other developers.
- Utilization of familiar and widely-used technologies (GitHub Actions, Digital Ocean Spaces).

## Downsides

The potential downsides could include:

- Learning curve associated with new technologies for some team members.
- Potential costs associated with using Digital Ocean Spaces.
- Possible limitations or issues with the cassync protocol or the Desync golang library.

## The Road Not Taken

Alternative solutions such as continuing with the itch.io setup or exploring other cloud storage services were considered. However, they were not chosen due to their complexity or potential cost implications.

## The Infrequent Use Case

This solution might not be optimal in scenarios where there are significant changes in the game's codebase that would require substantial modifications to the GitHub Actions scripts.

## In Core and Done by Us

This proposal is core to the V-Sekai project and will be implemented by the V-Sekai development team.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project.

_AI assistant Aria assisted with this article._
