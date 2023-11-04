# Proposed: Describe a Godot Engine pr verification workflow

### Context and Problem Statement

A Godot Engine pr needs to be verified for correctness and style.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

This workflows describes how fire checks pull requests.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

1. Start Windows 10.
1. Install scoop
1. `scoop install visual-studio-code llvm-mingw`
1. Install python and scons
1. `git checkout https://github.com/V-Sekai/v-sekai-pr-template --recurse-submodules`
1. Open repository in Visual Studio Code.
1. Switch godot engine branch
1. Press launch in Visual Studio Code
1. Verify fixes.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

This is a workflow.

### Positive Consequences

More robust techniques for doing prs.

### Negative Consequences

Paperwork and complexity.

### Is there a reason why this should be core and done by us?

This is a core procedure.

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
