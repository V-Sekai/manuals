# Rejected: Network the Ubisoft Mixer server

- Status: rejected <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,

## Context and Problem Statement

We want to use the Ubisoft Mixer project more easily.

The Ubisoft mixer project is also a good way to share Godot Engine scenes.

The problem is the mixer project is in Python and doesn't have file sync.

## Describe the proposed option and how it helps to overcome the problem or limitation

My proposed solution is to write a elixir server that syncs the Blender file and the file share.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Extract Mixer broadcaster code
2. Write an Elixir udp based broadcaster with webrtc
3. Write an Elixir file sync (SECURITY WARNING)

## Positive Consequences <!-- optional -->

- Easier to host mixer.

## Negative Consequences <!-- optional -->

- The software may be a vector for security attacks.

## Option graveyard: <!-- same as above -->

- Option: Use V-Sekai as a networking sync.
- Rejection Reason: Not ready yet and someone is working on it.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a few lines of script.

## Is there a reason why this should be core and done by us?

I know how to do this and no one else is doing it.

## References <!-- optional and numbers of links can vary -->

- https://github.com/ubisoft/mixer/issues

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
