# Accepted: Create an upstream pull request for all non-V-Sekai related patches

- Status: accepted <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,lyuma,
- Tags: V-Sekai,

## Context and Problem Statement

We use a gitassembler script, but the list may diverge from Godot Engine master.

These critical changes need to be synced with Godot Engine organization.

## Describe the proposed option and how it helps to overcome the problem or limitation

Non-V-Sekai related and upstreamable godot patches should be filed as upstream PRs.

This makes Godot Engine core and V-Sekai better because changes are synchronized.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Here is an example `.gitassembly`:

```
stage groups-web-4.x remotes/v-sekai-godot/master
merge groups-web-4.x remotes/lyuma/gltf_shapes_8bones
merge groups-web-4.x remotes/v-sekai-godot/ninja-ccache
```

Need to check every line in the list using a comparison link:

- https://github.com/godotengine/godot/compare/master...lyuma:gltf_shapes_8bones
- https://github.com/godotengine/godot/compare/master...v-sekai-godot:ninja-ccache

Make a corresponding pull request on https://github.com/godotengine/godot/pulls if there isn't one.

If not possible, or non-upstreamable (for example, V-Sekai related), leave a comment in the `.gitassembly` why one cannot create a Godot Engine organization pull request.

## Positive Consequences <!-- optional -->

- synced
- easier maintainance

## Negative Consequences <!-- optional -->

- need to pay cost of bureaucracy

## Option graveyard: <!-- same as above -->

- Option: do nothing
- Rejection Reason: V-Sekai and Godot Engine organization diverge

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a few lines of code.

## Is there a reason why this should be core and done by us?

Godot Engine code is core.

## References <!-- optional -->

- https://github.com/godotengine/godot
- https://github.com/v-sekai/godot
- https://www.thregr.org/~wavexx/software/git-assembler/

## Derivative License

Copyright (c) 2021 V-Sekai contributors.

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
