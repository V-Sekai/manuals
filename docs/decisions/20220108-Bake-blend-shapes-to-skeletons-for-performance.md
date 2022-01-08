# Bake blend shapes to skeletons for performance

- Status: proposed <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,

## Context and Problem Statement

Blend shapes are slow to render.

## Describe the proposed option and how it helps to overcome the problem or limitation

Bake blend shapes to skeletal animation.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. I want to bake the entire 52 face blendshape movements and the rest of the vrm blend shapes to a single animation track.
2. I can send it to dem bones and bake the blend shapes.

### Dem Bones baking procedure

1. Merge all meshes into one mesh (current limition)
2. Export one animation as an alembic sequence
3. Export fbx with a meter to centimeter conversion
4. Run dem bones (parameters to be determined)
5. Use the resulting fbx

### Open questions:

I align each track to a second? one after the others? 

How do I find the tracks again?

## Positive Consequences <!-- optional -->

- Better performance
- Able to compose animations

## Negative Consequences <!-- optional -->

- More bones

## Option graveyard: <!-- same as above -->

- Option: Status quo
- Rejection Reason: Blend shapes are slow and uncomposable.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a few lines of code to do error bound matching and geometry processing.

## Is there a reason why this should be core and done by us?

I know how to do this! 

## References <!-- optional and numbers of links can vary -->

- https://github.com/electronicarts/dem-bones

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
