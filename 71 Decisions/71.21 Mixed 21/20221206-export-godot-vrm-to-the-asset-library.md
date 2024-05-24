# Proposed: Prepare godot-vrm for asset library publishing

- Status: accepted <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,lyuma,fire,
- Tags: V-Sekai,

## Context and Problem Statement

<!-- Describe the problem or limitation you are having in your project. You may want to articulate the problem in the form of a question. -->

We want to prepare godot-vrm for asset library publishing, but the format for publishing is incompatible with development.

## Describe the proposed option and how it helps to overcome the problem or limitation

We convert godot-vrm into a format suitable for development and then write a converter to a format ready for the asset library.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

How to migrate to Godot-VRM to submodule format?

The thing Lyuma got blocked on is that VRM contains two addons: VRM and Godot-MToon-Shader

Revive the Godot-MToon-Shader repository which Lyuma previously archived.

But Lyuma will change it so it's only the submodule (contents of the addons folder) and then Lyuma will make the Godot VRM addon (submodule) a branch in the godot-vrm repository

Then we'll make a script to sync the changes to/from the godot-vrm example project which we submit to asset lib

Writing this up for Fire, since we talked about the issue with addons/vrm being duplicated in multiple projects since Godot Asset Library doesn't allow submodules / raw addons folders.

Did some unarchiving and renames so that https://github.com/V-Sekai/Godot-MToon-Shader gets the top google slot

1. Make sure the godot-vrm code is synced up with other repositories where it was duplicated.
2. Make a mtoon addon repository with a copy of the Godot-MToon-Shader code.
3. Make a branch in godot-vrm with ONLY the 4.0 vrm addon, usable as a submodule.
4. Change v-sekai-game and other similar projects to use Godot-MToon-Shader and vrm as a submodules
5. Write a script to sync up repository contents from one to the other.

### is_empty()

Is there a functional difference between `if not stringvar.is_empty():` vs `if stringvar != "":` x != "" is a bit shorter and easier to type, but I noticed some recommendation to use is_empty().

## Positive Consequences <!-- improvement of quality attribute satisfaction, follow-up decisions required -->

We don't have duplicate godot-vrm copies and the copies stay in sync.

## Negative Consequences <!-- compromising quality attribute, follow-up decisions required -->

Asset library copy is different than development.

## Option graveyard:

- Option: The status quo. <!-- List the proposed options no longer open for consideration. -->
- Rejection Reason: This solves nothing. We have duplicate development versions. <!-- List the reasons for the rejection: (the bad traits) -->

## If this enhancement will not be used often, can it be worked around with a few lines of script?

This is a repository layout and not code.

## Is there a reason why this should be core and done by us?

We own the godot-vrm and the mtoon repositories.

## References

- [V-Sekai](https://v-sekai.org/)

## License of the contribution

```
MIT License

Copyright (c) 2018-2022 SaracenOne
Copyright (c) 2019-2022 K. S. Ernest (iFire) Lee (fire)
Copyright (c) 2020-2022 Lyuma
Copyright (c) 2020-2022 MMMaellon
Copyright (c) 2022 V-Sekai Contributors

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
```
