# Proposed: Game simulation server sidekick process

## Metadata

- Status: proposed
- Deciders: V-Sekai
- Tags: V-Sekai, Godot Engine, khepri, elixir

## Context and Problem Statement

We want to provide each game server a sidekick process that restarts Godot Engine on crash and acts as a local processor before upload to the source of truth backend database. This will ensure continuous gameplay and data integrity.

## Proposed Solution

We propose to use khepri for sidekick server data with an elixir frontend.

Khepri provides robustness and reliability while Elixir offers scalability and fault-tolerance.

## Implementation

1. Develop a sidekick process using khepri that monitors the Godot Engine.
2. In case of a crash, the sidekick process should be able to restart the Godot Engine.
3. The sidekick process should also act as a local processor for game data before it's uploaded to the backend database.
4. Implement an Elixir frontend to interact with the sidekick process.

## Positive Consequences

- Improved game server stability.
- Continuous gameplay even in the event of a crash.
- Ensured data integrity before upload to the backend database.

## Negative Consequences

- Additional development time and resources required.
- Potential complexity in managing the sidekick process.

## Option graveyard

1. **Using a simple watchdog script:** A simple script that monitors the Godot Engine and restarts it in case of a crash. This was rejected due to its inability to act as a local processor for game data before upload.

2. **Relying on third-party services:** There are several third-party services that offer process monitoring and automatic restarts. However, these were rejected due to potential issues with customization, cost, and data privacy.

3. **Building a custom solution from scratch:** While this would give us the most control, it was deemed too resource-intensive and unnecessary given the existence of suitable tools like khepri and Elixir.

4. **Do nothing:** The option to maintain the status quo was considered but ultimately rejected due to the negative impact on user experience and data integrity.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement is fundamental to the stability of the game servers and cannot be achieved with a simple script workaround.

## Is there a reason why this should be core and done by us?

Yes, as this directly impacts the user experience and the integrity of our game data, it is crucial that we have full control over its implementation and maintenance.

## References

- [V-Sekai](https://v-sekai.org/)
<!-- - This article [is / or is not] assisted by AI. -->
