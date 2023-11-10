# Proposed: Streamlining Game Development with AI-Based Aria's Guidance

## Metadata

- Status: Proposed
- Deciders: V-Sekai
- Tags: V-Sekai, AI, Game Development, Outlier Detection

## The Backdrop

Game assets commonly have defects. Aria, an AI-based game creation assistant, can be utilized to detect and rectify these issues. However, the tests need not be implemented by the AI itself. Instead, Aria can call functions as needed to perform the tests.

## The Challenge

The challenge lies in identifying and correcting the common errors in game assets which can range from minor glitches to major bugs that affect gameplay. Manual detection is time-consuming and prone to human error. Furthermore, using a large language model (LLM) with a 128k token context suggests the need for managing the size of the data being processed.

## The Strategy

Implement an AI-Based Outlier Detector game creation assistant that detects common errors. This system would analyze game assets, identify outliers or anomalies, and suggest corrections. To handle the large token context, we propose the use of proxy resources. Proxy resources are simplified versions of the original assets that retain enough detail for the AI to perform its analysis. This approach allows us to reduce the amount of data being processed without losing critical information. Aria will call the necessary functions to perform these tests, rather than implementing them directly.

A crucial requirement is for the assistant to retain any input data only until it has been processed. Ask for permission to incorporate into the learning dataset. This ensures that the AI system adheres to user privacy and data security.

## The Upside

The implementation of this AI system will significantly reduce the time spent on debugging and error correction. It will also improve the quality of the game by ensuring all assets are functioning as intended. Using proxy resources will allow us to process large amounts of data efficiently.

## The Downside

The development and integration of such a system could require significant resources. Additionally, while AI can catch many errors, it may not be able to identify all types of bugs, especially those that require contextual understanding. Using proxy resources may not capture all the nuances of the original assets.

## The Road Not Taken

An alternative approach could be to enhance the existing manual testing processes or use traditional bug tracking software. However, these methods may not offer the same level of efficiency and accuracy as an AI-based system.

## The Infrequent Use Case

This solution is particularly useful for large-scale game projects with numerous assets where manual error detection would be highly time-consuming and inefficient.

## In Core and Done by Us?

Yes, this proposal suggests the development of an in-house AI system tailored to our specific needs.

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine
3. [NousResearch Yarn Mistral 7b 128k - Hugging Face](https://huggingface.co/spaces/realgenius/NousResearch-Yarn-Mistral-7b-128k) - A Hugging Face Space by realgenius

This article was assisted by AI.
