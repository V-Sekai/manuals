# Proposed: Spoke to V-Sekai

### Context and Problem Statement

We desire portable content.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

Create an art workflow.

```nomnoml
[Blender] -> [OMI.glb]
[OMI.glb] -> [Godot Engine Packed Scene]
```

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

Create an OMI Blender addon under W3C license.

Create glTF2 extension pull request for Godot Engine.

**Flow**:

1. OMI importer to Blender
2. Exporter of extended blender with OMI extensions to extended gltf
3. Support for OMI extended gltf in godot with definition of in-memory format for OMI extensions in Godot Engine for bidirectionality.

**Expected output**:

1. Export/Import as OMI format in Blender
2. Support OMI GLB in Godot

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Interlapping projects are complicated.

### Positive Consequences

_No response_

### Negative Consequences

_No response_

### Is there a reason why this should be core and done by us?

Can collaborate with Mozilla hubs team and OMI.

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
