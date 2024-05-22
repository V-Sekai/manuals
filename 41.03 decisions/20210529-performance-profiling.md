# Proposed: Performance profile the game with AMDuProf

## Context and Problem Statement

How do we profile the game?

The context is for example importing files are slow (they're not the biggest bottleneck anymore). What tools and techniques can we use?

## Describe the proposed option and how it helps to overcome the problem or limitation

Use AMDuProf

## Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

AMDuProf shows the slower functions and there's also a callgraph and flamegraph feature.

A callgraph is similar to a stacktrace.

A flamegraph is a way of visualizing performance. The first link is an ACM article describing the design.

The workflow is for each item start from the top and go down.

## Positive Consequences <!-- optional -->

- Works for both Intel and AMD
- Works on Windows 10 and Linux

## Negative Consequences <!-- optional -->

- Less usable than superluminal
- Slower than superluminal

## Option graveyard: same as above

- Option: superluminal
- Rejection reason:
  - Not free

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not appliable.

## Is there a reason why this should be core and done by us?

Not in code. This is documenting a technique.

## References <!-- optional -->

- https://queue.acm.org/detail.cfm?id=2927301
- https://superluminal.eu/
- https://developer.amd.com/amd-uprof
- http://www.brendangregg.com/flamegraphs.html

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
