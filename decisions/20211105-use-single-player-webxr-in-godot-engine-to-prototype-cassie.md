# Draft: Use single player WebXR in Godot Engine to prototype CASSIE.

- Status: draft <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire
- Tags: V-Sekai,

## Context and Problem Statement

Want to prototype a drawing environment in vr for the web.

Unable to commit much resources.

## Describe the proposed option and how it helps to overcome the problem or limitation

Use a fork of Godot 3.4 for WebXR that includes delauney tetrahedralization processing.

**Postponed until Godot Engine master has WebXR**

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Extract geometry class from Godot Engine 4.0 to 3.4.

## Positive Consequences <!-- optional -->

- Stable

## Negative Consequences <!-- optional -->

- Slower than Godot Engine master

## Option graveyard: <!-- same as above -->

- Option: Godot master as of 2021-11-05
- Rejection Reason: Godot Master doesn't have WebXR on this date.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

This is a project proposal.

## Is there a reason why this should be core and done by us?

I found an approach to do it.

## References <!-- optional -->

- https://godotengine.org/news

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
