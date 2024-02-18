# Proposed: Have two groups move towards each other battle demo

### Metadata

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

### Context and Problem Statement

We need a demo of our work.

### Describe the proposed option and how it helps to overcome the problem or limitation

Make a game out of having two groups attack each other.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Create two groups: mass A and mass B
2. Implement pathfinding for both groups to find each other
3. Add avoidance behavior to prevent collisions between group members
4. Implement attack functionality when groups are in range

```javascript
function createGroups() {
  massA = createGroupA();
  massB = createGroupB();
}

function update() {
  pathfind(massA, massB);
  pathfind(massB, massA);

  avoidance(massA);
  avoidance(massB);

  attack(massA, massB);
  attack(massB, massA);
}
```

## Additional features for the test

1. Can use WebAssembly (WASM) scripting
2. In-game tablet drag to place objects

### Positive Consequences

- We are able to use V-Sekai easier.

### Negative Consequences

- We cannot get other features in.

### Option graveyard

- Option: The status quo.
- Rejection Reason: This solves nothing.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

This is an integration test.

### Is there a reason why this should be core and done by us?

It helps us focus.

### References

- [V-Sekai](https://v-sekai.org/)
- [renown](https://youtu.be/tVrLMXZDNyo)
