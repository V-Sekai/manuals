# V-Sekai Changelog - 2021-10

- 2021-10-31 19:30:30Z fire: https://twitter.com/reduzio/status/1454867881771024391?s=20
- 2021-10-31 17:12:51Z fire: Instruction unclear. Hair stuck in gentle breeze. https://github.com/fire/TressFX-OpenGL See releases for a zip. https://cdn.discordapp.com/attachments/836651615532482611/904417650510295060/2021-10-31_10-09-56.mp4
- 2021-10-31 04:08:23Z fire: Confirmed fixed my screenshots system.
- 2021-10-30 18:18:28Z fire: :danceblob:
- 2021-10-30 18:17:58Z fire: aha. yes. https://github.com/godotengine/godot/pull/54427
- 2021-10-30 17:59:04Z fire: Restored theme generator for groups. [reverted to editor theme] Needs time to debug.
- 2021-10-30 06:03:59Z fire: Early builds are testable
- 2021-10-30 02:20:34Z lyuma: "The VRM avatar converter has been updated at https://github.com/V-Sekai/vsk_vrm_avatar_tool and made to work with the new rotation/scale/blend_shape tracks.
  (generated scenes duplicate all resources, so make sure to not save as "".tscn"")" https://cdn.discordapp.com/attachments/836651615532482611/903830713009311754/unknown.png
