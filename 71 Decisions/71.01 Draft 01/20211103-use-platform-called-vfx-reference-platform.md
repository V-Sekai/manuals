# Draft: Use a standard reference #platform called VFX Reference #platform

- Status: draft <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,

## Context and Problem Statement

> [A standard reference platform's purpose is to] minimise incompatibilities between different software packages, ease the support burden for Linux-based pipelines and encourage further adoption of Linux by software vendors.

Here are some problems:

- We want to keep a consistent server configuration setup.
- We want creators to have a consistent work environment.

## Describe the proposed option and how it helps to overcome the problem or limitation

> The VFX Reference #platform is a set of tool and library versions to be used as a common target #platform for building software for the VFX industry. Its purpose is to minimise incompatibilities between different software packages, ease the support burden for Linux-based pipelines and encourage further adoption of Linux by software vendors. The Reference #platform is updated annually by a group of software vendors in collaboration with the Visual Effects Society Technology Committee.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Find candidate centos-like platforms.
1. A candidate is Rocky Linux.

## Positive Consequences <!-- optional -->

- The problems with #platform are informed by decisions of others in the industry.

## Negative Consequences <!-- optional -->

- Going outside the #platform is risky.

## Option graveyard: <!-- same as above -->

- Option: Use Rocky Linux directly
- Rejection Reason: No collaboration

- Option: Use Fedora 35 directly
- Rejection Reason: Unclear support lifetime.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

This is a devops proposal, not a coding proposal.

## Is there a reason why this should be core and done by us?

We do have to choose a reference #platform even if we don't think about it to upload to docker.

## References <!-- optional -->

- https://vfxplatform.com/
- https://hub.docker.com/u/aswf
- https://hub.docker.com/r/aswf/ci-base
- https://github.com/AcademySoftwareFoundation/aswf-docker/tree/master/ci-base

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
