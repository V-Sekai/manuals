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

2. Remove empties that are unused.
3. Merge all meshes into one mesh (current limitation)
4. Merge all animations into one animation and save a json of the frame and animation split times.
5. Export one animation as an alembic sequence
6. Export better-fbx with a meter to centimeter conversion and no animations. Set unit scale to 100. Export only deform bones.
7. Import better-fbx with only deform bones.
8. Export better-fbx again.
9. Set BONE_COUNT to be 3x the bone count.
10. Run dem bones (parameters to be determined)
    * `dembones -i="Bone_Geom.fbx" -a="Bone_Anim.abc" --bindUpdate=2 -b=BONE_COUNT -o="Decomposition_$BONE_COUNT.fbx"`
11. Check the RMSE is between 0.1 and 0.
11. Use the resulting fbx scale at 1x. User euler XYZ rotation.

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
