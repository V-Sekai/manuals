# Proposed: We have too many branches on V-Sekai/godot.

### Context and Problem Statement

We have too many branches on V-Sekai/godot.

A lot of branches are already merged, some are godot 3.x, some were for old alphas.

### Describe the proposed option and how it helps to overcome the problem or limitation

Create a procedure for deleting branches.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

We should be able to delete merged branches after we remove it from merge script or move the branches to an archive repo with all the PRs.

\<lyuma> It's definitely ok to delete when godot merges . you can still get the commit hash by `git log | grep v-sekai/branchname` in godotengine/godot.

### Positive Consequences

Less confusion.

### Negative Consequences

Accidentally deleting a used branch.

### Option graveyard

Do nothing.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not applicable.

### Is there a reason why this should be core and done by us?

We own the V-Sekai/godot repository.

### References

- [V-Sekai](https://v-sekai.org/)

### License of the contribution

Copyright (c) 2022 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
