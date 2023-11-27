# Accepted: Benchmarking Network Performance for Scalable Multiplayer in Godot

## Metadata

- Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->
- Deciders: V-Sekai Team, Bioblaze Payne, fire
- Tags: Networking, Performance, Godot Engine, V-Sekai, Test

## The Backdrop

In the pursuit of optimizing network performance for the V-Sekai project, we're at a point where we need to evaluate different networking strategies provided by the Godot Engine.

## The Challenge

Design a comprehensive series of tests to measure and compare the performance of the three different networked multiplayer strategies within the Godot Engine:

1. **The many servers approach**: A decentralized model where numerous smaller servers handle subsets of users.
2. **The many worlds approach**: A single server hosts multiple distinct world instances.
3. **The one world with threaded process group nodes**: A monolithic single world that leverages threading to manage users and activities.

## The Strategy

The testing was suggested by Bioblaze Payne, who has outlined a sequential approach:

- **Phase 1**: Basic Connection Test
  - Connect a user, send a message, await 1000 messages in return, disconnect, then reconnect.
- **Phase 2**: Large Scale Stress Test
  - Simultaneously connect 4000 users, with each sending a message upon connection every 500ms. Ensure all messages are replicated to all connected clients.

During these tests, we'll monitor:

- Load times for initial connections and reconnections.
- Throughput and latency of message delivery.
- Server resource usage (CPU, RAM, Network I/O).
- Any errors or dropped connections that occur.

All relevant events should be timestamped and logged to a centralized logging system for analysis.

## The Upside

By conducting this research, we aim to:

- Identify the most scalable and efficient networking strategy for the V-Sekai project.
- Gather empirical data to inform future development decisions.
- Contribute findings back to the wider Godot community to aid in similar multiplayer projects.

## The Downside

Potential risks and drawbacks include:

- Time and resources required for test setup and execution.
- Interpretation of results may vary, leading to indecision.
- Possible discovery of fundamental issues that could delay project timelines.

## The Road Not Taken

This section will detail alternative methods and practices considered but ultimately not chosen, with justifications for their exclusion.

## The Infrequent Use Case

We will also explore less common user scenarios that may have unique performance characteristics under each networking strategy.

## In Core and Done by Us?

Discussion on whether the outcomes of this initiative should be integrated into the core V-Sekai codebase or maintained as separate modules.

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine.

_This design document was completed with assistance from AI developer Aria._
