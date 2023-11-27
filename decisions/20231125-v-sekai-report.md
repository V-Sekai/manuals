# Superseded: V-Sekai 2023-11-25 Report

## Metadata

- **Status:** Superseded by `20231126-v-sekai-report.md`
- **Deciders:** V-Sekai, fire, PLYSHKA🐧, SaracenOne
- **Tags:** V-Sekai, Linux, Bug Fix, Godot Engine, User Support

## What is V-Sekai?

V-Sekai, pronounced vee-say-kai, is a collective of developers passionate about creating open-source VR technology. We aim to contribute to social VR and provide alternatives to proprietary engines like Unity and Unreal.

Despite challenges, we've grown into a global community committed to advancing open standards and open-source software for virtual worlds.

Our strategy focuses on providing comprehensive documentation and support to help users understand the platform better. We're also committed to investigating and resolving issues like the reported Linux build problem.

## Background

Over the past month, our team has been deeply involved in the Godot Engine conference in Munich, Germany. Our primary responsibility during this period has been to prepare for the upcoming launch of Godot Engine 4.2, to which we are contributing as part of the animation and 3D pipeline teams.

PLYSHKA🐧 asked on our Discord about the current state of V-Sekai:

> PLYSHKA🐧> I'm fairly new to this platform overall, can someone explain in what state its currently in? What can it do and what can't? I couldn't launch Linux build properly (black screen), and when started from terminal it just opened Godot editor (it was game binary), so not sure what's happening there, maybe I don't understand something

## Problem Statement

What state is V-Sekai in, and what can it do?

## Strategy

### Critical Issues

1. **Desktop Mode Loading:** V-Sekai is currently unable to load in desktop mode.

2. **The purple screen on the desktop:** The black screen issue seems related to our current problem of [Issue #341](https://github.com/V-Sekai/v-sekai-game/issues/341)

3. **Multiplayer Voice Chat:** The multiplayer voice chat feature in V-Sekai is broken.

### Major Issues

3. **Menu Editing:** In V-Sekai, menus can't be edited in VR. They can only be edited on the desktop before entering a game.
4. **Default Avatar:** V-Sekai does not have a default avatar. This causes confusion as players load in with an error avatar.
5. **Default Avatar IK:** V-Sekai's default ik is currently twisted incorrectly.

### Successes

5. **Avatar Uploading and Downloading**:** V-Sekai can upload from the editor and, download avatars, and load them into the game at runtime.
5. **World Uploading and Downloading**:** V-Sekai can upload from the editor and, download worlds, and load them into the game at runtime.
6. **VR Mode Loading:** V-Sekai can successfully load in VR mode.

### Opportunities

7. **Contributions:** V-Sekai is actively looking for more contributions.

## Timeline for the Next Weeks

Fire is set to merge ufbx, freeing the industry-standard FBX file format from the Autodesk ecosystem for V-Sekai. However, due to limited funding, we won't be able to implement the upcoming 3D format standard USDZ in next months.

| Week Starting       | Task                                                    |
| ------------------- | ------------------------------------------------------- |
| November 26th, 2023 | Investigate and resolve "purple screen" bug in V-Sekai. |
| December 3rd, 2023  | Initiate the merging of godot-ufbx in Godot Engine 4.3. |

## Pros and Cons

**Pros:**

Addressing these challenges can enhance the user experience, boost platform adoption, and collect crucial feedback for subsequent development.

**Cons:**

There may be underlying issues causing the Linux build problem that could take significant time and resources to resolve.

## Alternative Approach

An alternative approach could have been to ignore the user's query and continue with the current development roadmap. However, this would not foster a supportive community or encourage user engagement.

## Infrequent Use Case

While most users may not encounter the same issue as PLYSHKA🐧, addressing even infrequent use cases is essential to ensure a robust and user-friendly platform.

## Responsibility

Addressing this issue falls within our core responsibilities as the V-Sekai development team.

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine

AI Aria assisted with this article.
