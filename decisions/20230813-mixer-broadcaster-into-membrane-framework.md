# Rewriting Mixer Broadcaster Into Membrane Framework Pipelines

## Metadata  

- **Status**: Proposed
- **Deciders**: V-Sekai  
- **Tags**: V-Sekai, Elixir, Membrane Framework, Multiplayer Blender

## Context and Problem Statement  

Ubisoft's mixer broadcaster code has been the only available solution for handling multiplayer blender. However, it has its limitations when it comes to scalability and real-time performance. This proposal aims to rewrite the code using Elixir and the Membrane Framework.

## Decision Drivers  

The main challenge is to translate the existing code into Elixir while maintaining the functionality and improving upon the limitations of the current system. This includes ensuring that the new code can handle larger volumes of users and provide real-time updates without lag or delay.

## Considered Options  

The strategy is designed to leverage the unique features of Elixir and the Membrane Framework. It aims to address the limitations of the current system by optimizing these features.

## Decision Outcome  

By rewriting the code in Elixir and using the Membrane Framework, we can expect improved scalability and real-time performance. This will allow for more users to use the system simultaneously without experiencing delays or lags. Additionally, the fault-tolerance feature of Elixir will ensure that the system remains operational even when errors occur.

## Positive Consequences  

Improved scalability and real-time performance. More users can use the system simultaneously without experiencing delays or lags.

## Negative Consequences  

Rewriting the code will require time and resources. There may also be a learning curve for developers who are not familiar with Elixir and the Membrane Framework.

## Prospects for the Future  

An alternative approach would have been to optimize the existing code instead of rewriting it. However, this would not have addressed the inherent limitations of the current system.

## Infrequent Use Case  

In cases where the number of users is low and real-time updates are not critical, the current system may still be sufficient. However, as the user base grows and the demand for real-time updates increases, the need for a more scalable and efficient system becomes apparent.

## Ownership  

Yes, the rewriting of the code will indeed be done by us as we also maintain the uro backend services.

## Links  

- [V-Sekai](https://v-sekai.org/)  
- [Elixir](https://elixir-lang.org/)
- [Membrane Framework](https://www.membraneframework.org/)

*This article is assisted by AI.*