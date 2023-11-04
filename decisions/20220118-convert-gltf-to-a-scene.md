# Accepted: Convert gltf to a scene with AudioStreamPlayer3D, convert AudiostreamPlayer3D to gltf and expose usability.

- Status: accepted <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,lyuma,
- Tags: V-Sekai,

## Context and Problem Statement

We want to import gltf audio emitters in Godot Engine.

## Describe the proposed option and how it helps to overcome the problem or limitation

We designed a gltf audio emitter extension with OMI.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Convert gltf to a scene with AudioStreamPlayer3D
2. convert AudiostreamPlayer3D to gltf
3. Publish to the Godot Engine 4.0 asset library

## Positive Consequences <!-- optional -->

- Audio emitters.

## Negative Consequences <!-- optional -->

- Work needs to be done to implement omi audio.

## Option graveyard: <!-- same as above -->

- Option: The current status.
- Rejection Reason: Unable to load audio from artwork.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a few lines of code.

## Is there a reason why this should be core and done by us?

I proposed the idea and people at OMI are starting to move on.

## References <!-- optional and numbers of links can vary -->

- https://github.com/omigroup/gltf-extensions/pull/1

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
