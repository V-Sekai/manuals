# Proposed: Better Godot Engine integration with Blender with gltf extensions

### Context and Problem Statement

Integration between blender and Godot Engine could be better.

### Describe the proposed option and how it helps to overcome the problem or limitation

The import of Godot Shaders to Godot Engine can help developers and developer artists workflows.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Write a design for embed the Godot shader and material information in the exported GLTF as an extension, then parse it in the Godot importer

### Positive Consequences

Easier to use Godot Engine

### Negative Consequences

The Godot Engine shader definition may change

### Option graveyard

Status quo.

Can we do nothing?

### If this enhancement will not be used often, can it be worked around with a few lines of script?

This is probably a folder of python scripts.

### Is there a reason why this should be core and done by us?

We manage the Godot Engine import experience.

### References

- [V-Sekai](https://v-sekai.org/)

### License of the contribution

Copyright (c) 2022-present K. S. Ernest (iFire) Lee
Copyright (c) 2022-present V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
