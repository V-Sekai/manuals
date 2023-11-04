# Proposed: Bake a #materialx into a custom Godot StandardMaterial3D

### Context and Problem Statement

There is not many procedural material Makers.

The two the come to mind is Godot's Material Maker and Adobe's Substance Designer.

More options would be helpful.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

Create a #materialx to Godot Standard Material tool.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

Make a GDscript tool that takes the #materialx bake tool I already made and bake it to a standard material 3D in Godot Engine.

Craft a GDScript that uses the command line tool and converts `mtlx` to a standard material 3d.

> `apt install -y libglew-dev`

> `cmake -GNinja .. -DMATERIALX_BUILD_BAKER=ON`

> `.\bin\MaterialXBake.exe --material .\resources\Materials\Examples\glTFPBR\gltf_pbr_boombox.mtlx --bakeFilename ../demo.mtlx --bakeWidth 8192 --bakeHeight 8192`

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Eh. Not simple.

### Positive Consequences

Expansion into a web tool.

### Negative Consequences

_No response_

### Is there a reason why this should be core and done by us?

I found an approach and it can be done.

### References

- https://github.com/fire/MaterialX/tree/gltf
- https://godotengine.org/showcase/material-maker
- https://en.wikipedia.org/wiki/Procedural_texture

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
