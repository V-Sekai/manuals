# Proposed: Use WebRTC to Native to Interop with Godot Engine

## The Context

In the realm of game development, particularly with the Godot Engine, enabling seamless communication between native clients and web clients is crucial. This proposal aims to address this need by leveraging WebRTC for interoperability.

## The Problem Statement

We cannot connect between native clients and web clients for our Godot Engine game. This limitation hinders the user experience and restricts the game's accessibility across different platforms.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Implement WebRTC in both native and web clients to facilitate real-time communication.

Set up a signaling server to manage the initial connection setup between clients.

Utilize WebRTC data channels for efficient data transfer between clients.

Integrate WebRTC functionalities within the Godot Engine to ensure smooth operation.

## The Benefits

- **Improved Connectivity**: Enables seamless communication between native and web clients.
- **Enhanced User Experience**: Provides a consistent gaming experience across different platforms.
- **Scalability**: Facilitates the addition of new features that require real-time communication.

## The Downsides

- **Complexity**: Implementing WebRTC can be complex and may require significant development effort.
- **Performance Overhead**: Real-time communication may introduce performance overhead, especially on lower-end devices.

## The Road Not Taken

Alternative approaches such as using traditional client-server models or other communication protocols were considered but ultimately deemed less efficient or effective for real-time communication needs.

## The Infrequent Use Case

In scenarios where highly specialized or technical language is required, additional human oversight may be necessary to ensure accuracy and appropriateness.

## In Core and Done by Us

This proposal aligns with our core values of efficiency and professionalism and will be implemented by our team.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
