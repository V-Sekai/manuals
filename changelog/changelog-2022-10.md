# V-Sekai Changelog - 2022-10

## 2022-10-01

> Lyuma — 01/10/2022
> I have pushed internal and external resource whitelisting at the ResrouceLoader (ResourceFormatLoaderBinary) level as a Godot engine patch.

Here's an example of what gets printed when the above script with OS.alert() attempts to be loaded

    ERROR: user://asset_cache/81dd12d03686
    0a08faba06a1b47a3a29.scn:Resource of unrecognized type in file: GDScript.
       at: load (core/io/resource_format_binary.cpp:789)
    ERROR: Failed loading resource: user://asset_cache/81dd12d036860a08faba06a1b47a3a29.scn. Make sure resources have been imported by opening the project in the editor at least once.

Note that I was forced to rebase to the latest build which includes the new build system (target=editor)
most of the code I changed is in the private gitlab repo. once things stabilize and we get the build system up and running again, next step is to publish the remainder of the code on github

> groups-4.x (and staging) were updated to latest. I attempted to update GoCD, but it's a bit of a yolo merge, since a few pieces all had to be updated at once due to new scons target=editor argument
> we need to follow https://ci.v-sekai.cloud/ (log in as guest) and test the release builds

> export builds are being created again with the new scons naming scheme. They seem to work on linux (steam deck) at least. Don't have access to a windows machine right now

## 2022-10-06

https://github.com/v-sekai/v-sekai-game is released as fully opensource.

## 2022-10-10

> iFire (he, him) — Today at 16:33
> https://github.com/V-Sekai/v-sekai-game/pull/5 added caching to reduce doing nothing builds from 2 hours to 10 minutes ish

New contributors this week:

@Malek Awesome for being around 🐱. Contributed to designs and cheering us when we succeed. Fixed the issue with the ci/cd with the recurse submodules. Too much to list!

@gamethecupdog Helped us figured out some problems with AMD vr and V-sekai. We debugged the AMD VR launch issues and talked about fixing the vignette settings in the ui https://github.com/V-Sekai/V-Sekai.github.io/issues/378

@meowses For supporting us and watching our presentation.

@Kosyne For starting a topic about onboarding and our short term and long term planning.

@! [P1-D3] Samuel Martin @Mr_Squarepeg Thanks for hanging out on Sunday, we chatted about V-Sekai and played a bit of ZeroK.

## 2020-10-15

iFire (he, him) — Today at 12:34
Turned off the mesh mirror mode for avatars because of playtesting confusion.

