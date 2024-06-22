# Proposed: Minimum Specification V-Sekai Hardware

### Context and Problem Statement

Tags: hardware proxy, minimum spec,

We want to create standardized performance numbers for V-Sekai.

Performance targets:

1. Achieve 16.67 milliseconds (60 FPS) frame time on a 4k screen for V-Sekai in desktop flat mode.
2. The 16.67 milliseconds target should be achieved smoothly and not as the average.
3. From the Steam Hardware Survey (July 2021) accessed on August 2021, there are 25% of gamers who have a maximum of 8 gigabytes of ram.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

We want to create a standard test platform for V-Sekai to get performance data.

1.  Canonical test/reference hardware by platform (desktop-flat, desktop-vr, mobile-vr)
2.  Canonical content by platform (avatar+map): both low end (Mozilla Hubs + static avatars) and mid-end and high-end

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

Specify a minimum specification.

1. Single Board Computers UDOO BOLT GEAR - kit based on UDOOBOLT V8 with metallic case.

This is the computer we think is the most similar to a Valve Steamdeck.

2. Solid State Drives - SSD 1 TB
3. Solid State Drive - OS Drive (Size TBD)
4. Memory Modules "NCNR" 260pin SODIMM ECC DDR4 2666 16GB1.2v 1Gx8(0-85)
   We use ECC to during testing avoid "Godbolts" from the universe.
5. Windows 10 operating system
   Windows 10 is what typical PCVR uses.
6. Popos! 20.04 operating system
   Popos! Linux is similar to the Arch Linux that Steam Deck uses.

Use a scripted fly through demo.

1. https://github.com/Calinou/godot-cmvalley
2. https://github.com/TokageItLab/3d-platform-test-for-godot4
3. An animated camera can be exported from Blender.
4. Record performance data in .res format and also json.
5. Record OBS videos of the fly through with frametime and stats.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not coding related.

### Positive Consequences

_No response_

### Negative Consequences

1. Only represent AMD APUs.
2. Hardware is fairly new. Only a few years old.
3. Steam Deck uses quad-channel DDR5 instead of dual-channel DDR4, and also DLNA2 instead of Vega graphics

### Is there a reason why this should be core and done by us?

As a platform holder, it would be our responsibility to understand the limits of the platform.

### References

- UDOO Bolt
  [datasheet_udoo_bolt_gear-1947342.pdf](https://github.com/V-Sekai/v-sekai-proposals/files/6958673/datasheet_udoo_bolt_gear-1947342.pdf)
- [Mouser Electronics Canada V-Sekai Platform.pdf](https://github.com/V-Sekai/v-sekai-proposals/files/6958676/Mouser.Electronics.Canada.V-Sekai.Platform.pdf)
- https://developer.oculus.com/documentation/unity/unity-perf/

### Derivative License

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
