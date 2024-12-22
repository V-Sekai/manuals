## Draft: The Wandering Bakery - Prototype

### The Context

We need a way to test if LLMs can create engaging narratives in games.

### The Problem Statement

Traditional game stories are often static and predictable.

### Describe how your proposal will work

The Minimal Viable Product (MVP) will focus on a single core gameplay loop centered around a traveling bakery. Each day, the player will arrive in a new procedurally generated village with a few key characters. These characters will have simple desires and backstories that can be discovered through dialogue and fulfilled with baked goods.

The core gameplay loop involves:

1. **Exploration:** Arriving in a new village and exploring its map, which includes key locations like a town square, a well, or a character's home.
2. **Dialogue:** Engaging in conversations with characters to uncover their needs, desires, and backstories.
3. **Baking:** Utilizing a recipe book and available ingredients to bake pastries with specific emotional connections (e.g., a comforting cookie, a celebratory cake). This includes managing a simple inventory and potentially purchasing ingredients.
4. **Observation:** Delivering pastries to characters and observing their reactions, which can range from simple dialogue changes to triggering new quests or story events.

**LLM Integration:**

An AI Storyteller, powered by an LLM, will dynamically generate the following:

- **World Generation:** Creating a unique village each day with a simple map and a few key locations.
- **Character Development:** Generating characters with basic backstories, needs, and desires. This includes a daily "special customer" with a unique and more complex need.
- **Dynamic Dialogue:** Creating branching conversations that respond to player choices and actions, including variations based on gifted pastries and the character's emotional state.
- **Menu Generation:** Creating a menu with dynamic pricing based on ingredient scarcity and village economy.

**Content Verification:**

The Goal-Task Planner's verifier will monitor and filter LLM output to ensure quality and consistency. This includes:

- Ensuring coherence within the game's context.
- Filtering inappropriate or offensive content.
- Maintaining a consistent tone and style.

**Goal-Task Planner Integration:**

The Goal-Task Planner will define a `Domain` with actions, goals, and tasks:

- **Actions:** `bake_pastry(pastry_type)`, `talk_to_character(character_id)`, `give_pastry(character_id, pastry_type)`, `buy_ingredients(ingredient_type, amount)`, `explore_location(location_id)`.
- **Goals:** `character_satisfied(character_id)`, `recipe_unlocked(recipe_id)`, `story_event_triggered(event_id)`, `daily_special_fulfilled`, `earn_minimum_coins`.
- **Tasks:** `satisfy_character(character_id)`, `unlock_recipe(recipe_id)`, `trigger_story_event(event_id)`, `fulfill_special_request`, `sell_pastries`.
- **Multigoal:** For complex scenarios, like satisfying the daily special customer, a `Multigoal` will define the necessary sub-goals.

The `Plan.find_plan()` method will generate a sequence of actions to achieve the desired goals.

### The Benefits

This prototype allows for rapid iteration and testing of LLM-driven narrative generation in a contained environment. It demonstrates the potential for dynamic storytelling and emergent gameplay.

### The Downsides

The prototype will have a limited scope. LLM behavior can be unpredictable, requiring close monitoring.

### The Road Not Taken

A full-fledged game is too complex for an initial prototype. Starting with a simpler, focused experience allows for faster iteration and learning.

### Why is it in Core and done by us?

This aligns with our focus on innovative game development and exploring the use of LLMs in interactive narratives.

### Status

Status: Draft

### Decision Makers

The V-Sekai development team.

### Tags

V-Sekai, LLM, Prototype, Procedural Generation, Dynamic Narrative.

### References

- [NousResearch Hermes-2-Pro-Mistral-7B](https://huggingface.co/NousResearch/Hermes-2-Pro-Mistral-7B)
- [V-Sekai Godot Task Goal Planner](https://github.com/V-Sekai/godot-task-goal-planner)
- [LLMs Can’t Plan, But Can Help Planning in LLM-Modulo Frameworks](https://arxiv.org/html/2402.01817v2)

AI assistant Aria assisted with this article.

### Quote

"Make art. Doesn't matter if it is great or shit. Tell your story." - Member of the Seattle Blender User Group
