# Proposed: Profile using perf

### Describe the status of the issue.

- [x] proposed
- [ ] draft
- [ ] rejected
- [ ] accepted
- [ ] deprecated
- [ ] superseded by

### List the deciders of the issue.

V-Sekai,fire,

### Describe the tags of the issue.

V-Sekai,

### Context and Problem Statement

Want a workflow to profile Godot Groups.

### Describe the proposed option and how it helps to overcome the problem or limitation

Use perf and hotspot.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

```
sudo apt-get install linux-tools-common linux-tools-generic linux-tools-`uname -r`
perf record -o perf.data --call-graph dwarf --aio --sample-cpu ./godot/bin/godot.linuxbsd.opt.tools.64.llvm --path groups hotspot perf.data
```

![image](attachments/168098166-3392395d-eab6-488e-bba2-1088cbd82c6d.png)

### Positive Consequences

Can better find hotspots.

### Negative Consequences

Currently Linux only.

### Option graveyard

- Superluminal is Windows only.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not Godot Engine code.

### Is there a reason why this should be core and done by us?

We need to be aware of performance.

### References

- [V-Sekai](https://v-sekai.org/)

### License of the contribution

Copyright (c) 2022 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
