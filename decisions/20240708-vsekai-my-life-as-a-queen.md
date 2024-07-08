# Proposed: V-Sekai: My Life as a Princess

## The Context

The second Godot XR Game Jam is organized by the Godot XR Community and is occurring on July 8th, 2024. The jam theme is: **Relaxation!**

## The Problem Statement

Create an Android XR game using the theme of "Relaxation" and utilizing Godot Engine 4.3 with our module for goal hierarchical task network planner and our portable avatar import format (VRM).

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

In "V-Sekai: My Life as a Princess," players assume the role of a princess tasked with rebuilding and managing a kingdom. The game focuses on relaxation through planning, resource management, VR interactions, and adventurer tasking.

- Conversation Menu: Press 'A' to open a conversation menu.
- Day Cycles: The game operates on 5-minute day cycles, providing a sense of urgency and rhythm to daily tasks.
- Assistant: An in-game assistant character helps guide players through their tasks, offering tips and reminders.
- Lasso: The lasso aims to simplify object selection in VR environments, especially when objects are unevenly distributed or the user has shaky hands.

### Design Principles

1. Lateral Thinking with Weathered Technology
2. Reduce Modal Menus
   - Main Menu: A serene landscape with options to start a new game, load a saved game, and access settings.
   - In-Game HUD: Minimalistic interface showing resources, current tasks, and a map of the kingdom.
   - Kingdom View: A top-down view of the kingdom where players can place buildings, gardens, and other structures.
   - Adventurer Management Screen: Interface to manage and send adventurers on quests.

### Initial Prototype

```gdscript
var memories: Dictionary = {
    "is_at": {"player": "cabin"},
    "is_outside_of": {"cave entrance": "cabin"},
    "contains": {"first_room": "treasure"}
}

var todo_list: Array = [
    "Explore the cabin",
    "Find the cave entrance",
    "Enter the cave",
    "Reach the treasure room"
]
```

You start in a little cabin in the woods. You have a cave you can venture into, and at the end is treasure. This initial prototype serves as a simple introduction to the game's mechanics and environment.

### Initial Prototype Reversal

```swift
var princess_strategic_memories: Dictionary = {
    "is_at": {"princess": "royal cabin"},
    "has_goal": {"princess": "retrieve treasure from the cave"},
    "preparation_status": {"princess": "not_started"}
}

var princess_strategic_plan: Array = [
    "Set goal to retrieve treasure from the cave",
    "Prepare for the journey"
]

var princess_tactical_memories: Dictionary = {
    "is_at": {"princess": "royal cabin"},
    "knows_location": {"princess": ["royal cabin", "cave entrance"]},
    "route_planned": {"princess": false}
}

var princess_tactical_plan: Array = [
    "Move to the royal cabin",
    "Locate the cave entrance",
    "Plan route through the cave to the treasure room"
]

var princess_operational_memories: Dictionary = {
    "is_at": {"princess": "royal cabin"},
    "visited": {"princess": []},
    "contains": {"first_room": "treasure"}
}

var princess_operational_plan: Array = [
    "Gather supplies for the journey",
    "Travel to the cave entrance",
    "Wait for the adventurer",
    "Provide support from outside the cave",
    "Receive the treasure from the adventurer"
]

var adventurer_tactical_memories: Dictionary = {
    "is_at": {"adventurer": "adventurer's cabin"},
    "knows_location": {"adventurer": ["adventurer's cabin", "cave entrance"]},
    "route_planned": {"adventurer": false}
}

var adventurer_tactical_plan: Array = [
    "Move to the adventurer's cabin",
    "Locate the cave entrance",
    "Plan route through the cave to the treasure room"
]

var adventurer_operational_memories: Dictionary = {
    "is_at": {"adventurer": "adventurer's cabin"},
    "visited": {"adventurer": []},
    "contains": {"first_room": "treasure"}
}

var adventurer_operational_plan: Array = [
    "Walk to the adventurer's cabin",
    "Search for the cave entrance",
    "Enter the cave",
    "Navigate to the first room",
    "Collect the treasure",
    "Return to the cave entrance and hand over the treasure to the princess"
]
```

In the initial prototype, you explore the cave yourself. In "V-Sekai: My Life as a Princess," you will reverse this concept by taking on the role of the princess who supplies adventurers with instructions to explore the cave and retrieve treasures. This shift from direct exploration to strategic management aligns with the relaxation theme.

## The Benefits

- Relaxing Gameplay: Focuses on non-combat activities like building, gardening, organizing events, and sending adventurers on quests.
- Immersive Experience: Utilizes VRM technology for customizable avatars and Godot's XR capabilities for an engaging experience.
- Dynamic Task Management: The HTN planner ensures that tasks are generated based on player actions, providing a unique experience each time.

## The Downsides

- Learning Curve: Players unfamiliar with resource management games may find it challenging initially.
- Hardware Requirements: Requires a VR-capable device, which may limit accessibility.

## The Road Not Taken

- Combat Mechanics: Instead of focusing on relaxation, we could have included combat elements, but this would detract from the theme of relaxation.
- Linear Storyline: A fixed storyline could have been implemented, but dynamic task generation offers more replayability.

## The Infrequent Use Case

- Seasonal Events: While the game includes various activities, seasonal events such as festivals or special quests tied to real-world holidays are not included. These could add variety but would require additional development time and resources.

## In Core and Done by Us

- Core Development: The V-Sekai development team will handle all core aspects of the game, including coding, art, and design.
- Community Contributions: Open to contributions from the Godot XR community for additional content and features.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team
- iFire
- Brune

## Tags

- V-Sekai
- Godot XR
- Relaxation
- VRM
- HTN Planner

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [Final Fantasy Crystal Chronicles: My Life as a King - A Lost WiiWare Classic [REFFOID]](https://www.youtube.com/watch?v=oHDrSb6DUg4)
4. [Godot XR Game Jam July 2024](https://itch.io/jam/godot-xr-game-jam-july-2024)
5. [Gridmap usage in Cassette Beasts](https://www.cassettebeasts.com/2021/08/09/technical-look-the-park/)

AI assistant Aria assisted with this article.
