# Proposal: Stream a character from a webcam to the vmc protocol

- Status: proposed <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

## Context and Problem Statement

Stream a character from a webcam to the vmc protocol so it can be played in any VMC reciever.

## Describe the proposed option and how it helps to overcome the problem or limitation

Kalidokit packages mediapipe, opengl acceleration and tensorflow.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Use kalidokit and have it output the vmc protocol using osc.js.

## Positive Consequences <!-- optional -->

- Output OSC.js which Godot Engine can use.

## Negative Consequences <!-- optional -->

- Uses the nodejs runtimes which is added complexity.

## Option graveyard: <!-- same as above -->

- Option: <!-- [List the proposed options no longer open for consideration.] -->
- Rejection Reason: <!-- [List the reasons for the rejection: (the Bad traits)] -->

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a few lines of script.

## Is there a reason why this should be core and done by us?

I joined the dots.

## References <!-- optional and numbers of links can vary -->

- https://github.com/infosia/vmc2bvh
- https://github.com/colinbdclark/osc.js/

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
