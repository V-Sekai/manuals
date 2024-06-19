# Accepted: Take a list of 3D points that form a vaguely closed boundary in space and triangulate in Godot Engine

- Status: accepted <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,em-yu
- Tags: V-Sekai,

## Context and Problem Statement

CASSIE is a method for Curve And Surface Sketching in Immersive Environments.

A core part of the CASSIE algorithm is to take a list of 3D points that form a vaguely closed boundary in space and triangulate.

## Describe the proposed option and how it helps to overcome the problem or limitation

This CASSIE triangulate operation needs to be done in Godot Engine so it can be use in V-Sekai.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Implement "An Algorithm for Triangulating Multiple 3D Polygons"
1. Use Godot's delaunay tetrahedralize https://github.com/godotengine/godot/blob/96d7bc62af25b85b8b9cc091eeea1e7a784ba624/core/math/delaunay_3d.h#L145 `static Vector<OutputSimplex> tetrahedralize(const Vector<Vector3> &p_points)`
1. Emilie Yu described a method for smoothing meshes.

Libigl should be best for smoothing while pinning the boundaries. I see they have a solver that can take fixed boundary constraints https://libigl.github.io/tutorial/#quadratic-energy-minimization so that could allow you to pin the boundaries. So instead of this line it would be something like

```c++
igl::min_quad_with_fixed_data mqwf;
igl::min_quad_with_fixed_precompute(S, [flat vector of indices of boundary vertices size=(3 * N_boundary)], [zero matrix], true, mqwf);
igl::min_quad_with_fixed_solve(mqwf, M * U, [flat vector of boundary vertices positions size=(3 * N_boundary)], [zero vector], Z);
```

and the `vector Z is a (3 * N) flat vector` of the solution vertices (equivalent to the "U" of the other example).

1. ??? Add remeshing.
1. Expose a function to Godot Engine called triangulate boundaries.

## Positive Consequences <!-- optional -->

- Jeana demonstrated the feel of CASSIE on 2021-11-05 to draw a cat.

![20211105 CASSIE Jeana](./attachments/20211105-CASSIE-Jeana.jpg)

## Negative Consequences <!-- optional -->

- Adding complexity and maybe time space explosions because of mesh processing.
- May cause stuttering in VR.

## Option graveyard: <!-- same as above -->

- Option: Integrate drawing like OpenBrush. https://github.com/icosa-gallery/open-brush
- Rejection Reason: The feel is not the same.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a trivial gdscript and has performance gaps.

## Is there a reason why this should be core and done by us?

It is cool and I know how to approach implementing CASSIE in Godot Engine.

## References <!-- optional -->

- https://www.cse.wustl.edu/~taoju/zoum/projects/TriMultPoly
- https://em-yu.github.io/
- https://ns.inria.fr/d3/CASSIE
- https://libigl.github.io/
- https://github.com/godotengine/
- https://www.blender.org/

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
