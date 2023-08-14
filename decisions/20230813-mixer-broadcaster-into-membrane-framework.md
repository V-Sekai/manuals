# Rewriting Mixer Broadcaster Into Membrane Framework Pipelines

## Metadata  

- **Status**: Proposed
- **Deciders**: V-Sekai  
- **Tags**: V-Sekai, Elixir, Membrane Framework, Multiplayer Blender

## The Backdrop  

Ubisoft's mixer broadcaster code has been the only available solution for handling multiplayer blender. However, it has its limitations when it comes to scalability and real-time performance. This proposal aims to rewrite the code using Elixir and the Membrane Framework.

## The Challenge  

The main challenge is to translate the existing code into Elixir while maintaining the functionality and improving upon the limitations of the current system. This includes ensuring that the new code can handle larger volumes of users and provide real-time updates without lag or delay.

## The Strategy  

The strategy is designed to leverage the unique features of Elixir and the Membrane Framework. It also considers the use of the Khepri database library instead of PostgreSQL. Khepri is a tree-like replicated on-disk database library for Erlang and Elixir, which relies on Ra, an Erlang implementation of the Raft consensus algorithm, for consistency, replication, and data management.

## The Upside  

By rewriting the code in Elixir, using the Membrane Framework, and implementing the Khepri database library, we can expect improved scalability and real-time performance. This will allow for more users to use the system simultaneously without experiencing delays or lags. Additionally, the fault-tolerance feature of Elixir will ensure that the system remains operational even when errors occur.

## The Downside  

Rewriting the code will require time and resources. There may also be a learning curve for developers who are not familiar with Elixir, the Membrane Framework, and the Khepri database library.

## The Road Not Taken  

An alternative approach would have been to optimize the existing code instead of rewriting it. However, this would not have addressed the inherent limitations of the current system.

## The Infrequent Use Case  

In cases where the number of users is low and real-time updates are not critical, the current system may still be sufficient. However, as the user base grows and the demand for real-time updates increases, the need for a more scalable and efficient system becomes apparent.

## In Core and Done by Us?  

Yes, the rewriting of the code will indeed be done by us as we also maintain the uro backend services.

## Further Reading  

- [V-Sekai](https://v-sekai.org/)  
- [Elixir](https://elixir-lang.org/)
- [Membrane Framework](https://www.membraneframework.org/)
- [Khepri Database Library](https://hex.pm/packages/khepri)

*This article is assisted by AI.*