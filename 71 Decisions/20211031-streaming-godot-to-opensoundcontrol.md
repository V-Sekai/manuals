# Take a streaming godot game and streaming the VRM to OpenSoundControl

### Context and Problem Statement

Streaming to Godot OSC to jsons.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

Stream the animation player because we have no way to stream Godot as a autonomous program.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

1. Take animation player
2. Put it in a animation tree
3. Animation node streams motions to osc
4. Take osc to node.js

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not trivial

### Positive Consequences

_No response_

### Negative Consequences

_No response_

### Is there a reason why this should be core and done by us?

It's rare to know how to dothis.

### References

- to node js https://github.com/colinbdclark/osc.js js
- https://github.com/infosia/vmc2bvh

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
