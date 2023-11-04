# Proposed: Integrate with blender

- Status: proposed <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

## Context and Problem Statement

Blend files are too difficult to write an importer for in Godot Engine.

## Describe the proposed option and how it helps to overcome the problem or limitation

Make an addon that calls Blender directly and tell it to export to the proper place.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Enable addon
1. Open blend
1. See the blend as a Godot Engine scene.

## Positive Consequences <!-- optional -->

- Integrates Blender into Godot Engine workflows.
- Downside of Blender version updates can be fixed by the use of the V-Sekai exporter tool.

## Negative Consequences <!-- optional -->

- Requires blender to export cicd.
- Changes to the Blender version causes the project to desync.

## Option graveyard: <!-- same as above -->

- Option: <!-- [List the proposed options no longer open for consideration.] -->
- Rejection Reason: <!-- [List the reasons for the rejection: (the Bad traits)] -->

## If this enhancement will not be used often, can it be worked around with a few lines of script?

- This is a script but not a few lines.

## Is there a reason why this should be core and done by us?

I know how to do this and others don't.

## References <!-- optional -->

- https://www.blender.org/
- https://github.com/V-Sekai/godot-blender

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
