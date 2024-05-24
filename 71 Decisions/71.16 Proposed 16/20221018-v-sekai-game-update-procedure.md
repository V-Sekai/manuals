# Proposed: To remember how to update the engine and game write a procedure

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

## Context and Problem Statement

<!-- Describe the problem or limitation you are having in your project. You may want to articulate the problem in the form of a question. -->

Godot Engine and V-Sekai are fast moving projects.

## Describe the proposed option and how it helps to overcome the problem or limitation

Write down how to update the engine and the game.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. First step: change the `update_vsekai_godot` script to push to a staging branch.
1. Next step (lazy and simple): it is your responsibility to build the engine, run groups project and make sure it works.
1. Optionally: you should perform an export build and make sure that works too.
1. Next step (less lazy): we add another set of CI pipelines for staging godot -> staging templates -> staging groups
   and then we test that
1. Most issues aren't export related, so I think engine build + open project and run project is probably sufficient for most things
   and we need a script to push staging -> groups-4.x
1. Which means everyone gets the upgraded engine

## Positive Consequences <!-- improvement of quality attribute satisfaction, follow-up decisions required -->

Creating a standard procedure means people know what to do.

## Negative Consequences <!-- compromising quality attribute, follow-up decisions required -->

It's complicated.

## Option graveyard:

- Option: The status quo. <!-- List the proposed options no longer open for consideration. -->
- Rejection Reason: This solves nothing. <!-- List the reasons for the rejection: (the bad traits) -->

## If this enhancement will not be used often, can it be worked around with a few lines of script?

This is a procedure and not code.

## Is there a reason why this should be core and done by us?

We know how to do this and others don't.

## References

- [V-Sekai](https://v-sekai.org/)

## License of the contribution

Copyright (c) 2022 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
