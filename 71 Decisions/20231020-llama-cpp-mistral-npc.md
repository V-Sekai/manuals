# Proposed: Llama CPP AI Model NPC

## Metadata

- Status: Proposed
- Deciders: V-Sekai
- Tags: V-Sekai, AI, NPC, Godot 4

## The Backdrop

In the realm of game development, creating engaging and dynamic Non-Player Characters (NPCs) is a challenging task. With advancements in AI, there's an opportunity to leverage these technologies to enhance NPC interactions.

## The Challenge

The challenge lies in effectively using various AI models to create the "brain" of an AI NPC in Godot 4. This involves generating realistic and contextually appropriate dialogues for the NPCs.

## The Strategy

The strategy involves using a local GPT4All model for generating AI-based NPC dialogue. The script includes several exported variables that can be set in the Godot editor, such as `npc_background_directions`, `sample_npc_question_prompt`, and `sample_npc_prompt_response`. These variables are used to configure the behavior of the AI dialogue generation.

Key functions include:

- `call_model(prompt)`: Calls the local model with a given prompt.
- `set_model(new_model_name : String)`: Sets the model name.

## The Upside

Leveraging AI for NPC dialogue generation can lead to more dynamic and engaging gameplay. It allows for a wide range of responses and can adapt to different player inputs.

## The Downside

AI models require significant computational resources and may not be suitable for all platforms. Additionally, ensuring the appropriateness and quality of generated dialogues can be challenging.

## The Road Not Taken

Traditional methods of NPC dialogue generation involve pre-scripted dialogues or simple decision trees. While these methods are less resource-intensive, they lack the dynamism and adaptability of AI-generated dialogues.

## The Infrequent Use Case

In games with minimal NPC interactions or where dialogue is not a significant aspect of gameplay, the use of AI for dialogue generation may not be necessary.

## In Core and Done by Us?

Yes, the implementation of this strategy is done by us in the core of our game development process.

## Further Reading

- [V-Sekai GitHub](https://github.com/v-sekai/)
- AI assists this article.
- [Axolotl Mistral Example](https://github.com/OpenAccess-AI-Collective/axolotl/tree/main/examples/mistral)
