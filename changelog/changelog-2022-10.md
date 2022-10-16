# Changelog 2022-10

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

@Malek  Awesome for being around 🐱. Contributed to designs and cheering us when we succeed. Fixed the issue with the ci/cd with the recurse submodules. Too much to list!

@gamethecupdog Helped us figured out some problems with AMD vr and V-sekai. We debugged the AMD VR launch issues and talked about fixing the vignette settings in the ui https://github.com/V-Sekai/V-Sekai.github.io/issues/378

@meowses For supporting us and watching our presentation.

@Kosyne For starting a topic about onboarding and our short term and long term planning.

@! [P1-D3] Samuel Martin @Mr_Squarepeg  Thanks for hanging out on Sunday, we chatted about V-Sekai and played a bit of ZeroK. 

## 2020-10-15

iFire (he, him) — Today at 12:34
Turned off the mesh mirror mode for avatars because of playtesting confusion. 

Lyuma — Today at 13:04
makes sense. at some point we can add a mirror, and we need a map aligned at the right place, or a script added to maps which define where the ""mirrors"" are (there can be more than one since it's just duplicating meshes which is cool)

iFire (he, him) — Today at 14:47
I added https://github.com/TokageItLab/realtime_retarget to V-Sekai's godot engine c++ modules. Please test, @トカゲ is looking for feedback. 

tefusion's gdextension addon https://github.com/tefusion/godot-subdiv is now published. https://godotengine.org/asset-library/asset/1488

fire reorganized the development documentation site.
