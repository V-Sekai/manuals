# Proposed: Streamlining V-Sekai Performance

## Metadata

- Status: Proposed
- Deciders: V-Sekai
- Tags: V-Sekai, Godot, Networking

## Background

V-Sekai, leveraging the Godot client-server model, aspires to support 1000-2000 clients. The objective is to deliver uninterrupted gameplay and a comprehensive gaming experience.

## Challenges

Key challenges encompass managing single-shard overload, administering shadow shards, and implementing state synchronization and game state transitions. These tasks necessitate precise planning, execution, and monitoring for peak performance.

## Approach

A simple gameplay session will be initiated where an art seller can upload artwork. The game environment will be a flat surface with a boundary, allowing mathematical movement calculations without a navigation mesh.

The number of clients connecting to the server will gradually increase, starting small and eventually reaching 2,000. This will test the server's capacity to handle multiple connections. During testing, system resources will be monitored to estimate the cost and resources required to support 2000 players. Gameplay sessions will be recorded for the trade show, and load testing will be conducted to ensure our server can manage the maximum number of players without crashing or significant slowdowns.

1. **Server Configuration**: Set up a Godot server that listens on a designated port.
2. **Client Development**: Build a Godot client that connects to our server using High-Level Networking.
3. **Shadow Shard Administration**: Generate shadow copies of the original shard, serialize them for network transmission, and synchronize their state periodically.
4. **State Synchronization**: Develop `Ref<Animation>` data structures symbolizing different parts of the model and outline their interactions.
5. **Game State Transitions**: Preserve, the current game state, pinpoint the target state, transition to it, and validate the transition using an orphan `AnimationTree`.

## Advantages

This strategy allows us to accommodate numerous clients simultaneously without sacrificing performance or user experience. It also provides a systematic method to monitor and enhance gaming sessions.

## Limitations

This approach requires substantial resources and expertise in server configuration, networking, and game development. Unexpected challenges may surface during implementation and testing.

## Alternatives

A potential alternative could have been adopting a different game engine or networking model. However, this would demand a complete revamp of our existing setup, possibly compromising performance and flexibility.

## Exceptional Scenarios

Controversial plans are essential to minimize gameplay disruption in unexpected traffic surges or server outages.

## Responsibility

All tasks outlined are integral to our operations and will be undertaken by us.

## Additional Resources

- [V-Sekai]
- AI assists this article.
