# Bake blend shapes to skeletons for performance

- Status: proposed <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,

## Context and Problem Statement

Blend shapes are slow to render.

## Describe the proposed option and how it helps to overcome the problem or limitation

Bake blend shapes to skeletal animation.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. I want to bake blendshapes
   * 52 face blendshape face movements
   * VRM blend shapes
   * The blend shapes are interpolated between 0s and 1s.
   * single animation track.
3. I can send it to dem bones and bake the blend shapes.

### Dem Bones baking procedure

1. In Blender set the scene to cm and use 10 as the unit scale.
1. Merge all meshes into one mesh (current limitation)
2. Merge all animations into one animation and save a json of the frame and animation split times.
3. Export one animation as an alembic sequence
4. Export fbx with a meter to centimeter conversion
5. Run dem bones (parameters to be determined)
    * `dembones -i="Bone_Geom.fbx" -a="Bone_Anim.abc" --bindUpdate=2 -b=1000 -o="Decomposition_1000.fbx"`
7. Use the resulting fbx

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
