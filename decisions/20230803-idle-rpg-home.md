# Make a Social RPG World

## Metadata

- Status: Proposed 
- Deciders: V-Sekai
- Tags: V-Sekai

## Context and Problem Statement

We aim to provide a compelling reason for users to stay engaged in the V-Sekai world. A social RPG game could be the solution, offering continuous gameplay that encourages prolonged interaction.

## Proposed Solution

### Setting

Our game is set in a "Comfortable Cyberprep" realm. It merges sci-fi with ease, where tech and humans harmoniously coexist. Players explore a future city where technology is part of life. The city glows with neon lights, holographic interfaces, and advanced AI, yet retains homeliness. Buildings radiate warmth, digital trees line streets changing hues with seasons, and cafes serve VR pods with coffee. This blend of high-tech and cozy creates a unique, thrilling yet soothing ambiance, ideal for our game.

1. Static couch collider: A fixed location where players can interact or rest.
2. **Non-functional** Static bed without collider: A place for characters to rejuvenate without any physical interaction.
3. **Non-functional** Mirror that is off: A decorative element that can be turned on for various uses.
4. **Non-functional** Video player screen that is off: A feature that can be activated for entertainment or information.

### Story

1. Chill and hang with friends: The game will provide a relaxed environment where players can socialize.
2. Play a game: Beyond socializing, players can engage in an RPG game that is fun and rewarding.

### Systems

1. RPG game with level rewards: Players improve through play.
2. Combat System: Players can choose between different types of weapons such as a sword or a wand, or opt for defensive items like shields or healing items. This adds a strategic element to the game, especially in multiplayer mode.
3. Stationary Attacked Target System: A combat mechanism enabling player engagement with immobile targets.

### Development Limits

1. Settings are not persisted past server restart.
2. Limited number of weapon choices: To maintain balance in the game, the number of weapon choices can be limited.
3. Cooldown period for using healing items: To prevent spamming of healing items, a cooldown period can be implemented.

## Implementation

The implementation details will be decided upon acceptance of this proposal.

## Positive Consequences

- Increased user engagement
- Prolonged interaction within the V-Sekai world
- Enhanced socialization among players

## Negative Consequences

- Potential increase in development time and resources
- Risk of unbalanced gameplay if the RPG system is not properly designed

## Option Graveyard

In this section, we document the options that were considered but ultimately discarded for various reasons.

- **Idle RPG Mechanic**: Initially, an idle RPG game was proposed to keep users engaged. However, after careful consideration, it was decided to remove this feature. The idle mechanic could potentially lead to less active engagement from players as the game progresses on its own over time. We aim for a more interactive experience where players are actively involved in the gameplay. Therefore, this option has been moved to the graveyard.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

The frequency of use will depend on the players' engagement level. However, given the complexity of an RPG system, it cannot be simply worked around with a few lines of script.

## Is there a reason why this should be core and done by us?

Creating an RPG system as a feature of V-Sekai will enhance the overall user experience and engagement, which aligns with our goal of providing a compelling virtual world.

## References

- [V-Sekai](https://v-sekai.org/)
