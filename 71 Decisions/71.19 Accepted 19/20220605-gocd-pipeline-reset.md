# Accepted: To avoid git submodule but recreate the gocd pipelines

### Describe the status of the issue.

- [x] proposed
- [x] draft
- [ ] rejected
- [x] accepted
- [ ] deprecated
- [ ] superseded by

### List the deciders of the issue.

V-Sekai,fire,

### Describe the tags of the issue.

V-Sekai,gocd,

### Context and Problem Statement

Gocd git submodule failed to load.

### Describe the proposed option and how it helps to overcome the problem or limitation

Reset the gocd pipeline by renaming the initial pipeline name.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. clone https://github.com/V-Sekai/groups-gocd-pipelines
2. Modify https://github.com/V-Sekai/groups-gocd-pipelines/blob/master/src/godot_4_x.jsonnet
3. godot_template_groups_editor to have increment the revision number.
4. ./bin/generate
5. commit to git

### Positive Consequences

Able to build again.

### Negative Consequences

Increases cache size.

### Option graveyard

_No response_

### If this enhancement will not be used often, can it be worked around with a few lines of script?

It is a few lines of script.

### Is there a reason why this should be core and done by us?

It's our release process.

### References

- [V-Sekai](https://v-sekai.org/)

### License of the contribution

Copyright (c) 2022 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
