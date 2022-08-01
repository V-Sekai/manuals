- 2021-04-30 15:42:02Z fire: Proposal design of MaterialX Principled BSDF to Blender Principled BSDF to Blender surface. The Material Blender Addon output is to textures of the FBX / GLTF2 format. We can later output glTFs with the MaterialX as an glTF2 extension.
- 2021-04-30 06:47:12Z fire: Lyuma — MaterialX in glTF would allow for a generalization of "KHR_materials_variants" extension - in other words, MaterialX would allow for character or object customization to textures baked at load time
- 2021-04-30 06:06:58Z fire: Made a proposal for GLTF2 to include MaterialX in three stages. A stage 0 extension where it replaces png and a stage 1 extension that replaces gltf variants for parameters, stage 2 would be adding arbitrary graphs as parameters.
- 2021-04-30 06:06:21Z fire: Made a prototype that exposes HTC Facial tracker to Godot Engine as a GDNative plugin for 3.x. https://github.com/V-Sekai/godot-vive-pro-eye
- 2021-04-29 17:36:43Z fire: "**Design Approved; Needs Proposal from Juan**: Play scheduled notes/metronome https://gist.github.com/fire/b9ed7853e7be24ab1d5355ef01f46bf1 (https://youtu.be/JEIb0jXcDPA?list=PLQfcaH6N9nlotFGh4WLbGIFf2ijwzA9W1&t=63 example use case; replicate this ability (to have time stamps on which we play an audio clip))
  **Postponed Discussion**: Modular audio system (like JACK) godot#35613
  **Interest**: Integrate interactive music PR godot#32769
  **Interest**: Discuss audio stream graph
  **Approved**: Onboarding for newcomers to the audio side of Godot development
  **Interest**: Godot Audio Graph:
  - better reuse of mixing/effect chains
  - better interaction with areas 2d/3d (currently we have just Areas linked to a bus)
    **Interest**: Pure-Data Audio Graph"
- 2021-04-29 01:56:06Z fire: Arguing in OMI about materialx, usdz and wasm
- 2021-04-28 23:31:24Z lyuma: and the fix is restart the editor, or you have to go and edit every script in the project and undo
- 2021-04-28 23:31:13Z lyuma: we need to report a bug when something fails to parse on project load, it says something like can't load this script because it's not loaded
- 2021-04-28 19:52:25Z fire: Lyuma will make a const bool variable in vrm import to not create the .res because it is big and affects git storage.
- 2021-04-28 18:24:26Z fire: Did some spring cleaning of my https://github.com/V-Sekai/godot-hop-spin-dance. Removed VRM MToon and organized some files. This is my animation player application.
- 2021-04-28 16:41:15Z fire: Looked at server documentation for an hour, earlier.
- 2021-04-28 12:22:24Z lyuma: Filed issue https://github.com/godotengine/godot/issues/48265 - hopefully it only happens for .obj files. I can avoid those for now.
- 2021-04-28 11:21:45Z fire: Investigate https://github.com/mit-plv/fiat-crypto for edcurve support now
- 2021-04-28 05:25:26Z lyuma: Filed issue https://github.com/godotengine/godot/issues/48257 😢
- 2021-04-28 04:29:14Z lyuma: fire filed issue https://github.com/godotengine/godot/issues/48255 about the rendering server custom format issue with a reproduction project.
- 2021-04-28 01:50:03Z fire: Reduz is personally updating the TPS demo for 4.0 gdhearteyes (2)
- 2021-04-28 01:37:45Z fire: #GodotEngine developers' next Live Q&A on #YouTube this Thursday, 29 April 2021 at 18:00 UTC. https://cdn.discordapp.com/attachments/836651615532482611/836778183448854579/unknown.png
- 2021-04-28 01:36:26Z lyuma: just expanding on the above. I will try to make a proposal some time this week
- 2021-04-28 01:35:29Z lyuma: The current architecture only allows 100% weight paint to a single bone at a time, and this can cause a seam to appear on softbody meshes
- 2021-04-28 01:34:43Z lyuma: While usability is nice to have, my interest is specifically in revising the underlying architecture of Softbody weight painting as the current storage format is resource intensive and not sufficiently flexible for my needs.
- 2021-04-28 01:32:20Z fire: **Lyuma Topics**: Normal seam problem
- 2021-04-28 01:28:58Z fire: **Lyuma Topics**: Create a proposals for better usability of soft body creation.
- 2021-04-28 01:28:24Z fire: "**Lyuma Topics**: Using n-gon encoding for glTF / VRM.
  https://github.com/KhronosGroup/glTF/pull/1620 https://github.com/KhronosGroup/glTF-Blender-IO/pull/622"
