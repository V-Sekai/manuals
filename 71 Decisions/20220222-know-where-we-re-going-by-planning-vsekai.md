# Supeseded: Planning V-Sekai on 2022-02-21 Superseded

- Status: superseded <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,ifire,lyuma,
- Tags: V-Sekai,

## Context and Problem Statement

Superseded - See https://github.com/V-Sekai/V-Sekai/blob/master/decisions/20220224-v-sekai-version-two-plan.md

Know where we're going by describing what we want.

## Describe the proposed option and how it helps to overcome the problem or limitation

Proposed mission and a list of tasks.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

### To further the development of Godot and open source tech

- Godot Engine pull requests.

### To build a tech stack and service for interactive multiplayer VR games.

1. One gitlab repo with source assets? (sky celebration and sponza).

- The ability to upload maps and avatars standalone via a SDK (set of submodules?) https://github.com/V-Sekai/vsk_sdk.
  - Being able to enter a vsk map ∀ maps (mvp = 1 map).
  - Enter a vsk map with an entity in it (upload sky celebration OR upload sponza with one beachball).
- VSK_map source asset repositories
- Lyuma will make a new github repo V-Sekai/vrm_submodule - we need a script for updating all submodules to the latest on a given branch.
- VSK_map source asset repositories
- I think vsk_sdk should only be submodules, no assets.
- We can git rebase -i to remove the binary assets from it.
- git merge to install the vsk_sdk into another project (such as gitlab). we need to look if git subtree supports .gitmodules and we can use it if it does.
- make vsk_sdk the head for all of the sdk related submodules. do our development there and commit submodules regularly.
- In groups project, pretend we delete all submodules in vsk_sdk. Then git merge vsk_sdk/main to bring in the submodules from that repo.
- Every time we update vsk_sdk, do a git merge into groups and our source asset repo with sponza etc.
- VSK_map source asset repositories
  - Don't save .scn assets in git.
    - no GLB.
    - blend files ~10MB ok. > 100MB let's either use GitLab LFS or something else.
    - Evaluate https://dvc.org/

2. Being able to have our group of people join and communicate. (godot speech).

- Porting C++ was discussed as a way forward to make it easier to debug

4. VR support (openxr).
5. Interacting with objects in desktop mode is important so that we can test easier.
6. Interacting with objects in vr.
7. Scripting (wasgo).
8. Network server to support 1000.

## Positive Consequences <!-- optional -->

Gain clarity of mission.

## Negative Consequences <!-- optional -->

- The cost of overhead.

## Option graveyard: <!-- same as above -->

- Option: Status quo. <!-- [List the proposed options no longer open for consideration.] -->
- Rejection Reason: Complete the wrong thing. <!-- [List the reasons for the rejection: (the Bad traits)] -->

## If this enhancement will not be used often, can it be worked around with a few lines of script?

This is a planning document.

## Is there a reason why this should be core and done by us?

We know what we want to do.

## References <!-- optional and numbers of links can vary -->

- None

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
