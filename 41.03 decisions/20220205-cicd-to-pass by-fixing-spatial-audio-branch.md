# Accepted: Allow cicd to pass by fixing spatial audio branch

- Status: accepted <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

## Context and Problem Statement

CICD not passing causes quality to degrade.

## Describe the proposed option and how it helps to overcome the problem or limitation

Fix spatial audio branch of godot engine.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Resolve static checks
1. Fix platform errors.

## Positive Consequences <!-- optional -->

- Good estimates of the work required.

## Negative Consequences <!-- optional -->

- CICD passing is a chore.

## Option graveyard: <!-- same as above -->

- Option: Current status.
- Rejection Reason: It's bad to leave cicd broken.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a few lines.

## Is there a reason why this should be core and done by us?

We are the maintainers.

## References <!-- optional and numbers of links can vary -->

- [Spatial Audio branch](https://github.com/V-Sekai/godot/tree/feature/spatial-audio)

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
