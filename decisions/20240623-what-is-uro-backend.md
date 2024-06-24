# Proposed: Why did we build "Uro"?

## The Context

V-Sekai is an open-source project that brings social VR/VRSNS/metaverse components to the Godot Engine. It has a complex architecture involving multiple components, including a game client, a backend called "Uro", and game servers.

## The Problem Statement

There is a need to explain the architecture of V-Sekai, specifically the roles and interactions of the game client, the Uro backend, and the game servers.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

- Game Client connect to Uro and Game Servers
- Game Backend "Uro"
- Game Servers

## The Benefits

Understanding the architecture of V-Sekai can help developers contribute more effectively to the project. It can also help users troubleshoot issues and understand the capabilities and limitations of the system.

## The Downsides

The complexity of the architecture may be daunting for some, and there may be a learning curve involved in understanding it.

## The Road Not Taken

- An alternative approach could have been to implement a Peer-to-Peer (P2P) architecture. In this setup, each game client also acts as a mini-server, communicating directly with other clients.
- Another alternative would be to use cloud-based game backends such as Microsoft's PlayFab. These services can automatically scale up or down based on demand, ensuring that there's always enough capacity for all players.
- Nakama is an open-source distributed social and realtime server for games and apps. It has a rich feature set including user accounts, chat, social, matchmaker, realtime multiplayer, and much more.

## The Infrequent Use Case

The primary use case for the Uro server is to facilitate interactions between the game client and the game servers, there may be infrequent use cases where its functionality could be extended or used in different ways. For example, it is can be used to implement additional features such as leaderboards, achievements, or social networking features within the game. These use cases, while not common, should still be considered when designing and implementing the Uro server.

## In Core and Done by Us

This proposal is core to the V-Sekai project and will be implemented by the V-Sekai development team.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team
- Fire
- Aries

## Tags

- V-Sekai
- Uro Backend
- Game Architecture
- Open-source Project
- Godot Engine

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
