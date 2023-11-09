# Proposed: Character Customization Discord Bot PoC for V-Sekai

## Metadata

- Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->
- Deciders: V-Sekai, fire
- Tags: V-Sekai, Character Customization, Discord Bot, PoC

## The Backdrop

Within the V-Sekai community, there is a desire to enhance user engagement through interactive tools that allow for creative expression. The community seeks to leverage Discord as a platform to introduce such tools.

## The Challenge

The current challenge is to create an interactive Discord bot that allows for immersive character customization, aligning with V-Sekai's vision of fostering a creative and engaged community.

## The Strategy

To create a Discord bot as a Proof of Concept (PoC) that demonstrates the feasibility of character customization using trait-based input, we will execute the following steps:

1. **Define Key Traits:** We will select a set of fundamental character traits such as height, body shape, hair color, and clothing style. Each trait will be associated with a Unicode emoji for straightforward identification and interaction within the Discord interface.

2. **Bot Development:** A bot will be developed to parse textual commands linked to each trait. For example, a user might input `!height 📏` to set the character's height or `!hair 🎨` to choose a hair color.

3. **Image Generation:** The bot will map each trait to a specific set of 2D image assets. It will have the logic to composite these assets into a single image that represents the character based on the selected traits.

4. **User Interaction:** Reaction buttons for 'like' 👍, 'dislike' 👎, and 'regenerate' 🔄 will be implemented to allow users to interact with the generated character. This will provide immediate feedback mechanisms for the community.

5. **Testing and Iteration:** The bot will be deployed in a controlled Discord environment and tested by real users. Their feedback will be crucial for refining the bot's functionality and user experience.

6. **Documentation:** All development processes, user interactions, and iterations will be thoroughly documented. This documentation will be critical for understanding user needs and will inform future development cycles.

This PoC will serve to validate the core idea, engage the user community early in the development process, and provide critical insights for scaling the bot to handle more complex trait manipulation and 3D character rendering in future phases.

## The Upside

Implementing this bot will potentially increase community engagement by providing a fun and interactive character creation tool. It will also lay the foundation for future developments in VR and character design within the V-Sekai ecosystem.

## The Downside

The initial development of the bot may require significant resources and there is a risk of low user adoption. Additionally, ensuring the bot's scalability and handling user feedback for improvements could be challenging.

## The Road Not Taken

Alternatives, such as outsourcing the tool or purchasing an existing solution, were considered but ultimately rejected in favor of in-house development to retain creative control and better integration with V-Sekai's infrastructure.

## The Infrequent Use Case

There might be less frequent use cases for the bot, such as character customization for one-time events or non-regular users. The bot's design will need to account for these to ensure it remains relevant and accessible.

## In Core and Done by Us?

The core functionality of the bot aligns with V-Sekai's objectives and values. The development will be handled internally to ensure the tool's compatibility with the community's needs and expectations.

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine
3. [V-Sekai Official Website](https://v-sekai.org) - Community of enthusiasts building a next-generation social and gaming VR platform powered by the Godot Engine 4.0
4. [NousResearch Yarn Mistral 7b 128k - Hugging Face](https://huggingface.co/spaces/realgenius/NousResearch-Yarn-Mistral-7b-128k) - A Hugging Face Space by realgenius
5. [Issue #68 · polygonjs/polygonjs - GitHub](https://github.com/polygonjs/polygonjs/issues/68) - Discussion on using polygon.js as a Discord webhook watcher to output messages and attachments

This article was assisted by AI.
