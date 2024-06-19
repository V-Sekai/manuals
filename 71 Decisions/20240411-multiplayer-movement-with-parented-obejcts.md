# Proposed: Implementing a 3D Multiplayer Movement System with Parented Objects and Inventory Management

## The Context

The V-Sekai development team is working on enhancing the multiplayer experience in our VR game. We aim to create a more immersive and interactive environment for our players, akin to electrons circling in an atom or bustling activity on an MMOG street.

## The Problem Statement

Our VR game lacks a robust system for managing 3D multiplayer movement, parented objects, tracking validation, authentication, account metadata information, server boundaries, inventory management, and asset delivery. We also need to implement a mechanism for players to seamlessly leave and rejoin the game.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Our proposed solution involves implementing a series of features:

1. **3D Multiplayer Movement**: We will use the libgodot process to manage 3D multiplayer movements. This will allow players to interactively move around in the 3D space, similar to electrons circling in an atom.

2. **Parented Objects**: We will develop a system to handle parented objects, allowing for complex interactions between game entities.

3. **Tracking Validation & Authentication**: We will implement mechanisms to validate cross-communication and user inputs, along with an authentication system for account security.

4. **Account Metadata Information**: We will store and manage account metadata information to personalize the user experience.

5. **Server Boundaries**: We will set limitations on the server, such as boundaries, to maintain game balance and performance.

6. **Inventory Management**: Players can spawn items from their inventory, create new items, and return them to the inventory.

7. **Game Rejoining**: Players will have the ability to leave and rejoin the game without losing their progress.

8. **Asset Delivery and Upload**: We will establish an efficient asset delivery and upload system.

9. **Voice Communication**: We plan to add voice communication to enhance player interaction.

## The Benefits

- Enhanced player interaction with 3D multiplayer movement and voice communication.
- Improved game balance and performance with server boundaries.
- Better user experience with personalized account metadata information.
- Seamless gameplay with the ability to leave and rejoin the game.

## The Downsides

- Requires significant development effort.
- Potential for increased system complexity.

## The Road Not Taken

We considered using existing game engines or libraries, but they did not meet our specific requirements for a highly interactive and immersive VR game.

## The Infrequent Use Case

This proposal may not be suitable for smaller projects that do not require complex 3D multiplayer interactions or inventory management.

## In Core and Done by Us

The V-Sekai development team will implement this proposal.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team, "Bioblaze Payne", "fire"

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

Assisted by Aria.
