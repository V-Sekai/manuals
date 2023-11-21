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
