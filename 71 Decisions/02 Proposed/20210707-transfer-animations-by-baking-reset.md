# Proposed: Transfer #animation by baking reset

## Context and Problem Statement

Given two #animation `.glb`s in gltf, you cannot transfer the #animation between the same character in different files in some cases.

Fixes: https://github.com/godotengine/godot/issues/50212

We are NOT retargeting between different rigs in the RESET baker stage.

We are NOT defining how to generate the RESET #animation in this proposal.

#### Problem extended

We want to transfer #animation between exact scenes with the same matching RESET animation.

We can import unlimited motion capture #animation to use if we can enforce a certain T-POSE and ensure the rigs are corresponding.

Multiple different specifications exist on bone rolls on specific bone names. If the skeleton matches one of them, we can use that set of rig animations.

## Describe the proposed option and how it helps to overcome the problem or limitation

We bake the RESET #animation and then set it to identity so that rigs with corresponding RESET #animation can have their #animation transferred.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

#### Bake RESET #animation

1. Import a new scene with animations.
1. A RESET #animation from the imported scene will automatically be baked to the skeleton.
1. Key all RESET #animation frames to identity.

#### Bake a specific frame

1. Pick an #animation frame time and click
2. First bake any existing RESET animation.
3. Bake the RESET #animation
4. Ensure that a RESET #animation track exists and is set to identity transform

#### RESET #animation Generators

1. Make a tool that can take a human character and make it T-pose (A-pose?) and then save it to the RESET animation.
1. Enforce bone rolls on the rig and then save it to the RESET animation.
1. Root motion centering (move to the origin) tool and then save it as the RESET animation.
1. Filter the RESET axes when baking per animation.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

This is a confusing problem and hard to explain. So the code to solve it is non-obvious to propose and non-trivial to discover.

## Is there a reason why this should be core and done by us?

#animation are a core feature of Godot Engine.

## References <!-- optional -->

- Bone roll parent to child baking. https://github.com/V-Sekai/godot/commit/99a9f79e25f7760cb5a0990e67545d78e9dd0423
- Implementation:
  https://github.com/godot-extended-libraries/godot-fire/tree/feature/bake-reset-anim
- Reference bone roll spec. https://tokage.info/lab/?id=5
- Use the entire surface of the mesh to match to the SMPL rig. (Siggraph 2021) https://github.com/PeizhuoLi/neural-blend-shapes/issues
- Guessing "Blender edit" https://github.com/KhronosGroup/glTF-Blender-IO/pull/941

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
