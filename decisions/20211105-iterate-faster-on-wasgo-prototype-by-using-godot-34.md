# Rejected: Iterate faster on WasGo prototype by using Godot 3.4

- Status: rejected <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,

## Context and Problem Statement

Iterating on WasGo is too slow.

## Describe the proposed option and how it helps to overcome the problem or limitation

Propose iterating on WasGo on Godot 3.4.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Branch off Godot 3.4
1. Use our version of wasgo
1. Restore wasgo demos.
1. Implement templated C++ code via mustashe for Wasgo
1. Port to master

## Positive Consequences <!-- optional -->

- Separate the two axis of development. The first axis is Godot Engine master and the second axis is Wasgo development.

## Negative Consequences <!-- optional -->

- May or may not be more expensive.
- Took too much effort to verify.

## Option graveyard: <!-- same as above -->

- Option: <!-- [List the proposed options no longer open for consideration.] -->
- Rejection Reason: <!-- [List the reasons for the rejection: (the Bad traits)] -->

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Coding strategy is not coding.

## Is there a reason why this should be core and done by us?

This is a V-Sekai strategy plan.

## References <!-- optional -->

- <https://github.com/V-Sekai/WasGo>

## Derivative License

Copyright (c) 2020-2021 V-Sekai contributors.

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
