# Proposed: Multiplayer Sync Between Different Godot Instances

## What is the context of the proposal?

We aim to enhance multiplayer capabilities in the Godot Engine by synchronizing node scene trees across different instances. Additionally, we intend to create a shadow scene tree to generate asynchronous glTF 2.0 binaries served via a web server.

## What is the problem being solved?

Currently, synchronizing complex node scene trees in multiplayer scenarios within Godot is challenging. There's a need for an efficient method to ensure consistency across all client instances. Moreover, generating async glTF 2.0 binaries for web servers requires a reliable shadow scene tree mechanism.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams.

The proposal involves implementing a synchronization protocol that mirrors the node scene tree structure across all multiplayer instances. This includes:

- **Syncing Node Trees:** Establishing real-time updates and state management to ensure all clients reflect the same scene tree.

  ```gdscript
  func sync_scene_tree(node):
      for child in node.get_children():
          rpc_sync(child)
          sync_scene_tree(child)
  ```

- **Shadow Scene Tree:** Creating a duplicate of the main scene tree to handle asynchronous operations like glTF 2.0 binary generation.

  ```gdscript
  var shadow_tree = duplicate_scene_tree(main_tree)

  func generate_async_gltf():
      Thread.new().start(shadow_tree.export_gltf())
  ```

- **Web Server Integration:** Serving the generated glTF binaries through a web server for external access.

## What are the benefits of the proposal?

This proposal offers several key benefits. It ensures consistency by providing all multiplayer clients with a synchronized view of the scene. Performance is enhanced by offloading heavy operations, such as glTF generation, to a shadow tree, thereby preventing main thread blockages. Scalability is facilitated through the reliable synchronization of multiplayer environments, allowing for easy expansion. Additionally, flexibility is achieved by enabling asynchronous processing and external access to generated assets via a web server.

## What are the downsides of the proposal?

However, the proposal introduces increased complexity by implementing synchronization protocols and shadow trees. Resource consumption may rise due to the maintenance of shadow trees and the handling of synchronous operations. There is also the potential for latency issues, as real-time synchronization might cause delays during high-frequency updates.

## What are the alternative proposals?

Alternative approaches include server-side authority, which centralizes scene management on the server to control synchronization. State interpolation is another option, utilizing interpolation techniques to manage state discrepancies between clients. Decentralized synchronization allows clients to manage their own synchronization logic without relying on a central protocol.

## When might the proposed solution be used rarely or not at all?

In scenarios with single-player environments or where scene complexity is minimal, the synchronization overhead might be unnecessary. Additionally, projects not requiring asset exports (like glTF binaries) would not benefit from the shadow scene tree approach.

## Is this a V-Sekai core responsibility, and should it be done by us?

Yes, managing multiplayer synchronization and asset generation aligns with V-Sekai's focus on enhancing social VR functionalities within the Godot Engine ecosystem.

## What is the status of the proposal?

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Who is making decisions on the proposal?

- V-Sekai development team

## What tags does the proposal have?

- V-Sekai

## List further reading references.

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
