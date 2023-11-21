# MVP Proposal

The goal of this project is to create a VR environment using Godot, Elixir, and the Khepri library. The MVP will focus on developing an interactive virtual space with basic physics, capable of supporting up to 1000 player entities.

## Key Features

1. **VR Prototype**: A simple VR environment with interactive objects and basic physics.
2. **Networking**: Development of a distributed simulation network model using WebRTC for real-time communication between players.
3. **Authority Transfer Mechanism**: A system for transferring control of objects using the Khepri library to handle synchronization and conflict resolution.
4. **Scalability**: Ensuring the system can support up to 1000 player entities.

## Development Approach

We'll start by creating classes for each type of object (e.g., chair, avatar, ball) that inherit from a base GameObject class. Each class will have properties like name, user_uid, attachments, scale, skeleton, and an array of interactions. We'll implement methods within these classes to allow for manipulation such as dragging and scaling, and also to add or remove interactions based on the object's state.

Our network model will be a distributed simulation model. This model allows all players in the game to interact with the objects and send their states to other players. Although this model is less secure than a client/server model with client-side prediction, it does not require expensive rollback and resimulation.

## Testing and Feedback

We'll define various testing scenarios under different conditions, particularly focusing on concurrent interactions and network latency. We'll also gather data on system performance and user experience, and iteratively refine the system based on feedback.

By applying a smart object interaction model and using a distributed simulation network model, we aim to create a dynamic and interactive environment where players can manipulate objects and share their states with other players. The chair, as a standard test item, will be an excellent starting point for implementing this pattern.

## References

[Networked Physics in Virtual Reality](https://gafferongames.com/post/networked_physics_in_virtual_reality/)

# Scenario: Avatar Interacts with a Chair

#### Initial Setup

Let's assume that each avatar and chair has a state stored in Khepri. The state includes various attributes like position, ownership, and whether the chair is currently occupied or not.

#### Incremental State Changes

When an avatar interacts with a chair, such as sitting down on it, only the relevant changes to the state are recorded. For example:

- The chair's state change: The `occupied` attribute changes from `false` to `true`, and the `occupied_by` attribute is updated to the ID of the avatar.
- The avatar's state change: The `sitting` attribute changes from `false` to `true`, and the `sitting_on` attribute is updated to the ID of the chair.

#### Creating a Patch

A patch is a small data structure that represents these changes. It's more efficient than sending the entire state. A patch for the chair might look like this:

```elixir
%{occupied: true, occupied_by: avatar_id}
```

And for the avatar, the patch could be:

```elixir
%sitting: true, sitting_on: chair_id}
```

#### Applying the Patch in Khepri

These patches are then sent to Khepri to update the respective states. Khepri applies these patches to the existing state trees of the chair and the avatar. This can be done using Khepri's API, like so:

```elixir
khepri.put(chair_path, chair_patch)
khepri.put(avatar_path, avatar_patch)
```

This method only modifies the parts of the state that have changed, making it very efficient.

#### Synchronization

After the state has been updated in Khepri, it's important to synchronize this new state across all clients to maintain consistency in the game. This could involve broadcasting the updated state to all clients, or sending specific updates to the clients that are affected by the change.

### Advantages of This Approach

1. **Efficiency**: By only sending the changes instead of the full state, we can reduce the usage of network bandwidth, which is very important for a real-time multiplayer game.
2. **Speed**: Applying small patches is generally faster than processing the entire state, which leads to quicker updates.
3. **Scalability**: This approach scales well with an increasing number of players and interactions, as each change is handled independently.
4. **Consistency**: Using Khepri ensures that the state remains consistent across the server and all clients, even when there are concurrent interactions happening.
