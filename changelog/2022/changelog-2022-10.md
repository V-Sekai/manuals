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
