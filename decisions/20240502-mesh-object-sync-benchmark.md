# Proposal: Stress Testing Godot Engine's Networking System

## Context

The V-Sekai development team is working on a project that involves avatar, world, and prop collaboration workflow in the Godot engine. The team plans to use FoundationDB with SQLite to enhance the performance of this workflow.

## Problem Statement

We need to ensure that the networking system of the Godot engine can handle the increased load and perform optimally under stress.

## Solution

We propose to conduct stress testing on the Godot engine's networking system. This will involve creating multiple virtual users and simulating high traffic scenarios to evaluate how the system performs under heavy load.

```gdscript
# Assuming we have a list of virtual users and a server instance
var virtualUsers = [user1, user2, user3]
var server = Server.new()

for user in virtualUsers:
    var randomSentence = generate_random_sentence() # Function to generate a random sentence
    server.send_message(user, randomSentence)

    if server.stressMode:
        server.rebroadcast_message(randomSentence)
```

## Benefits

- Identify potential bottlenecks in the system.
- Ensure the system can handle high traffic without compromising performance.
- Improve overall system reliability and user experience.

## Downsides

- Requires time and resources to set up and conduct the tests.
- Potential for false positives or negatives due to the simulated nature of the test.

## The Road Not Taken

An alternative would be to skip stress testing and directly implement the system. However, this could lead to unforeseen issues in a live environment, potentially affecting user experience.

## The Infrequent Use Case

In cases where the traffic is consistently low, stress testing may not provide significant benefits. However, it's still important to prepare for potential spikes in usage.

## In Core and Done by Us

The proposed stress testing will be conducted by the V-Sekai development team.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [Stress testing Unity’s LLAPI, what are the limits?](https://www.codedojo.com/?p=2091)

This proposal was assisted by Aria, an AI assistant.
