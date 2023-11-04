# Proposed: Benchmark #animation playback

### Context and Problem Statement

How slow is #animation playback in a simulated player situation.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

Need to see where we're at.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

100, 500, 1'000, 50'000 avatars animating with 30fps and #animation compression on vs off.

Randomize clips: idle, run, jump, walk (left, right, back, front)

Put them into a 2d blend space and feed a random velocity.

Start the #animation at different random offsets.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Core code.

### Positive Consequences

- Can investigate compressed #animation player as a compute shader. The current architecture of the skinning and blend shapes #animation is like vertex #animation fed by buffers, but the keyframe playback is also problematic

### Negative Consequences

_No response_

### Is there a reason why this should be core and done by us?

I care about this more than other core contributors.

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
