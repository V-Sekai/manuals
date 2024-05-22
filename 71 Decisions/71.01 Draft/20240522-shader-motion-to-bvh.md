# Draft: shadermotion to BVH

## Context and Problem Statement

Lacking characters motions to work with.

Transfering motions across platforms via video.

## Describe the proposed option and how it helps to overcome the problem or limitation

#shadermotion allows us to transfer motion for other VR platforms into a standard motion format.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

ShaderMotion: "OBS" etc. motion captured video from VRChat.

![Floss.mp4](https://i.imgur.com/TgBM5lN.png)

Example: [Floss.mp4](https://gitlab.com/lox9973/ShaderMotion/-/raw/master/Example/Motion/Floss.mp4)

(repo: [lox9973/ShaderMotion](https://gitlab.com/lox9973/ShaderMotion))

**ShaderMotion => BVH**

- input: mpeg4
- output: bvh

#### Requirements

- .mp4 #shadermotion video
- [shadermotion-to-bvh by guillefix](https://github.com/guillefix/shadermotion-to-bvh/releases)
  - download shadermotion-to-bvh.zip from XXX github repo releases
  - unpack to a folder

#### Conversion Process

Run `shadermotion2.exe --video "yourvideo.mp4"`

KEEP THE WINDOW FOCUSED

Once completed, look for `yourvideo.bvh`

### Acknowledgements

**Thanks to humbletim for being the scribe**

**Thanks to lyuma for being test pilot flying these steps**

## Positive Consequences <!-- optional -->

- Able to have motion for characters

## Negative Consequences <!-- optional -->

- Many steps

## If this enhancement will not be used often, can it be worked around with a few lines of script?

#shadermotion is a novel solution to capturing motion from VRChat.

## Is there a reason why this should be core and done by us?

This document describes how to integrate #shadermotion with us.

## References <!-- optional -->

- https://chibifire.com/shader_motion/
- https://hackmd.io/EmOAt375S8KFqaNdPDJCXQ

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
