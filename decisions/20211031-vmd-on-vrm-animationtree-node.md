# Draft: VMD on VRM AnimationTree Node

### Context and Problem Statement

Eirexe made a VMD player based on Lox's work.

This new ability means we now have a viable way to load VMD motions and use them as a VRM motion player.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

We want to make an AnimationTree node to drive Miku Miku VMD motion and add other procedural animation features to blend motion on the VRM Avatar.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

However, we need to make some changes to the AnimationTree UI editor to make the changes possible. We want an expanded AnimationTree to customize nodes, mainly when Godot Engine adds procedural animation features.

Saracen wants to make sure that the AnimationTree gets the features needed so any custom nodes can be quickly prototyped via scripted extensions if needed. Doing it in purely c++ can limit scripting.

iFire's "hard coding" definition tests if the node is different from writing the node from a composition of existing nodes. A VMD animation tree node would be "hard coding."

There are currently some limitations with the AnimationTree, which makes the animation tree somewhat challenging to extend with custom nodes via scripting. However, the good news is, we do not think it would take much to make a VMD AnimationTree node work. The AnimationTree work is primarily a UI limitation and a small one at that.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

NOT A FEW LINES OF CODE!

### Positive Consequences

_No response_

### Negative Consequences

_No response_

### Is there a reason why this should be core and done by us?

We currently know how to do this, if we don't who else will?

### References

- https://github.com/EIRTeam/VMDMotionGD
- https://github.com/V-Sekai/godot-vrm
- https://en.wikipedia.org/wiki/MikuMikuDance

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
