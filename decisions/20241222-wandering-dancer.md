# Proposed: The Wandering Dancer - Prototype

## What is the context of the proposal?

We need a way to test whether LLMs can create engaging game narratives through emotional expression and nonverbal communication. This proposal focuses on dance and movement as a storytelling mechanic.

## What is the problem being solved?

Relying mostly on dialogue can limit player expression. Using LLMs for interactive narratives can enable nuanced body language and physical expression.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

The MVP features a traveling dancer visiting procedurally generated villages. The LLM generates cultural dances, emotional atmospheres, and character relationships. Players observe villagers’ dances, create responses, and influence emotions:

```python
def generate_village():
  village = {}
  village['name'] = LLM.generate_village_name()
  village['culture'] = LLM.generate_cultural_traits()
  village['atmosphere'] = LLM.generate_emotional_atmosphere()
  village['relationships'] = LLM.generate_character_relationships()
  village['locations'] = LLM.generate_locations(3)
  village['characters'] = LLM.generate_characters(3)
  return village
```

Player dance creation and villager reactions are similarly LLM-driven. A goal-task planner handles structured planning:

- Predicates: (e.g., at(item, location), knows_dance(character, style))
- Operators: (e.g., move_to(location), observe(character))
- Methods: (e.g., change_emotion(character, target_emotion))

## What are the benefits of the proposal?

It promotes emotional depth, novel choreography-based gameplay, and dynamic storytelling by combining LLM outputs with structured planning.

## What are the downsides of the proposal?

Representing dance, user interface complexity, subjective interpretations, and technical integration challenges.

## What are the alternative proposals?

Dialogue-heavy approaches or simpler non-planning narrative generation, which might not achieve the same emotional depth.

## When might the proposed solution be used rarely or not at all?

If players seldom visit villages or prefer other gameplay loops, the LLM must adapt its storytelling around infrequent encounters.

## Is this a V-Sekai core responsibility, and can it be done by us?

Yes. It fits our goals for LLM-based interactive narratives and requires close integration with our existing game engine.

## What is the status of the proposal?

Status: Proposed

## Who is making decisions on the proposal?

- V-Sekai development team
- Fire

## What tags does the proposal have?

- V-Sekai
- LLM
- Prototype
- Procedural Generation
- Dynamic Narrative
- Dance
- Emotion
- Non-Verbal Communication
- GTPyhop
- Planning

## List further reading references

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)
3. [GTPyhop Documentation](https://github.com/dananau/GTPyhop)

AI assistant Aria assisted with this article.
