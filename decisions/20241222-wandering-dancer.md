# Draft: The Wandering Dancer - Prototype

## The Context

We need a way to test if LLMs can create engaging narratives in games, particularly focusing on emotional expression and non-verbal communication. This prototype explores the potential of LLM-driven dynamic storytelling through dance and movement within a simplified game environment.

## The Problem Statement

Traditional game narratives often rely heavily on dialogue and explicit storytelling, potentially limiting player expression and emotional engagement. LLMs can enable new forms of interactive storytelling that tap into the nuances of body language and physical expression.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

The Minimal Viable Product (MVP) will center around a traveling dancer who visits a new procedurally generated village each day. The player observes villagers, interprets their emotions and social dynamics through their dances and movements, and then creates dances to interact and influence their emotional states.

**Core Gameplay Loop:**

1. **Arrive in Village:**

   - The LLM generates a village with unique cultural dances and movement styles, reflecting the villagers' current emotional states and social dynamics.

   ```python
   # Pseudo-code for village generation (using LLM)
   def generate_village():
       village = {}
       village['name'] = LLM.generate_village_name()
       village['culture'] = LLM.generate_cultural_traits() # Includes dance styles
       village['atmosphere'] = LLM.generate_emotional_atmosphere()
       village['relationships'] = LLM.generate_character_relationships()
       village['locations'] = LLM.generate_locations(3)
       village['characters'] = LLM.generate_characters(3)
       return village
   ```

2. **Observe and Learn:**

   - The player explores the village and observes characters, interpreting their dances and interactions to understand their customs, relationships, and individual emotions.

   ```python
   # Pseudo-code for observing dances (using LLM)
   def observe_dance(character_id):
       dance_moves = LLM.generate_dance_sequence(character_id, village['culture'])
       display(dance_moves) # Visual representation of the dance
       emotional_cues = LLM.interpret_dance_emotionally(dance_moves)
       display(emotional_cues) # Textual description of emotions conveyed
   ```

3. **Interpret and Respond:**

   - Using a simplified dance creation tool, the player interprets the observed dances and creates their own movements in response, expressing empathy, offering support, or joining in celebrations. The LLM can provide suggestions.

   ```python
   # Pseudo-code for dance creation (with LLM suggestions)
   def create_dance():
       dance = []
       while creating:
           move = get_player_input() # From dance creation tool
           dance.append(move)
           LLM_suggestion = LLM.suggest_dance_move(dance, village['culture'])
           display(LLM_suggestion) # e.g., "Consider a move that expresses joy"
       return dance
   ```

4. **Observe Reactions:**

   - The villagers react to the player's dance, expressing their emotions through new dances, dialogue, or changes in their behavior, potentially revealing hidden stories or altering social dynamics. The LLM generates these reactions.

   ```python
   # Pseudo-code for observing reactions (using LLM)
   def observe_reactions(dance):
       for character_id in village['characters']:
           reaction = LLM.generate_reaction_to_dance(character_id, dance)
           if reaction['story_revealed']:
               # Trigger a new story element or quest
               pass
           update_character_state(character_id, reaction['new_emotional_state'])
           display(reaction['dance']) # Villager's dance response
           display(reaction['dialogue']) # May be empty if no dialogue
   ```

**LLM Integration:**

The LLM plays a crucial role in:

- **World Generation:** Creates villages with distinct dance cultures and movement styles, reflecting their emotional atmosphere.
- **Character Development:** Generates characters with unique dance vocabularies and movement patterns based on their personality and emotional state.
- **Dynamic Narrative:** Guides the story based on the player's dance interpretations and interactions, creating emergent narratives and unexpected events.
- **Dance Suggestion:** Provides subtle guidance and feedback on the player's dance creations, helping them understand and respond to the villagers' emotional cues.

**Content Verification:**

- A verifier monitors LLM output to ensure coherence, filter inappropriate content, and maintain consistency.

**Goal-Task Planner Integration (GTPyhop Style):**

To further enhance the dynamic narrative, we'll integrate a Goal-Task Planner based on the GTPyhop framework. This will allow for more structured reasoning and planning within the LLM-driven story.

- **Define predicates:**
  - `at(item, location)`: Specifies the location of an item (character).
  - `knows_dance(character, dance_style)`: Indicates if a character knows a particular dance style.
  - `emotion(character, emotion_type)`: Describes the emotional state of a character.
  - `relationship(character1, character2, relationship_type)`: Defines the relationship between two characters.
- **Define operators:**
  - `move_to(location)`: Moves the player to a specific location.
  - `observe(character)`: Observe a character's dance and behavior.
  - `perform_dance(dance_style)`: Execute a dance in a particular style.
- **Define methods:**
  - `change_emotion(character, target_emotion)`: A method to influence a character's emotional state through dance.
  - `improve_relationship(character1, character2)`: A method to enhance the relationship between two characters.
  - `learn_dance(dance_style)`: A method for the player to learn a new dance style.
- **State representation:** The game state is a dictionary that tracks character locations, known dance styles, emotions, and relationships.

**Example Goal:**

- `emotion(villager1, happy)`

## The Benefits

- **Exploration of Physical Expression:** Explores the use of dance and movement as a primary means of interaction and storytelling.
- **Emotional Depth:** Focuses on creating emotionally resonant experiences through non-verbal communication and nuanced character interactions.
- **Novel Gameplay Mechanics:** Potentially leads to unique gameplay mechanics centered around dance interpretation, creation, and emotional influence.
- **Dynamic Storytelling with Planning:** Combining LLM-driven narrative with a planner like GTPyhop allows for more complex and engaging storylines.

## The Downsides

- **Complexity of Dance Representation:** Requires effectively representing dance movements and emotions for the LLM to process.
- **User Interface Challenges:** Designing an intuitive and expressive dance creation tool within the game.
- **Subjectivity of Interpretation:** Evaluating the impact of the player's dance on characters and the narrative can be subjective.
- **Integration Challenges:** Integrating the LLM, GTPyhop, and the game mechanics may present technical hurdles.

## The Road Not Taken

- Focusing on traditional dialogue-heavy narratives would not fully explore the potential of LLMs in generating dynamic, emotionally driven experiences through physical expression.
- Using a simpler, non-planning-based approach to narrative generation could limit the complexity and depth of the emergent stories.

## The Infrequent Use Case

- Players might visit villages infrequently. The LLM needs to handle this by adapting the narrative, potentially introducing time-related changes in the village, character relationships, and dance styles.

## Why is it in Core and done by us?

This aligns with our focus on innovative game development and exploring the use of LLMs in interactive narratives. It requires deep integration with our game engine and understanding of our long-term goals for dynamic storytelling.

## Status

Status: Draft

## Decision Makers

- V-Sekai development team

## Tags

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

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [GTPyhop Documentation](https://github.com/dananau/GTPyhop)

AI assistant Aria assisted with this article.
