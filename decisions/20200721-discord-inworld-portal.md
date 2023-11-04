# Draft: View the worlds and interact with people in VR without being in VR via a Discord Inward Portal

## Context and Problem Statement

I want to see the worlds and interact with people in VR, without being in VR myself.

## Describe the proposed option and how it helps to overcome the problem or limitation

A Discord voice/video call bot would allow players within the virtual world and outside to interact with each other.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

This would be a bot client that connects to at least one server shard, and joins a Discord voice call, using WebRTC APIs to communicate voice and video data from Godot into discord.

## Positive Consequences <!-- optional -->

- Growing engagement with Groups

## Negative Consequences <!-- optional -->

- Requires Discord

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Players can stream using OBS or discord screen sharing, but this requires players to do it, and only provides uni-directional communication.

## Is there a reason why this should be core and done by us?

It should be a standalone project based on Groups, but not core. The WebRTC depdendency, if needed, would make integration difficult.

## References <!-- optional -->

- https://discord.com/

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
