# V-Sekai Roadmap and Goals 2023-06-18

### Metadata

- Status: accepted
- Deciders: V-Sekai, fire, guillefix
- Tags: V-Sekai, chatgpt4 summary,

### Context and Problem Statement

What is the V-Sekai Roadmap and Goals?

### Describe the proposed option and how it helps to overcome the problem or limitation

The roadmap presented here is short-term.

### Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

By avoiding work on User Generated Content (UGC) and world building, we can prioritize the three main states in the roadmap: "World / Avatar Performance" (WAP), "Networking" (NET), and "UI/UX". This allows the team to focus on the core aspects of V-Sekai and achieve the goals more efficiently.

### Goals

```mermaid
sequenceDiagram
    participant V-Sekai
    participant Player
    participant Creator
    participant Lyuma as "Lyuma (VRM1 - WAP)"
    participant Fire

    Note over Lyuma: WAP: World / Avatar Performance

    Creator->>V-Sekai: Light assets and async loading
    V-Sekai->>Player: Modern rendering and high performance libraries
    Player->>Creator: Apply network optimization and low latency protocols

    Note over Player, Creator: NET: Network Optimization Techniques

    Creator->>V-Sekai: Efficient data formats and optimized compression algorithms
    V-Sekai->>Player: Respect accurate IK points
    V-Sekai->>Player: Explore multiple technologies and alternative solutions
    Fire->>Creator: Optimize first-time user experience by improving loading process

    Note over Fire, Creator: FTUX: First Time User Experience

```

### Positive Consequences

We can create V-Sekai easier.

### Negative Consequences

Overhead might be hard.

### Option graveyard

- Implementing a custom voice chat solution instead of using onevoip
- Waiting for Godot Engine 4.2 instead of assisting with 4.1 features

### If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No. This is a process.

### Is there a reason why this should be core and done by us?

This is a core process for V-Sekai.

### References

- [V-Sekai](https://v-sekai.org/)
