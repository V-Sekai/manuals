# Proposal: Bake blend shapes to skeletons for performance

- Status: proposed <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,

## Context and Problem Statement

Blend shapes are slow to render.

## Describe the proposed option and how it helps to overcome the problem or limitation

Bake blend shapes to skeletal animation.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. I want to bake blendshapes
   - 52 face blendshape face movements
   - VRM blend shapes
   - The blend shapes are interpolated between 0s and 1s.
   - single animation track.
2. I can send it to dem #bone and bake the blend shapes.

### Dem #bone baking procedure

2. Remove empties that are unused.
3. Extract the blend shape from the mesh
4. Export as alembic 1 meter is 1 unit. Flatten hierachy.
5. Note that all transforms on un-rigged meshes should be applied.
6. Remove the skeleton and fbx export as 1 meter is 0.01 units.
7. Run dem #bone (parameters to be determined)

```bash
./dembones -i="a.fbx" -a="a.abc" -z=4 --bindUpdate=2 -b=200 -o="a_res.fbx"
# Note that RMSE should be in the same range as 0.01
Computing Skinning Decomposition:
    Iter #0: Updating trans..... Done! Updating weights... Done! RMSE = 0.0917716
`

11. Check the RMSE is less than 0.001.

#### Options

Skinning decomposition to generate bone transformations and skinning weights from input meshes sequence

`call #dembones -i="Bone_Geom.fbx" -a="Bone_Anim.abc" -b=20 -o="Decomposition_20.fbx"`

Joint grouping

`call #dembones -i="Bone_Geom.fbx" -a="Bone_Anim.abc" -b=20 --bindUpdate=2 -o="Decomposition_20_grouped.fbx"`

Solve skinning weights from input meshes sequence and input bone transformations

`call #dembones -i="Bone_Trans.fbx" -a="Bone_Anim.abc" --nTransIters=0 -o="SolvedWeights.fbx"`

Solve bone transformations from input meshes sequence and input skinning weights

`call #dembones -i="Bone_Skin.fbx" -a="Bone_Anim.abc" --nWeightsIters=0 -o="SolvedTransformations.fbx"`

Optimize given bone transformations and skinning weights from input meshes sequence

`call #dembones -i="Bone_All.fbx" -a="Bone_Anim.abc" --bindUpdate=1 -o="Optimized.fbx"`

Only solve helper #bone using demLock attribute of the joints

`call #dembones -i="Bone_Helpers.fbx" -a="Bone_Anim.abc" --bindUpdate=1 -o="SolvedHelpers.fbx"`

Partially solve skinning weights using per-vertex color attribute of the mesh

`call #dembones -i="Bone_PartiallySkinned.fbx" -a="Bone_Anim.abc" --nTransIters=0 -o="SolvedPartialWeights.fbx"`

### Open questions:

I align each track to a second? one after the others?

How do I find the tracks again?

## Positive Consequences <!-- optional -->

- Better performance
- Able to compose animations

## Negative Consequences <!-- optional -->

- More #bone

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
```
