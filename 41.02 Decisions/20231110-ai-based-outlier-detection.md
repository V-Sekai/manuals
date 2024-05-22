# Proposed: Streamlining Game Development with AI-Based Aria's Guidance

## Metadata

- Status: Proposed
- Deciders: V-Sekai
- Tags: V-Sekai, AI, Game Development, Outlier Detection

## The Backdrop

Game assets often contain defects. Aria, an AI-based game creation assistant, can help detect and rectify these issues by calling necessary functions to perform tests.

## The Challenge

The challenge is to efficiently identify and correct common errors in game assets, ranging from minor glitches to major bugs. Manual detection is time-consuming and prone to human error. Additionally, managing the size of data being processed by a large language model (LLM) with a 128k token context presents a challenge.

## The Strategy

We propose implementing an AI-Based Outlier Detector game creation assistant that detects common errors. This system would analyze game assets, identify anomalies, and suggest corrections. To manage the large token context, we suggest using proxy resources - simplified versions of original assets that retain enough detail for the AI to perform its analysis.

A key requirement is for the assistant to retain input data only until it has been processed. Permission is required to incorporate any input data into the learning dataset, ensuring user privacy and data security.

## The Upside

- Reduces debugging and error correction time.
- Improves game quality by ensuring all assets function as intended.
- Efficiently processes large amounts of data using proxy resources.

## The Downside

- Requires significant resources for development and integration.
- May not identify all types of bugs, especially those requiring contextual understanding.
- Proxy resources may not capture all nuances of original assets.

## Alternatives

An alternative could be enhancing existing manual testing processes or using traditional bug tracking software. However, these methods may not offer the same efficiency and accuracy as an AI-based system.

## The Infrequent Use Case

This solution is particularly useful for large-scale game projects with numerous assets where manual error detection would be inefficient.

## In Core and Done by Us?

Yes, this proposal suggests the development of an in-house AI system tailored to our specific needs.

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)
3. [NousResearch Yarn Mistral 7b 128k - Hugging Face](https://huggingface.co/spaces/realgenius/NousResearch-Yarn-Mistral-7b-128k)

_This proposal was assisted by Aria, an AI assistant._
