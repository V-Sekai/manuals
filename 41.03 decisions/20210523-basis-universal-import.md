# Accepted: Support more flexible texture import via Basis Universal in Godot Engine

## Context and Problem Statement

Support more flexible texture import via Basis Universal in Godot Engine. Adding Basis Universal allows more flexibility in the import.
-->

## Considered Options

- Basis Universal

## Decision Outcome

Chosen option: Basis Universal

### Positive Consequences

- More flexibility between mobile and desktop

### Negative Consequences <!-- optional -->

- Dramatically slower import
- Texture limits?

## Pros and Cons of the Options <!-- optional -->

### Basis Universal

Add basis universal to Godot Engine via glTF

- Good, because Basis Universal isn't fully supported in the import pipeline
- Good, because it bridges Web, Desktop and Mobile
- Bad, because makes importing slower

## References <!-- optional -->

- https://github.com/KhronosGroup/glTF/blob/master/extensions/2.0/Khronos/KHR_texture_basisu/README.md

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
