## Proposed: Real-Time Motion Capture and Animation Synchronization

### Context

In the context of V-Sekai, a VR social network, we are looking to enhance the user experience by introducing real-time motion capture and animation synchronization features. This would allow users to interact with each other in real-time within the Godot engine.

### Problem

Currently, there's no mechanism for real-time synchronization of skeleton motion capture (mocap), blend shape animations, and skeleton animations between different users. This limits the interactive capabilities of the platform and hinders the creation of a truly immersive virtual environment.

### Solution

We propose to extend the live collaboration feature to include real-time synchronization of mocap and animations. This will enable users to see each other's movements and expressions in real-time, further enhancing the interactivity of the platform.

### Benefits

- **Real-Time Interaction**: Users can see each other's movements and expressions in real-time, creating a more immersive and interactive experience.
- **Animation Synchronization**: Changes made to the animations by one user are instantly visible to others.
- **Enhanced User Experience**: The ability to interact with each other in a more realistic manner greatly enhances the overall user experience.

### Downsides

- **Increased Complexity**: The addition of mocap and animation synchronization could increase the complexity of the project.
- **Performance Impact**: Real-time synchronization of animations could have an impact on performance, especially for users with slower internet connections.

### MVP

The minimum viable product would include the ability to move a model around on one machine and have those positions updated on another, as well as the ability to perform basic animations that are visible to other users. Given the simplicity of the Godot scene format, this should be achievable.

### Implementation

The V-Sekai team will implement this feature.

### Status

Proposed

### Decision Makers

- V-Sekai development team

### Tags

- V-Sekai
- Godot
- Live Collaboration
- Motion Capture
- Animation Synchronization

### Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)

Assisted by Aria, an AI assistant.
