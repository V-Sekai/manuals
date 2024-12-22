## Draft: The Wandering Bakery - Prototype

### The Context

We need a way to test if LLMs can create engaging narratives in games.

### The Problem Statement

Traditional game stories are often static and predictable.

### Describe how your proposal will work

- Minimal Viable Product (MVP): Focus on a single core gameplay loop:
  - One Town: A small village with a few key characters.
  - Basic Needs: Characters have simple desires that can be fulfilled with basic pastries.
  - Limited Recipes: A small set of recipes with clear emotional connections.
  - Core Interaction: Dialogue with characters, baking, and observing reactions.
- AI Storyteller: An LLM will generate the town, characters, and basic dialogue, including:
  - World Generation: A simple map with a few key locations within the village.
  - Character Development: A handful of characters with basic backstories and needs.
  - Dynamic Dialogue: Simple dialogue variations based on player choices and actions.
- Content Verification: The Goal-Task Planner's verifier will monitor and filter LLM output to ensure quality and consistency. This includes:
  - Coherence: Ensuring the generated content makes sense within the game's context.
  - Appropriateness: Filtering any inappropriate or offensive content.
  - Consistency: Maintaining a consistent tone and style throughout the generated content.
- Goal-Task Planner Integration:
  - Domain: Define a `Domain` that encapsulates the game's environment, actions, and goals.
  - Actions: Define `actions` like `bake_pastry(pastry_type)`, `talk_to_character(character_id)`, `give_pastry(character_id, pastry_type)`.
  - Goals: Define `goals` like `character_satisfied(character_id)`, `recipe_unlocked(recipe_id)`, `story_event_triggered(event_id)`.
  - Tasks: Define `tasks` like `satisfy_character(character_id)`, `unlock_recipe(recipe_id)`, `trigger_story_event(event_id)`.
  - Multigoal: Define `Multigoal` for complex scenarios requiring multiple sub-goals to be achieved.
  - Planning: Utilize the `Plan.find_plan()` method to generate a sequence of actions to achieve the desired goals based on the current game state.

### The Benefits

- Proof of Concept: Demonstrate the potential of LLM-driven narrative.
- Rapid Iteration: Quickly test and refine core mechanics.

### The Downsides

- Limited Scope: The prototype will not represent the full vision.
- Potential for Unexpected Behavior: LLMs may require close monitoring.

### The Road Not Taken

A full-fledged game is too complex for an initial prototype.

### Why is it in Core and done by us?

This aligns with our focus on innovative game development.

### Status

Status: Draft

### Decision Makers

- V-Sekai development team

### Tags

- V-Sekai
- LLM
- Prototype

### References

- [NousResearch Hermes-2-Pro-Mistral-7B](https://huggingface.co/NousResearch/Hermes-2-Pro-Mistral-7B)
- [V-Sekai Godot Task Goal Planner](https://github.com/V-Sekai/godot-task-goal-planner)

AI assistant Aria assisted with this article.
