# Proposed: Extended asset library packages in addition to the upstream asset library

### Context and Problem Statement

Have a way to deploy custom asset libs via the godot engine asset library ui

### Describe the proposed option and how it helps to overcome the problem or limitation

We propose to use the V-Sekai uro server to provide an asset library url to Godot Engine.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Implement

1. rest passthrough https://github.com/godotengine/godot-asset-library/blob/master/API.md
2. account based package bundles (does not include the original package, only the metadata)

### Positive Consequences

We can have our own asset archives.

### Negative Consequences

May compromise security.

### Option graveyard

Upload to the asset library directly.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a few lines of script.

### Is there a reason why this should be core and done by us?

We maintain uro.

### References

- [V-Sekai](https://v-sekai.org/)

### License of the contribution

Copyright (c) 2022 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