- 2021-04-28 01:07:44Z fire: **Godot Engine Physics with Pouley**: He mentioned that a vertex painter in Godot Engine would be useful for softbody physics after a bone has been created.
- 2021-04-28 01:06:56Z fire: **Other Pouley topics**: Godot physics has a recent pr for multithreaded physics. After Godot Physics having the same set of features, he's going to work on fixing bugs. Pouley will be around as a paid contributor for the next period of time.
- 2021-04-28 01:04:50Z fire: **Pouley Topics**: need to help Twigleg do 2d IK as a prerequisite to 3d IK (3d Skeleton Modification stack). Talked about vertex painting in godot and トカゲ's bone subgizmos needing coordination with Reduz and JFons. Talked about gltf2 having quads but too difficult to get into both blender, godot and gltf. This came up because I and Pouley worked on subdivision surfaces and how they break for uv mapped triangular meshes on the seams.
- 2021-04-28 00:22:16Z fire: Meeting with Pouley now
- 2021-04-28 00:17:55Z fire: Clearing out my github backlog. -- It's hard work 😦 I stopped reviewing the prs that were closed.
- 2021-04-27 22:49:13Z fire: https://user-images.githubusercontent.com/32321/116321716-6bfec800-a76f-11eb-99bb-357f3ce1f57e.mp4 📧 (1),👍 (2)
- 2021-04-27 22:48:29Z fire: Made a small video and ported the Godot IPFS demo to Windows. https://github.com/fire/godot-ipfs/releases/tag/v0.0.1
- 2021-04-27 22:43:26Z lyuma: "Started a bisect to find the source of the `@export` resource bug. After wasting hours working around it and faceplanting into more related bugs, I've come to the conclusion that I can't get any work done on master branch until it's fixed. [ Git issue comment: https://github.com/godotengine/godot/issues/48224#issuecomment-827975641 ]
  Conclusion: Commit 160c260 is responsible: [GDScript: Allow export of enum variables] by vnen"
- 2021-04-27 21:34:12Z fire: トカゲ recommended the Motoya font for my Hop, Spin, and Dance application. Motoya is a decent font and it is used in the Android phone.
- 2021-04-27 19:42:20Z fire: Setup a meeting with Pouley some time this week. Poke me for suggestions of topics. Pouley works on Physics but I wanted an update on Skeleton modification stack 3d
- 2021-04-27 19:30:25Z fire: Set up a meeting with rafallus about EWBIK on Thursday
- 2021-04-27 18:38:47Z fire: Touched on https://github.com/godotengine/godot/issues/48247 gltf import Lyuma 📬 (1)
- 2021-04-27 17:58:23Z fire: Updated Scheduled play branch and the demo. https://github.com/fire/godot/tree/play-scheduled and https://github.com/fire/godot-schedule-play-demo
- 2021-04-27 17:45:25Z fire: Waiting for a 3d print of https://www.reddit.com/r/ValveIndex/comments/mdw5i6/test_subjects_needed_for_vive_facial_tracker/ so I can try the HTC Facial tracker with https://github.com/FAU-Inf2/godot-vive-pro-eye. We have to add support, but it uses the exact same sdk.
- 2021-04-27 17:43:18Z fire: Made a decision yesterday to close GIF / APNG import in Godot due to consensus. https://github.com/godotengine/godot-proposals/issues/1433 Xrayez has an implementation if we really really want it.
- 2021-04-27 17:41:47Z fire: Reviewing WebP as the default lossless compression algo for the core Godot Engine. https://github.com/godotengine/godot/pull/47835
- 2021-04-27 17:39:36Z fire: Received an update to the Holo display delivery. It'll be in May - `https://www.kickstarter.com/projects/lookingglass/looking-glass-portrait/posts`
- 2021-04-27 17:31:39Z fire: Reviewing Play Scheduled proposal - https://gist.github.com/fire/b9ed7853e7be24ab1d5355ef01f46bf1 - There's an Audio meeting on Thursday this week. Updating play scheduled branch to master.
- 2021-04-27 17:23:39Z fire: Use the IPFS Go language binary to make Godot an IPFS server https://github.com/fire/godot-ipfs
- 2021-04-27 17:21:25Z fire: I worked on debugging SVG import for the UI made for the hop spin dance display. https://github.com/godotengine/godot/issues/48243 and closing more pull requests for material imports https://github.com/godotengine/godot/pull/48167#issuecomment-827757392
