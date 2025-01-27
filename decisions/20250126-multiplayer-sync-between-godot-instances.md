# Proposed: Multiplayer Sync Between Different Godot Instances

## What is the context of the proposal?

We aim to enhance multiplayer capabilities in the Godot Engine by synchronizing node scene trees across different instances.

## What is the problem being solved?

Currently, synchronizing complex node scene trees in multiplayer scenarios within Godot is challenging. There's a need for an efficient method to ensure consistency across all client instances.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams.

The proposal involves implementing a synchronization protocol that mirrors the node scene tree structure across all multiplayer instances. This includes:

- **Syncing Node Trees:** Establishing real-time updates, property synchronization, and state management to ensure all clients reflect the same scene tree.

  ```gdscript
  func sync_scene_tree(node):
          for child in node.get_children():
                  update_network_properties(child)
                  sync_scene_tree(child)
  ```

## What are the benefits of the proposal?

This proposal ensures consistency by providing all multiplayer clients with a synchronized view of the scene. Performance is enhanced by offloading heavy operations to a shadow tree, preventing main thread blockages. Scalability is facilitated through reliable synchronization of multiplayer environments.

## What are the downsides of the proposal?

There is increased complexity from implementing synchronization protocols. Latency issues might occur with high-frequency updates.

## What are the alternative proposals?

- Server-side authority: Centralizing scene management on the server to control synchronization.
- State interpolation: Managing discrepancies through interpolation techniques.
- Decentralized synchronization: Allowing clients to manage their own logic without a central protocol.

## When might the proposed solution be used rarely or not at all?

In single-player environments or where scene complexity is minimal, the synchronization overhead might be unnecessary.

We do not maintain a shadow tree for web server gltf-binary export, since it's only another synced gltf instance.

## Is this a V-Sekai core responsibility, and should it be done by us?

Yes, managing multiplayer synchronization and asset generation aligns with V-Sekai's focus on enhancing social VR functionalities within the Godot Engine ecosystem.

## What is the status of the proposal?

Status: Proposed

## Who is making decisions on the proposal?

- V-Sekai development team

## What tags does the proposal have?

- V-Sekai

## List further reading references.

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)

AI assistant Aria assisted with this article.
