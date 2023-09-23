# Streamlining V-Sekai Performance

## Metadata

- Status: Proposed
- Deciders: V-Sekai
- Tags: V-Sekai, Godot, Networking

## Background

V-Sekai, leveraging the Godot client-server model, aspires to support 1000-2000 clients concurrently. The objective is to deliver uninterrupted gameplay and a comprehensive gaming experience.

## Challenges

Key challenges encompass managing single shard overload, administering shadow shards, executing the spacetime model, and enabling lightcone transitions. These tasks necessitate precise planning, execution, and monitoring for peak performance.

## Approach

A simple gameplay session will be started where an art sourcer can upload artwork. The game environment will be a flat surface with a boundary, allowing for mathematical movement calculations without a navigation mesh.

The number of clients connecting to the server will be gradually increased, starting small and eventually reaching 2000. This will test the server's capacity to handle multiple connections. During testing, system resources will be monitored to estimate the cost and resources required to support 2000 players. Gameplay sessions will be recorded for the trade show and load testing will be conducted to ensure our server can manage the maximum number of players without crashing or significant slowdowns.

1. **Server Configuration**: Set up a Godot server that listens on a designated port.
2. **Client Development**: Build a Godot client that connects to our server using High-Level Networking.
3. **Shadow Shard Administration**: Generate shadow copies of the original shard, serialize them for network transmission, and synchronize their state periodically.
4. **Spacetime Model Execution**: Develop data structures symbolizing different parts of the model and outline their interactions.
5. **Lightcone Transitions**: Preserve the current game state, pinpoint the target lightcone, transition to it, and validate the transition.

## Advantages

This strategy allows us to accommodate numerous clients simultaneously without sacrificing performance or user experience. It also provides a systematic method to monitor and enhance gaming sessions.

## Limitations

This approach requires substantial resources and expertise in server configuration, networking, and game development. Unexpected challenges may surface during implementation and testing.

## Alternatives

A potential alternative could have been adopting a different game engine or networking model. However, this would demand a complete revamp of our existing setup, possibly compromising performance and flexibility.

## Exceptional Scenarios

In situations of unexpected traffic surges or server outages, contingency plans are essential to minimize gameplay disruption.

## Responsibility

All tasks outlined are integral to our operations and will be undertaken by us.

## Additional Resources

- [V-Sekai](https://v-sekai.org/)
- This article is assisted by AI.
