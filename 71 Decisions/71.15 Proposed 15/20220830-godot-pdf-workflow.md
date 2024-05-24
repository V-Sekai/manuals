# Proposed: Provide pdf reading

### Context and Problem Statement

Provide a workflow to read pdf documents.

### Describe the proposed option and how it helps to overcome the problem or limitation

We want to provide pdf reading without implementing a pdf reader.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Convert pdf into a series of svgs (raster + vector)
1. Put svgs in a folder
1. Clean with https://github.com/RazrFalcon/svgcleaner
1. Use godot engine 4's thorvg

### Positive Consequences

Can import artwork.

### Negative Consequences

Not a real pdf viewer.

### Option graveyard

Do nothing.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

A few lines of cli.

### Is there a reason why this should be core and done by us?

Wanted to write the workflow down.

### References

- [V-Sekai](https://v-sekai.org/)

### License of the contribution

Copyright (c) 2022 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
