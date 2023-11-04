# Proposed: Use specular vec3 from gltf to show multicoloured metals

### Desc

ribe the status of the issue.

rejected

### List the deciders of the issue.

V-Sekai,fire,

### Describe the tags of the issue.

V-Sekai,

### Context and Problem Statement

We want to be able to use Specular from gltf and Specular from spec gloss, but previous solutions did not compose with the principled pbr roughness metallness model.

### Describe the proposed option and how it helps to overcome the problem or limitation

Implement specular from gltf.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

???

### Positive Consequences

We can import spec gloss for compatibility.

Demos show multicolored transparency.

### Negative Consequences

- More complexity

### Option graveyard

- Option: Add spec gloss extension
- Does not compose with roughness metalness.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a few lines of code.

### Is there a reason why this should be core and done by us?

Changing the standard material 3d is a core decision.

### References

- [V-Sekai](https://v-sekai.org/)

### License of the contribution

Copyright (c) 2022 V-Sekai contributors. Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
