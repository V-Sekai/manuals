# Accepted: To create omi chan rig a \#256FES

- Status: accepted <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,jeana,fire,
- Tags: V-Sekai,

## Context and Problem Statement

Formed an OMI Chan working group.

To create omi chan rig a \#256FES.

## Describe the proposed option and how it helps to overcome the problem or limitation

Use my know-how to rig a #256fes character.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

- ![image](./attachments/154479017-731c36f2-b52b-45dc-9078-4de260c6c91f.png)

Given mesh model that is unrigged and #256FES

### Noted problems.

1. Forearm is out of proportion
2. Head is out of proportion
3. No base color

### Creation notes

- https://github.com/saturday06/VRM_Addon_for_Blender/releases/tag/2_1_9
- Create a vrm default armature template in Blender 3.0.1
- Scale equally the entire mesh to be 1.7m (female Caucasian female on the tall statistical range)
- Enable equal scaling of bones button
- Scale the arms and the neck/head
- Use autorig https://blendermarket.com/products/voxel-heat-diffuse-skinning
- Use xatlas to generate uv
- https://github.com/V-Sekai/V-Sekai-Blender-tools/tree/main/addons/blender_xatlas
- https://github.com/V-Sekai/V-Sekai-Blender-tools/tree/main/addons/Principled-Baker-master to bake uvs
- https://github.com/V-Sekai/V-Sekai-Blender-tools/tree/main/addons/corrective_smooth_baker
- Export to vrm
- Add VRM mtoon material
- Make VRM mtoon material use black as shaded color.
- Test in 3tene and cluster.mu
- https://3d.kalidoface.com/ (first photo)

## Positive Consequences <!-- optional -->

- Written steps to vrm rigging #fes256

## Negative Consequences <!-- optional -->

- Might be still too hard.

## Option graveyard: <!-- same as above -->

- Option: current situation.
- Rejection Reason: No changes.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

This uses several plugins of code.

## Is there a reason why this should be core and done by us?

I know how to do it!

## References <!-- optional and numbers of links can vary -->

- Released under the same license as Jeana's work. CC-BY or CC0 if in doubt.
- [SK_omi_chan_oni_chan.zip](https://github.com/omigroup/omi-chan/files/8088502/SK_omi_chan_oni_chan.zip)

## Derivative License

Copyright (c) 2022 V-Sekai contributors.

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
