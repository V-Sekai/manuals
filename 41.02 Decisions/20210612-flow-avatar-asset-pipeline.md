# Proposed: Convert FBX and glTF2 to VRM via flow-avatar-asset-pipeline

## Context and Problem Statement

How to convert FBX and glTF2 to VRM?

## Describe the proposed option and how it helps to overcome the problem or limitation

If we can convert FBX and glTF to VRM we have a reliable way of importing things to groups.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Convert avatar-asset-pipeline to use the membrane framework.

Have the concept of a source glb we run again as many individual solvers for the input data.

Once the input is solved and it passes QA, that is one that is the outputted.

## Positive Consequences <!-- optional -->

- We have a standard way of importing characters.
- We already have elixir backend infrastructure.

## Negative Consequences <!-- optional -->

- Have no humans in the loop can be bad for quality assurance.

## Option graveyard: <!-- same as above -->

- Option:

* https://github.com/infosia/avatar-asset-pipeline

- Rejection Reason:

* Need to integrate with backend.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Non trivial.

## Is there a reason why this should be core and done by us?

This is a core part of Groups and we depend on it.

## References <!-- optional -->

- https://github.com/infosia/avatar-asset-pipeline
- https://github.com/fire/flow-avatar-asset-pipeline
- https://membraneframework.org/
- https://github.com/membraneframework/membrane_dashboard

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
