# Proposed: Use Godot Engine Web Threaded

## The Context

In the development of web-based applications using the Godot Engine, performance and responsiveness are critical. Leveraging multi-threading can significantly enhance these aspects.

## The Problem Statement

When developing web applications with Godot, we face challenges related to loading large resources and maintaining smooth audio playback. Single-threaded implementations often fall short in handling these tasks efficiently.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

| Feature                           | Multi-Threaded | Single-Threaded |
| --------------------------------- | -------------- | --------------- |
| Audio Sampling                    | x              | x               |
| Normal Audio Files                | x              |                 |
| Shared Array Buffer               | x              |                 |
| Load Large Maps in the Background | x              |                 |
| Full Browser Support              |                | x               |
| Potential Bugs                    |                | x               |

## The Benefits

- **Improved Performance**: Multi-threading allows for background resource loading, enhancing application responsiveness.
- **Better User Experience**: Smooth audio playback and faster load times contribute to a more seamless user experience.

## The Downsides

- **Complexity**: Implementing multi-threading can introduce complexity and potential bugs.
- **Browser Compatibility**: Ensuring full browser support for multi-threaded features may require additional effort.

## The Road Not Taken

Alternative approaches such as sticking with single-threaded implementations were considered but ultimately deemed less effective for handling large resources.

## The Infrequent Use Case

In cases where the application does not involve large resources or complex audio processing, single-threaded implementation might suffice.

## In Core and Done by Us

This proposal aligns with our core values of efficiency and performance and will be implemented by our team.

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
