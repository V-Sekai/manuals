# Accepted: To make a virtual pet game given Jeana's designs

- Status: accepted
- Deciders: V-Sekai,ifire,Jeana,lyuma,
- Tags: V-Sekai,

## Context and Problem Statement

We were chatting late night and the idea of a virtual pet game was challenged.

## Describe the proposed option and how it helps to overcome the problem or limitation

### Design 1

1. VRM with spring bones
1. reverse bone direction
1. Simulate virtual pet behaviors

### Design 2

- springbone/constraint/follower (will clip through geom)
- physics
- navmesh (bake at runtime?)
- raycast

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Wanted to create a virtual reality pet game where the pet was a character that was beside you in game and networked. The virtual pet would be with you in the game.

## Positive Consequences <!-- optional -->

- Able to backtrack ideas.

## Negative Consequences <!-- optional -->

- Work

## Option graveyard: <!-- same as above -->

- Option: Forgetting decisions.
- Rejection Reason: We won't remember the original reasons why we did things.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a small amount of scripting.

## Is there a reason why this should be core and done by us?

We are running the project.

## References <!-- optional and numbers of links can vary -->

- https://twitter.com/jordy_j_s/status/1489644934743396356?s=20&t=WWesEW8ksELrkJa__3mUIg
- https://github.com/V-Sekai/godot-tfd
- https://twitter.com/VSekaiOfficial
- https://itch.io/jam/virtual-pet-jam

### Reference Design

![Jeana virtual pet concept](./attachments/jeana_virtual_pets.png)

## Derivative License

Copyright (c) 2021 V-Sekai contributors.

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
