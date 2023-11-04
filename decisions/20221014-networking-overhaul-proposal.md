# Draft: Networking Overhaul

- Status: draft
- Deciders: V-Sekai, Malek, Lyuma, SaracenOne, Fire,
- Tags: Networking,

## Context and Problem Statement

We seek to solve these issues:

- **(A)** Use godot 4.0's networking tools.
- **(B)** Use a relay server that doesn't run any game code, rather than a headless V-Sekai server.
- **(C)** Make the costs of hosting V-Sekai as small as possible.
- **(D)** Write the server in Rust, for the speed and safety guarantees.
- **(E)** Make networking highly scalable for a single server.
- **(F)** Allow a client to connect to multiple servers simultaneously without issues, for seamless travel and portals.
- **(G)** Synchronize state between clients

Note: This proposal does not cover Permissions, and is based in part on the previous Entity Networking proposal.

## Describe the proposed option and how it helps to overcome the problem or limitation

By using the technologies described below, we will cover A-G.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

### A. State Locking Model

To reduce complexity, latency, and processing power, we have created a simple Mastership/Ownership model.

Clients are defined as individuals connecting to a Server, they have their own v-sekai game instance running.

The Relay Server, as of now, does not contain information about the state of the world, the only information the Relay Server contains is on Mastership/Ownership rules.

```
P1 connects to the Server.

P2 connects to the Server.

P3 connects to the Server.

P1 spawns in a Ball.

Server marks that P1 has both Mastership and Ownership of Ball.

Server synchronizes with P1 and sends the state of the Ball to P2, its location, rotation, the very fact of its existence, and its owner, master, and rule.

```

Server State

| Objects | Master | Owner | Rule |
| ------- | ------ | ----- | ---- |
| Ball    | P1     | P1    | Ask  |

What does this mean?

#### Ownership

Since P1 is the Owner of the Ball, this means that P1 is the only one who can change the state of the ball. When Server synchronizes, if P2 were to have the ball in a different location then P1, the Server would tell P2 that the Ball is in the location P1 has it, and would do the same for P3. It can be thought of as a _mutex_ on the state of the Ball. Whoever holds the Mutex is the one who can modify the state therein. This also means that all calculations for game state are split up among all the players, every player only has to run code modifying what they own, which in large scale player events would otherwise increase exponentially with custom scripts for each player's props or avatars.

#### Mastership

This presents a problem however, how could P2 take the Ball from P1? The solution is Mastership. Whoever is the Master can change who is the Owner at any time. The Master also can change whatever the default Rule is, which is what the Server, and Client references when looking to change Ownership to itself (or someone else?).

- Ask: Take a round trip to the Master and back to the Server so the Master can decide based on external factors whether or not to allow ownership transfer or deny it. This could be used for example, if someone only wants a gun to be grabbable if they are a "shooter" and not if they are a "civilian"
- Deny: You cannot ask for ownership transfer, good for things like Avatar's transform node, you don't wanna be involuntarily moved around, or for the root of the world map.
- Allow: You can ask for ownership any time, and it is automatically granted.

### Tweaks

We can change the rate of synchronization based on the closest clients owned model, and other things like that, there are a lot of areas for optimization when it comes to using this.

## Positive Consequences List

- Low Latency for Competitive/Real-Time interactions
- Low processing power on both the server and client side
- Broad enough to be easily modifiable for optimizations in the future without changing the model

## Negative Consequences List

- Complexity, we will have to code this all from scratch basically
- Multi-user interactions become impossible on a single object, at least to do simply, some smart coding could get around it but it isn't easy to do.
- Resolutions for the _allow_ rule could lead to inconsistencies, such as two different people picking up a gun and firing it, and two resulting bullets being spawned from the same gun before it gets removed from one individual.

## Is there a reason why this should be core and done by us?

Absolutely, this is the foundation of basically everything content wise in V-sekai.

## References

https://github.com/V-Sekai/V-Sekai.github.io/blob/master/decisions/2020/20200729-entity-networking.md

Malek's forum post on networking in the Discord server.

## Derivative License

Copyright (c) 2022 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
