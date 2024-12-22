## Draft: The Wandering Bakery - Prototype

### The Context

We need a way to test if LLMs can create engaging narratives in games.

### The Problem Statement

Traditional game stories are often static and predictable.

### Describe how your proposal will work

The Minimal Viable Product (MVP) will focus on a single core gameplay loop. It will feature one town, a small village with a few key characters. Characters will have simple desires that can be fulfilled with basic pastries, and there will be a limited set of recipes with clear emotional connections. The core interaction will involve dialogue with characters, baking, and observing reactions.

An AI Storyteller, powered by an LLM, will generate the town, characters, and basic dialogue. This includes world generation with a simple map and a few key locations within the village, character development with basic backstories and needs, and dynamic dialogue with simple variations based on player choices and actions.

Content verification will be handled by the Goal-Task Planner's verifier, which will monitor and filter LLM output to ensure quality and consistency. This includes ensuring coherence within the game's context, filtering inappropriate or offensive content, and maintaining a consistent tone and style throughout the generated content.

The Goal-Task Planner integration will involve defining a `Domain` that encapsulates the game's environment, actions, and goals. Actions will include tasks like `bake_pastry(pastry_type)`, `talk_to_character(character_id)`, and `give_pastry(character_id, pastry_type)`. Goals will include objectives like `character_satisfied(character_id)`, `recipe_unlocked(recipe_id)`, and `story_event_triggered(event_id)`. Tasks will involve actions such as `satisfy_character(character_id)`, `unlock_recipe(recipe_id)`, and `trigger_story_event(event_id)`. For complex scenarios requiring multiple sub-goals to be achieved, a `Multigoal` will be defined. The `Plan.find_plan()` method will be utilized to generate a sequence of actions to achieve the desired goals based on the current game state.

### The Benefits

This prototype will serve as a proof of concept, demonstrating the potential of LLM-driven narrative and allowing for rapid iteration to quickly test and refine core mechanics.

### The Downsides

The prototype will have a limited scope and will not represent the full vision. There is also potential for unexpected behavior, requiring close monitoring of the LLMs.

### The Road Not Taken

A full-fledged game is too complex for an initial prototype.

### Why is it in Core and done by us?

This aligns with our focus on innovative game development.

### Status

Status: Draft

### Decision Makers

The V-Sekai development team.

### Tags

V-Sekai, LLM, Prototype.

### References

- [NousResearch Hermes-2-Pro-Mistral-7B](https://huggingface.co/NousResearch/Hermes-2-Pro-Mistral-7B)
- [V-Sekai Godot Task Goal Planner](https://github.com/V-Sekai/godot-task-goal-planner)
- [LLMs Can’t Plan, But Can Help Planning in LLM-Modulo Frameworks](https://arxiv.org/html/2402.01817v2)

AI assistant Aria assisted with this article.
