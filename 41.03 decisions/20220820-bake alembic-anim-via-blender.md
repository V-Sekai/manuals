# Proposed: Bake alembic imports by running blender script.

### Context and Problem Statement

Want to bake alembic imports to gltf blend shapes.

### Describe the proposed option and how it helps to overcome the problem or limitation

We run a python script in Blender to bake alembic inputs to gltf2.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

```python
# MIT LICENSE
# Authored by iFire#6518 and alexfreyre#1663
# This code ONLY apply to a mesh and simulations with ONLY the same vertex number

import bpy

#Converts a MeshCache or Cloth modifiers to ShapeKeys
frame = bpy.context.scene.frame_start
for frame in range(bpy.context.scene.frame_end + 1):
    bpy.context.scene.frame_current = frame

    # For alembic files converted to MDD and loaded as MeshCache.
    bpy.ops.object.modifier_apply_as_shapekey(keep_modifier=True, modifier="MeshCache")

    # For cloth simulations inside blender using a Cloth modifier.
    #bpy.ops.object.modifier_apply_as_shapekey(keep_modifier=True, modifier="Cloth")

# Loop through shapekeys and add as keyframe per frame.
# https://blender.stackexchange.com/q/149045/87258
frame = bpy.context.scene.frame_start
for frame in range(bpy.context.scene.frame_end + 1):
    bpy.context.scene.frame_current = frame

    for shapekey in bpy.data.shape_keys:
        for i, keyblock in enumerate(shapekey.key_blocks):
            if keyblock.name != "Basis":
                curr = i - 1
                if curr != frame:
                    keyblock.value = 0
                    keyblock.keyframe_insert("value", frame=frame)
                else:
                    keyblock.value = 1
                    keyblock.keyframe_insert("value", frame=frame)

# bpy.ops.object.modifier_remove(modifier="MeshCache")
# bpy.ops.object.modifier_remove(modifier="Cloth")
```

Do not use the pc2 vertex cache format because of mesh accuracy loss.

### Positive Consequences

Can convert alembic to gltf2 for better interoperability.

### Negative Consequences

Blend shapes are big.

### Option graveyard

Option: Don't convert.

This loses the animation.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a few lines of script.

### Is there a reason why this should be core and done by us?

We already made a solution.

### References

- [V-Sekai](https://v-sekai.org/)

### License of the contribution

Copyright (c) 2022 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
