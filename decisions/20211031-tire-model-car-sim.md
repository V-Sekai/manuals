# Proposed: Tire model car sim

### Context and Problem Statement

Create a vehicle simulation

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

Use physx's tire simulation. While citing their mit license.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

Use math model.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

One does not simply make a vehicle sim.

### Positive Consequences

_No response_

### Negative Consequences

_No response_

### Is there a reason why this should be core and done by us?

Maybe out of scope? But I have an approach.

### References

> #########################################
> Tire Modeling
> #########################################
>
> The default tire model employed by PhysX vehicles is discussed in Appendix H of the CarSimEd documentation:
>
>     http://www.eggert.highpeakpress.com/ME485/Docs/CarSimEd.pdf
>
> PhysX vehicles allow any tire model to be simulated by specifying a tire shader, as discussed in :ref:`Tire Shaders`. A tire model commonly used in engineering simulation is the Pacejka tire model:
>
>     http://phors.locost7.info/phors21.htm
>
>     http://phors.locost7.info/phors22.htm

- https://github.com/NVIDIAGameWorks/PhysX/blob/ae80dede0546d652040ae6260a810e53e20a06fa/physx/documentation/PhysXGuide/_sources/Manual/Vehicles.txt#L2058
- https://web.archive.org/web/20180712141747/http://www.eggert.highpeakpress.com/ME485/Docs/CarSimEd.pdf

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
