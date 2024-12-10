# Draft: Basic Real-Time Interaction for Character and World Scenes

## The Context

The project will enable users to interact in real-time by manipulating objects within a shared virtual environment, enhancing the user experience.

## The Problem Statement

I want to extend V-Sekai's functionality to support real-time interaction with uploaded character and world scenes. This includes the ability for users to manipulate objects within the scene and have those changes reflected in real-time for other users connected to the same session. Additionally, seamless integration of new elements into the environment is crucial.

Here’s a detailed breakdown of the features we plan to implement:

- **Real-time Interaction**: Users can move and rotate objects in the scene. Changes appear instantly, providing immediate visual feedback.
- **Networked Synchronization**: When one user modifies something, the change is immediately visible to all other users in the same session.
- **Object Persistence**: Users can save their current scene setup to continue working on it later or retrieve it in another session.
- **Dynamic Environment Integration**: Facilitate the introduction of new interactive elements during live sessions.
- **Mediator Role**: A special user, called a mediator, can manage permissions like who can move what, start or end the session, and oversee interactions between users.
- **Limited Scope**: Initially, this feature will support multiple users interacting in one scene without additional complexities like handling multiple scenes or advanced physics.

This upgrade leverages the existing functionality of V-Sekai for uploading and rendering game engine assets. It assumes the utilization of V-Sekai's current game engine and networking capabilities, or the integration of clearly specified, readily available libraries or services to achieve the desired real-time interaction and synchronization.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

### Mock-up Diagram

```plaintext
[Scene Interaction Mock-up]
+------------------------------------------------+
|                                                |
|  [User1]                                       |
|    * (Object1) <-- [Moving]                    |
|                                                |
|  [Tool Switcher Pie Menu]                      |
|    - Move Tool                                 |
|    - Rotate Tool                               |
|    - Close                                     |
|                                                |
|  [User2]                                       |
|    * (Object2)                                 |
|                                                |
+------------------------------------------------+
```

## The Benefits

Enhanced user engagement allows users to interact dynamically with objects, increasing the sense of presence. Establishing basic functionalities lays the foundation for future features that can include more complex interactions. Immediate feedback is crucial for collaborative environments, and intuitive tool selection through the Tool Switcher Pie Menu enhances workflow efficiency.

## The Downsides

The initial features are limited to basic manipulations, which might not meet all user expectations. As the user base grows, the current simple synchronization mechanism may need significant enhancements.

## The Road Not Taken

A full-scale interaction suite was initially considered, including scaling and advanced physics, but it was decided against due to complexity and resource constraints.

## The Infrequent Use Case

While the system is designed for multiple users, it will also support single-user sessions, although this is not the primary focus.

## In Core and Done by Us

This feature is core to the project's mission of enhancing interactive capabilities and will be developed internally to ensure seamless integration and maintain control over quality.

## Status

Status: Draft <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- Project development team
- Fire
- Humble Tim

## Tags

Real-time interaction, basic object manipulation, networked synchronization, user engagement, virtual collaboration, intuitive tool switching

## Further Reading

1. [Project GitHub](https://github.com/project) - Official GitHub account for the project development community focusing on enhancing virtual interaction capabilities.
2. [Project Documentation](https://docs.project.com) - Comprehensive documentation on the project's features and development guidelines.

_AI assistant Aria assisted with this article._
