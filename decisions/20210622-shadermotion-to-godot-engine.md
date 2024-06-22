# Proposed: Convert #shadermotion to be played in Godot Engine

## Context and Problem Statement

We want a better way of importing animations to Godot Engine. Unfortunately, there is no standard way to exchange motion from other places to Godot and work interchangeably on different characters.

## Describe the proposed option and how it helps to overcome the problem or limitation

#shadermotion files in video format provide an excellent way to record motion. However, we want the ability to play it back in Godot Engine onto a VRM character.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Install youtube-dl and ffmpeg with scoop

`scoop install youtube-dl ffmpeg`

Convert #shadermotion videos into WebM VP9.

`youtube-dl https://www.youtube.com/playlist?list=PLmwqDOin_Zt4WCMWqoK6SdHlg0C_WeCP6 --audio-format wav --format webm --recode-video webm`

Crop the preview frame of the video for the left and the right side.

```
ffmpeg -i "NNNN.webm" "-filter:v" "crop=in_w*(1-0.925):ih:0:0,fps=60,scale=24x180:flags=lanczos+full_chroma_inp" shader_motion_character_00.webm
ffmpeg -i "NNNN.webm" "-filter:v" "crop=in_w*(1-0.925):in_h:in_w:in_h,fps=60,scale=24x180:flags=lanczos+full_chroma_inp" shader_motion_character_0
```

## How to build Godot video decoder

Build godot-cpp

```
godot.windows.opt.tools.64.exe --gdnative-generate-json-api api.json
godot.windows.opt.tools.64.exe --gdnative-generate-json-builtin-api builtin_api.json
# copy to godot-cpp
# compile godot-cpp
# Use instructions for 4
# https://github.com/GodotVR/godot_openvr/pull/123#issue-658898644
scons p=windows target=release -j16 target=release generate_bindings=yes
# compile gdnative-video-decoder
scons platform=win64 target=release -j16
```

## Positive Consequences <!-- optional -->

- Can interchange motions

## Negative Consequences <!-- optional -->

- Complexity

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not trivial.

## Is there a reason why this should be core and done by us?

The ability to give motion to 3d characters or NPCS is important.

The ability to interchange pose is important.

## References <!-- optional -->

- https://motion.chibifire.com
- https://github.com/ytdl-org/youtube-dl
- https://github.com/FFmpeg/FFmpeg

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
