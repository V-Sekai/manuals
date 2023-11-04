# Accepted: OIT in Godot Engine

### Context and Problem Statement

Render hair well.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

Use "Shortcut" or "PPLL" to render OIT transparency.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

> Shortcut takes 4 passes but is faster.

TressFX technology uses order independent transparency.

> (OIT). There are two variants. One uses a per-pixel linked list (PPLL), and the other uses a multi-pass
> method referred to as Shortcut.

> The main decision to make is whether to use per-pixel linked lists or Shortcut. The Shortcut method can
> be generally faster, with an easier memory bound, but at the expense of some quality. The TressFX
> 4.1/Unreal 4.22 Engine integration uses Shortcut (although the shader for PPLL may still be present in
> the branch, it was/is unmodified/untested/unused). TressFX 4.1/Cauldron uses both Shortcut and PPLL.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Avatars are a strength of V-Sekai.

### Positive Consequences

_No response_

### Negative Consequences

Code complexity.

### Is there a reason why this should be core and done by us?

Reduz isn't interested in OIT.

### References

- https://raw.githubusercontent.com/GPUOpen-Effects/TressFX/master/doc/TressFX4xDeveloperGuide.pdf
- https://github.com/GPUOpen-Effects/TressFX/blob/master/src/Shaders/TressFXPPLL.hlsl
- https://github.com/GPUOpen-Effects/TressFX/blob/master/src/Shaders/TressFXShortCut.hlsl
- https://blog.icare3d.org/2010/07/opengl-40-abuffer-v20-linked-lists-of.html
- https://github.com/SaschaWillems/Vulkan/blob/master/examples/oit/oit.cpp
-

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
