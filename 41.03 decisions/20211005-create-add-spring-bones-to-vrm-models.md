# Proposed: Create a standard procedure from adding spring bones to VRM models.

## Context and Problem Statement

Create a standard operating procedure from adding spring bones to VRM models.

## Describe the feature / enhancement and how it helps to overcome the problem or limitation

By adding spring bones the body doesn't clip through clothing or hair.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

Secondary is a node under the root.

Use `VRM Spring Bone Collider Group` to stop spring bones from clipping with the skeleton.

Add the root bones of the armature you want to animate.

Is it possible to generate a humanoid collider groups?

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Instructions are needed, automation is work.

## Positive Consequences

_No response_

## Negative Consequences

_No response_

## Is there a reason why this should be core and done by us?

I don't know and it's in my area so I need to know.

## References

1. Lyuma has an upside down spring bone arrangement to avoid flipping.
1. https://gist.github.com/emilianavt/51d8399987d67544fdebfe2ebd9a5149
1. https://sator-imaging.booth.pm/items/2254383
1. https://github.com/yuzu-unity/HumanoidCollider/raw/master/HumanoidCollider.unitypackage

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