- 2021-10-29 23:28:11Z fire: Character translation movement now works. [WASD]
- 2021-10-29 20:59:18Z fire: <ProtonGraph> HungryProton pushed the beginning of the 4.0 port to the refactoring-4.0 branch
- 2021-10-29 16:02:35Z fire: From Mux and related to Godot XR This is so much fun: https://youtu.be/UxZj8OOCgY4
- 2021-10-29 01:42:32Z lyuma: Here's a video showing multiple players moving around over the network! and made it right side up by not calling set_vflip(true)! https://cdn.discordapp.com/attachments/836651615532482611/903458754262089728/vsekaimultiplayer_2021-10-28.mp4 🎉 (1)
- 2021-10-29 01:26:17Z lyuma: "We might all be in error avatars, and the world might be upside down.....
  But.
  We have networking!!!
  (This is the first time we've successfully made a multiplayer connection on Godot 4 pre-alpha with Vulkan!)" https://cdn.discordapp.com/attachments/836651615532482611/903454660243894352/unknown.png
- 2021-10-28 09:40:10Z lyuma: https://media.discordapp.net/attachments/659137056991346708/903093451560714280/unknown.png
- 2021-10-27 19:54:44Z fire: Checked material settings Lyuma. Pushed the updates.
- 2021-10-27 18:22:01Z fire: Lyuma ninja and ccache oh my. https://github.com/V-Sekai/godot/tree/ninja-ccache Based on work by dmoody256
- 2021-10-27 16:31:59Z fire: Great work humbletim https://github.com/omigroup/omi-blender-gltf/pull/1
- 2021-10-27 01:47:49Z fire: I un-archived HungryProton's work, made a build and duplicated some trash cans. https://cdn.discordapp.com/attachments/836651615532482611/902735304228737094/unknown.png
- 2021-10-25 19:59:28Z fire: Rotation mode pr merged. https://github.com/godotengine/godot/pull/54222 Lod added 🦎 (1)
- 2021-10-25 12:23:37Z fire: Openvr update from mux
- 2021-10-25 06:39:34Z lyuma: Updated some more scripts to work with the latest engine. the groups demo is still pink with looping physics sounds, though moving the mouse appears to pan the audio, so there's something moving somewhere
- 2021-10-24 01:37:02Z fire: "followed up on a design for duplicated blendshapes Lyuma korewaChino EIREXE
  https://github.com/godotengine/godot/issues/54062"
- 2021-10-24 01:21:56Z fire: Tested animation compress. was a bit slow
- 2021-10-24 01:12:26Z fire: Moved key-frame reduce to 4.0 but it still has fiddly test cases. Don't want to debug, but leaving it here. https://github.com/V-Sekai/godot/commits/keyframe-reduce Dropping it.
- 2021-10-23 15:25:29Z fire: https://twitter.com/smallseasonsbot/status/1451929853565890563?s=20
- 2021-10-23 08:08:18Z fire: https://cdn.discordapp.com/attachments/836651615532482611/901381505526415360/unknown.png
- 2021-10-23 06:18:32Z fire: sync with samsung thorvg team need pr review about paint replacement through iteration for color replacement
- 2021-10-23 01:48:51Z fire: Got godot speech C++ module to compile. At some point in the future need to try uncompressed audio after the api changes. There's a test project. 🗣️ (2)
- 2021-10-23 00:36:32Z fire: Extracing godot-speech into a C++ module
- 2021-10-23 00:25:44Z fire: Lyuma told me about this tool. So cleaned it a bit https://github.com/V-Sekai/V-Sekai-Blender-tools/tree/main/addons/ApplyModifierForObjectWithShapeKeys
- 2021-10-21 03:27:13Z lyuma: fire made a lot of progress debugging the frame lag and random hangs. we have mitigations for some issues, but might not be fully correct
- 2021-10-20 07:26:46Z fire: **VERY POOR 1 FRAME STUTTER** Got the sample working with our own build of the openvr gdextension. https://github.com/V-Sekai/v-sekai-openvr-sample/releases/tag/v0.2 Includes the godot 4 editor.
- 2021-10-18 16:33:47Z fire: https://deepmind.com/blog/announcements/mujoco
- 2021-10-18 13:59:41Z fire: mux offers to send his working openvr as an archive. He found some bugs with exporting gdextensions
- 2021-10-18 05:26:43Z fire: cyberpunkmermaid#6171 interested in clothing for avatars at omigroup
- 2021-10-17 01:02:32Z fire: https://github.com/ubisoft/mixer/pull/27
- 2021-10-17 01:01:54Z fire: Debugged why mixer crashes on 2.93 did not fix but worked around
- 2021-10-16 02:52:17Z fire: I am satisfied. Found the bug. https://github.com/godotengine/godot/pull/53865
- 2021-10-16 00:33:27Z fire: What can we do to speed up our processes? https://scattered-thoughts.net/writing/speed-matters/
- 2021-10-16 00:22:51Z lyuma: Updated Unidot Importer to work with latest master. Godot has gotten quite a lot faster it feels like
- 2021-10-15 23:05:50Z fire: https://github.com/godotengine/godot/pull/53821#issuecomment-944785300
- 2021-10-15 22:29:11Z fire: "https://github.com/V-Sekai/godot-4-animation-vrm-sample

Currently the root motion is on the hips and not on the root bone so it's a bit funny"

- 2021-10-15 22:22:01Z lyuma: "Rumors of a Godot 4 alpha are beginning to emerge. From Akien:
  > New 4.0 build which is not alpha yet hohoho https://downloads.tuxfamily.org/godotengine/testing/4.0/4.0-dev.20211015/

Some hints that it could be ""a few days more to mature"" beyond ""this week"" so there's a chance of next week even!"

- 2021-10-15 14:10:43Z fire: https://github.com/godotengine/godot/pull/53833 📽️ (1),🎞️ (1),🧹 (1)
- 2021-10-15 01:33:14Z fire: https://github.com/godotengine/godot/issues/53823 Saracen PREVIEWS ARE FIXED 🔥 👍 (2)
- 2021-10-14 15:08:32Z fire: Watching https://vive.com event.
- 2021-10-14 14:12:59Z fire: Typed a plan for EWBIK work https://github.com/godot-extended-libraries/ewbik/issues/6
- 2021-10-13 11:49:07Z fire: Worked on トカゲ VRM-like rotational rest pose baking https://github.com/V-Sekai/godot/tree/bake-rests
- 2021-10-13 11:03:55Z fire: Skeleton split transform 3d merged from reduz
- 2021-10-13 09:20:44Z fire: Updated Lyuma https://github.com/V-Sekai/godot/tree/groups-4.x-remove-separate-gltf-bake
- 2021-10-13 04:57:28Z fire: Updated https://github.com/V-Sekai/godot/tree/rot-interpolate
- 2021-10-12 10:54:44Z fire: Akien mentioned libacktrace
- 2021-10-11 18:46:53Z lyuma: "Spent all day researching nonunknown's negative scale issue:
  https://github.com/godotengine/godot/pull/53642#issuecomment-940357171
  I think I have a pretty good understanding of why it breaks in Godot (except cull_back meshes) and what solutions are possible/feasible."
- 2021-10-11 15:57:30Z fire: https://cdn.discordapp.com/attachments/836651615532482611/897150929911021619/unknown.png
- 2021-10-11 15:03:44Z fire: Updated blockmesh models https://github.com/V-Sekai/art-blue-tin-fox-models/releases/tag/latest. Edited: Incorrect export. Exported again.
- 2021-10-11 13:24:24Z fire: Restored compilation of lasso.
- 2021-10-11 12:56:20Z fire: Today's Godot Engine build tag https://github.com/V-Sekai/godot/releases/tag/groups-4.x.2021-10-11T123723Z
- 2021-10-10 22:50:47Z fire: https://cdn.discordapp.com/attachments/836651615532482611/896892548528889896/unknown.png
- 2021-10-10 22:48:25Z fire: Trialing windows 11 and WSL for CUDA on windows. It works
- 2021-10-10 22:48:09Z fire: Silent Sure, at least the permission to use them and if it's not too much effort.
- 2021-10-10 10:18:21Z Silent#0264 Do you want the source text?
- 2021-10-09 23:24:05Z fire: Lyuma EIREXE https://www.kickstarter.com/projects/lookingglass/looking-glass-portrait with https://github.com/CaptainProton42/GodotHoloPlay https://cdn.discordapp.com/attachments/836651615532482611/896538541402783774/unknown.png
- 2021-10-09 18:21:42Z fire: Silent Trying to create your list of CC0, CC-BY avatars https://cdn.discordapp.com/attachments/836651615532482611/896462441221877790/unknown.png
- 2021-10-09 18:20:55Z fire: Creating a list of VRM checking conditions. https://cdn.discordapp.com/attachments/836651615532482611/896462244378996756/unknown.png
- 2021-10-08 17:31:13Z fire: https://twitter.com/smallseasonsbot/status/1446491101490081802?s=20
- 2021-10-08 17:01:37Z fire: Does not support blend shapes in bake, but does in player.
- 2021-10-08 17:00:47Z fire: See `addons/miku_motion_bake/readme.md` for instructions
- 2021-10-08 17:00:26Z fire: Been working on baking from VMD to VRM. Promising. https://github.com/V-Sekai/MikuMotionVSekai
- 2021-10-07 07:42:12Z fire: "youwin — Yesterday at 21:03
  started work on an obs <-> godot integration using obs-websocket. Might be useful for tutorial makers or recording short demo clips of your game without requiring too much editing https://github.com/you-win/obs-websocket-gd" 👀 (3),👍 (1)
- 2021-10-06 20:26:41Z fire: Notes from GDC - Genshin Impact: Building a Scalable AI System humbletim https://hackmd.io/SPqekctOQYS5vQ7w7glJ5A
- 2021-10-06 20:10:50Z fire: https://github.com/godotengine/godot-proposals/issues/3394 reduz wrote a proposal for ellenhp
- 2021-10-06 20:07:47Z fire: Decreasing GLB (probably VRM) sizes https://forum.playcanvas.com/t/tricks-to-decrease-morph-target-sizes/18628/9?u=chris
- 2021-10-06 19:51:03Z fire: Trialing https://v-sekai.budibase.app Lyuma
- 2021-10-06 19:34:12Z fire: Discussed with Ob5vr about blend shape baking. TODO: Get some GDC courses from The Last of Us Part 2 on SSD techniques.
- 2021-10-06 19:21:20Z トカゲ: "Marged Skeleton Gizmo 🎉
  https://github.com/godotengine/godot/pull/45699" gdhearteyes (1),PartyParrot (2),mikuleek (1),SkellyDance (1)
- 2021-10-06 19:17:15Z fire: https://github.com/godotengine/godot/pull/53298
- 2021-10-06 19:05:46Z fire: Also to bake blend shapes.
- 2021-10-06 19:05:37Z fire: The goal is to remove the dem bones repo is remove FBX and ABC depenencies
- 2021-10-06 19:04:50Z fire: https://github.com/V-Sekai/godot-dem-bones/tree/godot working on it for a few hours
- 2021-10-06 19:01:30Z fire: Still working on a summary of UIUX proposals. https://hackmd.io/26BUnwWOSYuMFIvvpoLa5Q
- 2021-10-06 13:18:17Z fire: https://github.com/godotengine/godot/pull/53473 Lyuma トカゲ 🆗 (1)
- 2021-10-05 07:01:01Z fire: https://cdn.discordapp.com/attachments/836651615532482611/894841592505069599/unknown.png pog (2),😍 (2)
- 2021-10-05 06:50:22Z lyuma: we can chat more about this in #server-backend
- 2021-10-05 06:44:14Z fire: https://twitter.com/JenMsft/status/1445065715698962442?s=20
- 2021-10-05 04:55:21Z fire: Donmcurdy chat about materialx in omigroup's gltf extensions discord for a few hours ❤️ (2),👏 (2)
- 2021-10-04 17:03:45Z fire: GLTF2 Document merged.
- 2021-10-04 08:21:47Z lyuma: トカゲ let's move this to #animation ... but basically there are three different proposals from Reduz.
- 2021-10-04 08:21:42Z トカゲ: So it should not support A pose -> T pose
- 2021-10-04 08:21:02Z トカゲ: If I understand correctly from my discussion with reduz, this implementation is pretty similar to the global transform in MMD
- 2021-10-04 08:18:08Z lyuma: I believe this proposal is sort of a generalization of the retargeting system you might find in Unity, without going into specifics on the implementation of the retargeting: what Reduz calls a "Retargeter" is what you would call an "Avatar" in Unity.
- 2021-10-04 08:15:31Z lyuma: "Reduz made a new proposal related to Animations:
  https://github.com/godotengine/godot-proposals/issues/3379"
- 2021-10-04 05:35:48Z fire: https://github.com/godotengine/godot/pull/50964 Updated libcurl. Ready for merging.
- 2021-10-04 01:59:46Z fire: Branch created https://github.com/V-Sekai/godot/tree/remove-skeleton-ik-3d
- 2021-10-03 19:51:15Z fire: https://www.campaign.viveport.com/step-into-catart
- 2021-10-03 19:49:11Z fire: https://autodesk-forks.github.io/MaterialX/ materialx web viewer
- 2021-10-03 19:48:47Z fire: https://cdn.discordapp.com/attachments/836651615532482611/894310029715464262/unknown.png
- 2021-10-03 05:35:20Z lyuma: This isn't really a discussion channel so I'll continue in #server-backend
- 2021-10-03 04:37:57Z fire: v-sekai.org's ssl cert will expire in 2 days
- 2021-10-02 19:26:59Z fire: https://github.com/godotengine/godot/pull/53337 merged
- 2021-10-02 16:51:51Z fire: Need to a tech limits design. The Last of Us Part II Abby has a total joint count of 1075 Animated - 520 (includes face) and 555 procedural.
- 2021-10-02 16:34:45Z fire: "Everything is back to working. Yesterday everything broke
  ref: meshes disappeared and crash with skeleton because minimum verts. Fixes from Lyuma. Also tested occulusion culling"
- 2021-10-02 14:35:34Z fire: Lyuma The platform creator of Tokyo Game Show 2021 liked my post. https://cdn.discordapp.com/attachments/836651615532482611/893868818038915132/unknown.png
- 2021-10-02 12:52:57Z Saracen: Cool, I'll read through it later today
- 2021-10-02 12:48:43Z lyuma: "Saracen fire New proposal by reduz for animation import without bone rest pose:
  https://github.com/godotengine/godot-proposals/issues/3377"
- 2021-10-02 02:32:49Z fire: https://github.com/godotengine/godot-proposals/issues/3375
- 2021-10-01 07:54:55Z Saracen: Neat!
