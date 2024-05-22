# Proposed: Allow Godot Asset Library browser to use alternative sources

- Status: proposed <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

## Context and Problem Statement

Godot Engine has a great asset library browser.

Why can't we reuse it for alternative Godot engine asset libraries?

## Describe the proposed option and how it helps to overcome the problem or limitation

Add an alternative server and document the current api as an openapi schema.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Openapi schema for the official asset library api.
1. Elixir server implementation
1. Patch to Godot Engine to add arbitrary asset libraries

## Positive Consequences <!-- optional -->

- More freedom.
- Xananax said he'll use it. Xanax's games are made 100% of addons with assets and glue code being the game.

## Negative Consequences <!-- optional -->

- Different libraries

## Option graveyard: <!-- same as above -->

- Option: <!-- [List the proposed options no longer open for consideration.] -->
- Rejection Reason: <!-- [List the reasons for the rejection: (the Bad traits)] -->

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Could be a few lines of script. Unsure of scope. The server can be a lot too.

## Is there a reason why this should be core and done by us?

Not so core, but I can do it.

## References <!-- optional -->

- https://github.com/godotengine/godot-asset-library/blob/master/API.md

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
