# Proposed: Solve Mocap By Connecting Mediapipe to Blender

## Context and Problem Statement

Want to animate a blender file with mediapipe

## Describe the proposed option and how it helps to overcome the problem or limitation

By writing a c++ executable on Linux, we can connect Mediapipe to Blender.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Create a wrapper for https://github.com/infosia/vmc2bvh/tree/master/osc
2. Install Blender addon https://github.com/maybites/blender.NodeOSC
3. Convert python script to c++
4. Make c++ buildable by bazel
5. Build executables on Github Actions

#### Design loop

1. https://github.com/CLIUtils/CLI11 for command line parsing
2. https://github.com/infosia/vmc2bvh/blob/master/code/Vmc2Bvh.cpp for example code
3. For each process send osc to node osc (Blender).
4. Create a structure for the messages

## If this enhancement will not be used often, can it be worked around with a few lines of script?

ML and armature work is hard

## Is there a reason why this should be core and done by us?

[Is there a reason why this should be core and done by us?]

## References <!-- optional -->

From Kendrick

- [media_pipe_demo.zip](https://github.com/V-Sekai/v-sekai-proposals/files/6972400/media_pipe_demo.zip)
- https://github.com/V-Sekai/game-tools-V-Sekai

## Derivative License

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
