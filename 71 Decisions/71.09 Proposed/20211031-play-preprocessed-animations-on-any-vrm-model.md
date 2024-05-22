# Superseded: Play preprocessed #animation on any VRM model

Superseded

This is now a Godot Engine 4.0 core feature. https://godotengine.org/article/animation-retargeting-in-godot-4-0/

### Context and Problem Statement

Given any vrm and a carefully made animation, we should be able to play back the animation.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

Need to work out a flow for making #animation play back on vrm.

**This is dependency for a VRM based character controller that can play existing #animation clips and blend them**

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

???

Collaborate with Saracen on a bone roll corrected VRM skeleton.

Convert #animation to VRM named bones.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not trivial.

### Positive Consequences

_No response_

### Negative Consequences

_No response_

### Is there a reason why this should be core and done by us?

We control the default #animation tree, therefore we need to do this.

### References

- Proposal on baking blend shapes to linear skin blending.
- Useful for tokage's character movement demo. https://github.com/TokageItLab/3d-platform-test-for-godot4
- Free #animation -- https://github.com/V-Sekai/shadermotion-video-to-anims

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
