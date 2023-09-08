# Prototyping a Generative Assistant Screen

## Metadata

- **Status**: Proposed
- **Deciders**: V-Sekai
- **Tags**: `V-Sekai`

## The Backdrop

V-Sekai is a platform that enables the creation of generative AI using the Godot engine. This AI can be displayed on a device with an OLED display and incorporates various sensors and a posing compute module. The platform also supports direct importing of VRM1 avatars.

## The Challenge

The primary challenge lies in utilizing GGML for both conversation interactions (openllama) and voice commands (whisper). The objective is to develop a digital assistant, but the intricacies of game development present significant obstacles.

## The Strategy

The proposed strategy involves focusing exclusively on voice interactions and a speech-to-text interface using GGML, excluding Python. This approach necessitates a profound understanding of GGML and its applications in creating interactive and responsive AI capable of effectively processing and responding to voice commands.

We aim to avoid embedded software development and connect the display directly to the compute.

## The Upside

The potential benefit is the creation of a unique digital assistant that harnesses the power of generative AI. This could transform how we interact with technology and pave the way for new possibilities in the field of AI.

## The Downside

The project's complexity and difficulty are the main drawbacks. It demands a high level of expertise and knowledge in several areas, including GGML, the Godot engine, and AI development.

## The Road Not Taken

One alternative considered but not pursued was integrating Python alongside GGML. While Python is a powerful and versatile language that could have added more flexibility to the project, it was ultimately decided that focusing solely on GGML would allow for a more specialized and optimized system. Another unexplored option was using a pre-existing AI framework instead of building one from scratch. This could have saved time and resources, but it would have limited the customization and unique features of our digital assistant.

## The Infrequent Use Case

This project may not be suitable for those unfamiliar with GGML or without a background in AI development.

## In Core and Done by Us?

Yes, this project will be developed in-house, leveraging our expertise in AI and game development.

## Further Reading

- [V-Sekai](https://v-sekai.org/)
- [GGML on GitHub](https://github.com/ggerganov/ggml)
- This article is assisted by AI.
