# Proposed: Import Minecraft worlds to Godot Engine

### Context and Problem Statement

We want more content in Godot Engine.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

We want to import Minecraft worlds as .Vox and as standard gltf.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

Save the minecraft world.

Use `amulet_map_editor`.

1. git clone https://github.com/Amulet-Team/Amulet-Map-Editor.git
1. cd Amulet-Map-Editor
1. python3 -m pip install amulet-map-editor
1. python3 -m amulet_map_editor
1. Use wxpython 4.x
1. export world to .schematic
1. use FileToVox
1. Use fire's vox module for godot 4.x

Use Schematic and Mineways and export to .obj.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a small number of lines.

### Positive Consequences

More content!

### Negative Consequences

Workflow changes.

### Is there a reason why this should be core and done by us?

Can remix work by Zylann and others.

### References

![image](attachments/127966670-ac99697d-708c-4c79-9f1b-fb570b1fa052.png)
[nova_world.zip](https://github.com/V-Sekai/v-sekai-proposals/files/6921440/nova_world.zip)

### Derivative License

Copyright (c) 2020-2021 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject
[nova_world.zip](https://github.com/V-Sekai/v-sekai-proposals/files/6921426/nova_world.zip)
to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