Lyuma — Today at 13:04
makes sense. at some point we can add a mirror, and we need a map aligned at the right place, or a script added to maps which define where the ""mirrors"" are (there can be more than one since it's just duplicating meshes which is cool)

iFire (he, him) — Today at 14:47
I added https://github.com/TokageItLab/realtime_retarget to V-Sekai's godot engine c++ modules. Please test, @トカゲ is looking for feedback.

tefusion's gdextension addon https://github.com/tefusion/godot-subdiv is now published. https://godotengine.org/asset-library/asset/1488

iFire reorganized the development documentation site.

iFire is working on a bullet train kinetic novel https://github.com/V-Sekai-fire/INK_bullet_train world.

## 2022-10-17

Updated this website to remove the left sidebar. Added headers to decisions and the changelog.

## 2022-10-18

Godot Engine proposal meeting rejected setting float=64 as default. However official 64 bit builds have interest.

## 2022-10-20

Early morning discussion with guillefix, lyuma and fire.

Feature requests from the community:

- desktop capture
- avatar ik
- quest support
- 3d node graph system
- in-game content creation
- wasm for game scripting

## 2022-10-22

Meeting between betalars, fire, lyuma, jeana and others about usability in 3d games, convention application and V-Sekai.

## 2022-10-22 Humble contributions and places to start? ^^

### Premise: 

- betalars is working on making Chaos Computer Club more accessible.
- There has been development to create an online-platform for [Chaos Communication Congress](https://en.wikipedia.org/wiki/Chaos_Communication_Congress) using Godot
- It is planned to be deployed in browser, limiting it to Godot 3 for now
- Realistically, the Congress Experience software will not be production-ready before Godot4, so starting with Godot 3 only sets us up for tech-debt and also makes cooperation with V-sekai impossible, so it was the wrong decision originally and is now being reverted.
- Based on limited contributors and also limited time, a Prototype in Godot 3 has been scrapped and betalars reached out to the V-Sekai team for some collaboration and humble contributions

### What are constraints?

- Milas needs to write a masters thesis on accessibility-driven Game-Development
- At the end of December of each year, CCC holds a big conference, this year it is going to be a decentralised bunch of small-scale events due to the pandemic
- iFire wants to be able to present meaningful progress by march 2023

### Benefits of joining online-chaos-experience development efforts into v-sekai

- Pretty much all goals align ...
  - Make it FOSS
  - Allow for player interaction and expression in an online space
  - Make 3D-level building accessible for players
  - Use Godot Engine
  - Encourage for tinkering and hacking (of the white-hat variety of course)
- ... except for the fact, that online-chaos was developed for desktop browsers and not VR-Devices
- V-Sekai is engineering-driven and lacks in UX and Design, which betalars has more knowledge in, so there is potential for synergy
- If this collaboration is successful, it would introduce the project into a big community of developers, some of which will be happy to contribute further code

### Risks

- **Getting distracted by shiny things**
- There's currently limited interest in the chaos community at large and Betalars is still pretty junior in experience despite leading the effort of building an online-world

### Talking Points in the Meeting

- Accessibility
  - V-Sekai is interested in this subject, there's an argument to be had, that XR has great potential for people with disabilities
    - Not having to leave their flat for social interaction is a plus
    - Being able to choose to be stealth with a bodily disability
    - More intuitive controls with tracking
    - Hand tracking can be used for signing.
  - Even for for visually impaired people, there are options to interact
  - Buttons
    - Rumble
    - Sound Feedback
    - There's a lot of potential for work and research here, that would also benefit the godot-community by add-on development
  - ... and maybe by politely asking for some vital accessibility features to be pushed upstream
  - Concrete Projects are:
    - Subtitles
    - Introducing a Layer for alternate text / screen-reader Label3D
- Level Generation
  - Currently there is a lot of interest in the community on this subject, as [NeosVR](https://en.wikipedia.org/wiki/NeosVR), a project with great level-building UX, has been frozen
  - Godot has a solid 3D-Level generator, that can be used by "power-users" to create 3D-Scenes
  - Expanding its feature set could benefit the Godot Engine Community at large
  - There's the need for intuitive tools for the average user to create cool stuff in 3D
    - Voxel-Editors are a great first step, as they are an intuitive tool for blocking out 3D-shapes
    - Voxel Editors can be extended with
    - "Smart Voxel objects", that can generate stuff like staircases, roofs, fences etc, that are a pain to block out within the voxel grid (and expanding the voxel grid)
      - 3D-Generators, that based on the existing mesh can build plants for instance
      - Convenient Prop-Placement
- Level Generation References
  - [EverQuest Next Landmark - Detail building tools](https://www.youtube.com/watch?v=dd9C90G0lQo)
  - [Cloud Gardens](https://www.youtube.com/watch?v=6gHmvxduSqI), a relaxing level building game
  - [Dreams](https://www.youtube.com/watch?v=yukNnKii6xg)
  - [crocotile3d.com](https://crocotile3d.com/)
  - Minecraft
- AI-Assisted Level Generation will probably also be a thing soon
- Designing fun player-interaction Concepts
  - Betalars would like to work on it, but it is hard
- Making pretty Characters
  - Betalars has been working on a sims-style character generator
  - Current state can be found on [gitlab](https://gitlab.com/divocrew/design/-/tree/chavatars)
    - Hopefully will also benefit Godot Engine community
- Developing a Tablet-Mode for V-Sekai
  - There has been effort put into creating a Non-VR interaction mode
  - Currently it is pretty janky and not thought through
  - Betalars would like to improve this
- Fire's V-Sekai priorities:
  1. a better setting to be in
  2. communications between at least two people
  3. better character motion via constraints, spring bones, and animations
  4. better character models (betalars has a character creation system that they already developed as possible collaboration points)

### Other helpful resources:

[github.com/omigroup/ux-research](https://github.com/omigroup/ux-research)

This is the new repo for the recently formed UX Research group in OMI. Check back weekly for updates on this repo and how to get involved. - GitHub - omigroup/ux-research: This is a new working group for [OMIGroup](https://discord.gg/92fXNYXf)

## 2022-10-25

Mmmaellon’s work requires him to build an XR app using AWS Services. He wants to use that opportunity to make something that allows players to build maps collaboratively.

## 2022-10-28

ASTC work for mobile gpu textures work.
