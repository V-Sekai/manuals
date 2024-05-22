# Accepted: Create an open metaverse by working on V-Sekai

- Status: accepted <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,lyuma,fire,MrMetaverse,
- Tags: V-Sekai,

## Context and Problem Statement

V-Sekai is a VR virtual world platform.

## Describe the proposed option and how it helps to overcome the problem or limitation

Build V-Sekai.

- Spatialized audio and VOIP support
- A custom networking stack
- A security-focused sandboxed scripting environment backed by WASM
- Customisable servers with their own individual game rules
- Dependable for important presentations

As a 3d world builder, I want to upload a world to invite my friends to experience (Voice Communication, Reliability, Networked) with me.

1. Uninstalled: give a URL with a copy of the game.
2. Installed: url to uro that sends an url
   1. v-sekai://v-sekai.org/lyuma/home?key=asjdfhgdtg#68.4,1.4,0.34
   1. Register windows protocol handler

As an explorer, I want to browse a selection of places to visit.

As a user, I want to pick up objects to hand them to my friend.

As a user, I want to bring my identity (my avatar) to interact with in V-Sekai.

As a developer, I need V-Sekai to understand my needs to have an excellent developer-user experience.

As a creative, I want to edit my V-Sekai virtual environment to better suit my requirements and preferences.

As a user developer, I want to remix V-Sekai to better suit my requirements and preferences.

As a person, I want to work with a group that shares my values.

As a person, I want to survive long enough to build V-Sekai.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Register protocol.

```
def register_protocol(proto, command):
    import winreg
    key = winreg.CreateKey(winreg.HKEY_CLASSES_ROOT, rf"{proto}")
    winreg.SetValueEx(key, "", 0, winreg.REG_SZ, f"URL:{proto} protocol")
    winreg.SetValueEx(key, "URL Protocol", 0, winreg.REG_SZ, "")
    key = winreg.CreateKey(winreg.HKEY_CLASSES_ROOT, rf"{proto}\shell\open\command")
    winreg.SetValueEx(key, "", 0, winreg.REG_SZ, command)
```

## Positive Consequences <!-- optional -->

- It matters that we are here to create V-Sekai. I imagine a future where all the virtual world platforms are closed, with no space to create and remix.
- We are making V-Sekai to serve people who want to create and be in the metaverse.

## Negative Consequences <!-- optional -->

- We are promoting Native VRM support so arbitrary 3d models aren't on the golden path as of 2021-12-16.
- We choose native code on the devices, so we can't use the interoperability of the web as of 2021-12-16.
- We choose Godot Engine which is an open source game engine to own our dependencies, so it is hard to use off the shelf commercial technologies.
- We prefer de-facto or open standards for the most reach, so we may not be able to get the exact solution we want without effort.

## Option graveyard: <!-- same as above -->

- Option: Use dominant VR platforms.
- Rejection Reason: At this moment. there is an opportunity to have a coalition of open metaverse.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

V-Sekai needs a strategy and not code.

## Is there a reason why this should be core and done by us?

We are V-Sekai and only we can be who we want to be.

## References <!-- optional and numbers of links can vary -->

- https://www.fortressofdoors.com/so-you-want-to-compete-with-roblox/

### Minimum Requirements to not Fail Right Away

> You should consider the following as mere table stakes:
> High-quality multiplayer support for user #creation out of the box
> High-performance servers with excellent reliability
> Powerful, user-friendly, and joyful creation tools

#### Other References

- https://martinfowler.com/bliki/MonolithFirst.html
- https://en.wikipedia.org/wiki/John_Gall_(author)
- https://github.com/ubisoft/mixer Has Blender and Unity Support 2021-12-14. It needs to be debugged for Blender 3.0.

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
