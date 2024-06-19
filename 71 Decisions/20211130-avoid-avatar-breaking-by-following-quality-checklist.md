# Accepted: Avoid avatar breaking by following quality checklist

- Status: accepted <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,

## Context and Problem Statement

Avoid avatar breaking which harmful to the person using the avatar.

## Describe the proposed option and how it helps to overcome the problem or limitation

Create a checklist to ensure quality.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

This is defined for a VRM character.

- Add a root bone
- Age height normalization to 1.59m for an Asian adult female.
- Auto generate spring bones via https://fujisunflower.booth.pm/items/2087178
- Check eyes
- Check Jaws
- Adjust spring bones limits
- Check transparent glasses etc.
- Run mesh mush at 80 degrees twist on all vertices
- Check culling locations
- Match shade and base color in MTOON1
- The relative angle between the Hips and the Thigh should something that works for inverse kinematics.
- Check manifolds for skin breaking

Move the feet to the origin of the scene

- Cursor to world origin
- Change to origin
- Move to below feet
- Move object origin to origin

Check if environment lighting breaks the avatar

- Change sky temperature to the brightest
- test 0.00001 light intensity
- test 16 light intensity

How to make a Portrait of the head photo?

- E96E66 background color
- 16 light intensity and camera set to realistic focal length for a portrait makes the photo look good.

## Positive Consequences <!-- optional -->

- Less avatar breaking.

## Negative Consequences <!-- optional -->

- Work

## Option graveyard: <!-- same as above -->

- Option: Do nothing.
- Rejection Reason: This is unacceptable to the people who use the avatars.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

This can be automated in the future.

## Is there a reason why this should be core and done by us?

This is a guideline and we are in the area.

## References <!-- optional and numbers of links can vary -->

- [VRM - 3D Avatar File Format for VR](https://vrm.dev/en/) <!-- example: Refined by [xxx](yyyymmdd-xxx.md) -->

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
