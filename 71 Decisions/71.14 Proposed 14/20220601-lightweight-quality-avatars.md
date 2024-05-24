# Proposed: Lightweight quality avatars

### Describe the status of the issue.

- [x] proposed
- [x] draft
- [ ] rejected
- [ ] accepted
- [ ] deprecated
- [ ] superseded by

### List the deciders of the issue.

V-Sekai,fire,Yin Chien YEAP,

### Describe the tags of the issue.

V-Sekai,avatars,

### Context and Problem Statement

Yin works a lot in webxr, and noticed in the avatar ecosystem (VRchat, secondlife, etc.) most of these avatars are too high quality.

What tools have we come across that have enabled lightweight avatars?

### Describe the proposed option and how it helps to overcome the problem or limitation

To try to make things work for webxr, yin is interested in lightweight avatars in as many ways as possible.
exploring avatars that are as parametric as possible.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Find ways to define volumes as parametric, and textures based on vectors instead of bitmaps.

Frame time: Using a mobile chip gives less headroom re: polys that can be dropped. Download sizes. How long does loading take.

Yin doesn't love blender, more focused on web based tools fit for mobile processors and reasonable download speeds.

Yin has been looking into procedural materials as a lightweight mechanism.

There are two systems, skeleton system and blendshapes. Conversion of blend shapes to skeletons is possible.

Can also describe a quad subdivision workflow.

1. quad based subdivision of detail `https://github.com/godotengine/godot-proposals/issues/784`
2. procedural materials
3. bake blendshapes to skeletons
4. Fire is researching CSG based extraction combined with sliders. https://kacperkan.github.io/ucsgnet/ https://github.com/eliemichel/DagAmendment

### Positive Consequences

Works on the most widely accessible HMDs.

### Negative Consequences

_No response_

### Option graveyard

_No response_

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Heavyweight avatars is a systematic problem.

### Is there a reason why this should be core and done by us?

Avatars is our special area.

### References

- [V-Sekai](https://v-sekai.org/)

### License of the contribution

Copyright (c) 2022 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
