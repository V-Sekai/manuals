# Proposed: Bake blend shape to skeleton animation

### Context and Problem Statement

Blend shapes are expensive and hard to interpolate

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

Want to bake blend shapes to animations.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

`./DemBones -i="Face_Geom.fbx" -a="Face_Anim.abc" --bindUpdate=2 -o="Decomposition_20_grouped_face.fbx" --nnz=8 -b=256`

Note that the corresponding fbx is 0.01 scale while the alembic is in meters.

The RMSE = 0.00433256 must be this low.

Do not pass #dembones if the RMSE is like 3.5.

Next step is to integrate an existing 3d skeleton.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a few lines of script.

### Positive Consequences

_No response_

### Negative Consequences

_No response_

### Is there a reason why this should be core and done by us?

We control the default skeleton controller.

### References

_No response_

### Derivative License

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
