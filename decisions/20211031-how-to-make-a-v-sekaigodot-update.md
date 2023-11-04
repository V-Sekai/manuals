# Proposed: How to make a V-Sekai/godot update?

### Context and Problem Statement

Write down how we make branch updates.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

Need to write down how to do updates.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

On the Github UI, go to the mater branch and update from Godot Engine master.

```
git clone https://github.com/V-Sekai/groups_merge_script
cd groups_merge_script
sh update_repos.sh
```

```
git clone https://github.com/V-Sekai/groups-workspace-fire -b 4.x --single-branch --recurse-submodules
cd groups-workspace-fire
# open folder in visual studio code
# use update repositories visual studio code command
```

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not code, but procedure.

### Positive Consequences

Lower bus factor.

### Negative Consequences

_No response_

### Is there a reason why this should be core and done by us?

This a V-Sekai organization task.

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
