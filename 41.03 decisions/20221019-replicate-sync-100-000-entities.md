# Proposed: Replicate sync 100'000 entities using a solution (Revision 1)

- Status: proposed
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,sync,view replication,

## Context and Problem Statement

Develop a performant and robust (correctly and with liveness) network entity sync in V-Sekai.

A client is one Godot Engine connection, it can view and change entities.

There are 100'000 networked entities in a city and we go from position a to position b in a loop in a mover with one or more attached cabins.

## Describe the proposed option and how it helps to overcome the problem or limitation

This document is a general problem statement.

## Positive Consequences <!-- optional -->

- Large sims!

## Negative Consequences <!-- optional -->

## Option graveyard: <!-- same as above -->

- Option: Current V-Sekai replication
- Rejection Reason: Can't link servers

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Entity replication is not trivial.

## Is there a reason why this should be core and done by us?

We're doing the networking layer.

## References <!-- optional and numbers of links can vary -->

- [20221019-develop-a-replication-sync-for-100-000-entities.md](20221019-develop-a-replication-sync-for-100-000-entities.md)
- [20221016-v-sekai-view-replication.md](20221016-v-sekai-view-replication.md)
- [20221014-networking-overhaul-proposal.md](20221014-networking-overhaul-proposal.md)
- [Efficient*Methods_for_Improving_Scalability_and_Playability_of_Massively_Multiplayer_Online_Game_MMOG*.pdf](https://pure.bond.edu.au/ws/portalfiles/portal/18275482/Efficient_Methods_for_Improving_Scalability_and_Playability_of_Massively_Multiplayer_Online_Game_MMOG_.pdf)

### Questions

How many clients can be in this simulation?

The state database should be smaller to avoid replication traffic on non-liveliness.

## Math

The calculation of who to pair and to find nearby or relevant players is a N^2 loop. Use better algorithms to lower O (N^2) into O (N log N).

The proposed solution can be solved in O (N log N).

## Derivative License

Copyright (c) 2022 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
