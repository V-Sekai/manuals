# V-Sekai Changelog - 2021-05

# Changelog

### 2021-05-31

- **21:30:03Z** fire: [Godot4OVRTest](https://github.com/Ozzadar/Godot4OVRTest.git) and [godot-fire](https://github.com/godot-extended-libraries/godot-fire/tree/multiview-stero-openxr)
- **21:29:42Z** fire: Context. Porting OpenXR to run on Godot Engine 4
- **21:29:29Z** fire: haagch's input on VkPhysicalDevices and VkInstances
- **21:28:46Z** fire: haagch's suggestion for handling VkInstance in OpenXR plugin and engine
- **21:25:54Z** lyuma: Yayay
- **21:11:03Z** fire: 🎆 🎆 🎆
- **21:10:49Z** fire: 🎉
- **21:10:45Z** fire: Lyuma Merged [PR #49120](https://github.com/godotengine/godot/pull/49120) 👏 (2)

### 2021-05-30

- **12:58:28Z** fire: [V-Sekai VRM addon release](https://godotengine.org/asset-library/asset/964)
- **10:58:12Z** lyuma: "Submitted the asset ""VRM Importer and MToon Shader"" - it will be at [asset/3693](https://godotengine.org/asset-library/asset/3693) once approved.
  - [Issue comment](https://github.com/V-Sekai/godot-vrm/issues/14#issuecomment-850979766)
  - [Video demo](https://www.youtube.com/watch?v=M7psmdcDHAo)
- **00:57:51Z** fire: Merged LOD fix [PR #49197](https://github.com/godotengine/godot/pull/49197)

### 2021-05-29

- **22:08:49Z** fire: Found a bug in LOD on integer locations. Asked someone to handle it for me.
- **17:52:04Z** fire: Lyuma May need an ubuntu version too. Not sure how the test matrix works. I want fedora and ubuntu LTS (the oldest one)
- **17:13:00Z** lyuma: Progress on godot-cpp, Godette-Chan model port to VRM, and other updates
- **17:09:27Z** lyuma: Debugging an issue causing the outlines to look too bright in MixedLight mode, then I'll demonstrate exporting a default character from vroid studio as well.

### 2021-05-29

- **17:06:50Z** lyuma: [Godette-Chan model in VRM format](https://cdn.discordapp.com/attachments/836651615532482611/848246017954021416/godette_chan_v22.vrm)
- **16:59:06Z** lyuma: [Godette-Chan model port result](https://cdn.discordapp.com/attachments/836651615532482611/848244072161345586/unknown.png) 👏 (1)

### 2021-05-28

- **22:45:48Z** fire: Spent the afternoon on organizing work on the CMValley Godot Demo
- **21:53:32Z** lyuma: Updated godot-cpp; fixed SConstruct lines and resolved errors with clang and the gltf GDNative plugin
- **21:15:35Z** fire: Investigating the Godot Engine open content map "CMValley_to_Godot_Demo" (Ask me for the doc if you want it)
- **20:46:13Z** fire: Given .net assemblies 1. visualize 2. given pdbs associate symbols 3. graph!
- **20:45:48Z** fire: Lyuma Synergiance [SourcetrailDotnetIndexer](https://github.com/packdat/SourcetrailDotnetIndexer)
- **06:24:04Z** fire: Code review gltf the entire afternoon

### 2021-05-27

- **18:45:25Z** fire: Spent time summoning peers about making a realistically lit 3d game level environment in Godot Engine. Official Godot Engine business. -\_-

### 2021-05-26

- **21:43:14Z** lyuma: Filed bugs and pull requests
- **21:17:25Z** fire: Tokage improved the Skeleton Gizmos with better color choices and bugfix for a shadow problem with depth
- **17:43:36Z** fire: We contributed to the drafting of them.
- **17:43:22Z** fire: [Values from OMI](https://media.discordapp.net/attachments/834825299438731325/847148997030576188/unknown.png)
- **10:38:49Z** lyuma: [Twitter post](https://twitter.com/Lyuma2d/status/1397501932827078658)

### 2021-05-26

- **09:26:03Z** lyuma: For now anyway, the VRM module is only for import.
- **09:25:40Z** lyuma: there's a lot of untested code related to export, since there are still bugs, but I expect to be able to incorporate any bugfixes made to export
- **09:25:09Z** lyuma: After finishing the backport of the Fire's latest gltf module to 3.x as a module / draft PR, I had success in porting the gltf module to GDNative: The VRM module now runs in Godot 3.3-stable: [Screenshot](https://cdn.discordapp.com/attachments/836651615532482611/847042666822893598/unknown.png)

### 2021-05-24

- **18:13:44Z** fire: Evaluating curve fitter from Maya2glTF. [Reducer-fire branch](https://github.com/fire/Maya2glTF/tree/reducer-fire) [Screenshot](https://cdn.discordapp.com/attachments/836651615532482611/846450916281417778/unknown.png)
- **18:08:49Z** Saracen: Progress on asset validation layer and remaining issues
- **15:37:50Z** fire: (blender)
- **15:37:37Z** fire: [Screenshot](https://cdn.discordapp.com/attachments/703726244436508722/846370817701183488/unknown.png) 👍 (2)
- **15:37:09Z** fire: Worked with hutty to transfer gltf export tech to his voxel drawing tool
- **00:56:09Z** fire: Also, pitching usdz after 4.0
- **00:55:22Z** fire: "Trying to pitch a list of features for funding. - Full glTF2 / VRM import and export pipeline in Godot Engine
- General purpose retargeting system for VRM type models + encoding in BVH (3d pose format)
- Godot Engine support for basis universal in glTF2
- Quads in glTF2
- After quads in glTF2, better mesh simplification and LODs that work on quads"

### 2021-05-22

- **16:23:18Z** fire: [PR #47764](https://github.com/godotengine/godot/pull/47764/files) Lod Merge! 👏 (4)
- **03:41:06Z** lyuma: is it GLES2 or GLES3?
- **03:12:33Z** fire: humbletim [Screenshot](https://cdn.discordapp.com/attachments/836651615532482611/845499351346315264/unknown.png)
- **02:30:08Z** fire: Investigating V-Sekai compiled for javascript

### 2021-05-21

- **23:38:30Z** fire: [Screenshot](https://cdn.discordapp.com/attachments/836651615532482611/845445481622667304/unknown.png)
- **23:32:27Z** fire: What do I do, Victoria Day on Monday. How is the Queen!?
- **23:31:24Z** fire: Discussed 15 frames encoding into a QR / DataMatrix code [ShaderMotion](https://lox9973.com/ShaderMotion/player-gltf.html) Writing a obs script in python to read data.

### 2021-05-21

- **15:37:50Z** fire: (blender)
- **15:37:37Z** fire: [Screenshot](https://cdn.discordapp.com/attachments/703726244436508722/846370817701183488/unknown.png) 👍 (2)
- **15:37:09Z** fire: Worked with hutty to transfer gltf export tech to his voxel drawing tool
- **00:56:09Z** fire: Also, pitching usdz after 4.0
- **00:55:22Z** fire: "Trying to pitch a list of features for funding. - Full glTF2 / VRM import and export pipeline in Godot Engine
- General purpose retargeting system for VRM type models + encoding in BVH (3d pose format)
- Godot Engine support for basis universal in glTF2
- Quads in glTF2
- After quads in glTF2, better mesh simplification and LODs that work on quads"

- 2021-05-21 22:51:16Z lyuma: "I worked with fire on debugging glTF. I think we're going to possibly need two different approaches for solving glTF skeletons.

  1. Radical change to glTF parser to treat all subtree nodes as part of a single skeleton recursively. (What we were just testing) I believe this would be unacceptable in 3.x because it is almost guaranteed to break compatibility with all content, but it may be desirable in 4.x.
  2. Add BoneAttachments to skeletons directly parented to skeletons. (We tried this). This may be required in 3.x.
  3. While in `_determine_skeletons`, detect the specific case in which two skeletons would be directly parented and add them to the disjoint set in this case (look at the parent objects at the end). Do not actually add the parent bone to the disjoint set: only do it if this would hit the problem case. Issue: this may require doing another iteration of the `_determine_skeletons` code? Is this possible without causing more bugs? This could be a compromise if it is possible.

  Bugs:

  1. Animations must not animate SkinnedMesh objects
  2. We ran into weird issues with fake_joints. Can these issues be reproduced without the radical change above? I think they can by making a single gltf file which has a skin also referencing a mesh. This issue leads animation targeting mesh-bones to fail to create a bone track correctly.
  3. MeshSkinnedToItselfAndOthersV3 is missing a whole mesh node after import. It shows up in the popup but not in the final scene. Owner issue?? Is it related to the fake_joints? The glb here should have a spinning diamond and two spinning skinned cubes:" https://cdn.discordapp.com/attachments/836651615532482611/845433592888557568/MeshSkinnedToItselfAndOthersV3.glb

- 2021-05-21 22:29:43Z fire: We also gain the ability to post more twitter tweets.
- 2021-05-21 22:29:23Z fire: Had a discussion with Lyuma and Saracen about V-Sekai for wider testing and how it was blocked by scene validation feature.
- 2021-05-21 15:27:33Z fire: Multiple PRs from fire and Lyuma were merged for gltf problems
- 2021-05-20 15:28:19Z fire: トカゲ https://github.com/godot-extended-libraries/godot-fire/commits/features/skeleton-gizmos I did some cleanup, rebased on the modification stack and changed the color for selected bones to be a darker orange
- 2021-05-20 15:26:43Z fire: Lyuma IK and Modification stack are now a stacked branch.
- 2021-05-20 04:21:06Z fire: Work with Lyuma on 3 glTF bug fixes. 1. instead of failing all the meshes only fail once 2. the skins duplication removal code has a bug and it needs to check skin bind bone, skin bind name and pose transform. 3. the skin bind code was removed 4. gltf 4.0 modules was backported to 3.2
- 2021-05-19 19:20:41Z fire: Lyuma and I summarized our concerns about the ease of implementation and the inability to use off the shelf code.
- 2021-05-19 19:20:00Z fire: OMI Week 3. Stayed for the talk at 9am and then stayed with Robert Long to talk about OMI Identity and misc things like there is no opensource OpenXR mobile client. https://github.com/omigroup/OMI/issues/36#issuecomment-844392614
- 2021-05-19 14:37:19Z fire: After sleeping on the Linux RPM database problem, I was able to get WSL working again. Lyuma I needed to switch WSL to version 2.
- 2021-05-18 18:32:58Z fire:

```
groups-4.x branch in the Groups Godot Engine Repo

1. VRM patches required
2. Importing patches for the editor
3. Gltf and other UV1-8 channel requirements
4. (stacked branch) bone modification + bone gizmos
5. fix normals being broken in mesh optimizer
Push on merge extended-fire-master remotes/fire/cubic-interpolation
Push on merge extended-fire-master remotes/fire/gltf-bone-skinning-normalization
6. remotes/bruvzg/msdf_fonts
7. push gltf export (fire)
8. feature/spatial-audio
9. rewrite compressed audio for voip
Push on SIMDE for avx support
Punt crash / reliability problem on Godot Engine crashing

merge-script-4.x is the branch name for the groups_merge_script Repo
```

- 2021-05-18 17:41:55Z fire: "Coordination problems:
- name of the ""merge script"" for v-sekai 4.x
- name of the V-Sekai/godot branch for v-sekai 4.x
- which branches should be in the initial set of patches applied to godotengine master branch"
- 2021-05-18 14:46:44Z fire: GSOC 2021 started on Monday. Will be mentoring Theoway and on the topic of Visual Script node visual organization
- 2021-05-18 14:43:56Z fire: Posted my last revision of runtime export https://github.com/godot-extended-libraries/godot-fire/tree/extended-fire-master-runtime-gltf
- 2021-05-18 14:01:58Z fire: Lyuma Please see xr channel in godot about runtime gltf. May be too politically diffficult to get merged, so will fix gltf export bugs
- 2021-05-18 03:48:49Z fire: "Worked with Lyuma and Tim on MotionShader to glTF2
  https://hackmd.io/@tI5OkracQhuas5Kjh-kG0g/S1uzKIgt_/edit"
- 2021-05-17 00:07:58Z Saracen: A few more fixes to the XR switching + you can now alter your _real-world_ height at runtime heart (2)
- 2021-05-16 23:01:38Z fire: I have as animation as I want 😮 https://cdn.discordapp.com/attachments/836651615532482611/843624264958738462/2021-05-16_15-59-25.mp4 👍 (2)
- 2021-05-16 23:01:17Z fire: https://cdn.discordapp.com/attachments/835369558541467668/843623340965888040/godot_girl_stealth_JohnnyRouddro_mit_lic_No_Logic_David_cc_by.glb
- 2021-05-16 22:58:19Z Saracen: Added further bug fixes to runtime switching of VR mode and flat mode. Fixes the few minor remaining issues with the avatar poses getting messed up, and the VR controllers being stuck on screen. With that, I'm satisfied with marking this feature as done in the tracker.
- 2021-05-16 22:22:05Z fire: Work around found. Import into godot and then export it as glb again.
- 2021-05-16 22:17:37Z fire: Submitted a blender gltf bug report. https://github.com/KhronosGroup/glTF-Blender-IO/issues/1392 😮 (1)
- 2021-05-16 21:19:32Z fire: We are a go for big frame counts. I'm able to get a massive dataset thanks to lox9973 https://cdn.discordapp.com/attachments/836651615532482611/843598569851846707/unknown.png
- 2021-05-16 21:15:45Z lyuma: "I hope the code I wrote will help others as a template for making nice-looking inspectors.

I am considering submitting Godot-MToon-Shader to the asset library, separately from VRM."

- 2021-05-16 21:15:12Z lyuma: Using much the same cursed techniques that many Unity inspectors use, I was able to create bold headings, and "single-line" texture+image property pickers.
- 2021-05-16 21:13:39Z lyuma: In some ways, it's a bit more clunky than the `get_property_list()`, and a bit less versatile in terms of what you can do... but I decided to think outside the VBoxContainer a little bit, and I came up with a reasonable inspector, I think.
- 2021-05-16 21:11:54Z lyuma: Spent most of the day learning how to make a custom shader inspector using EditorInspectorPlugin. I'm pretty happy with how it turned out https://cdn.discordapp.com/attachments/836651615532482611/843596648855896084/mtoon_shader_inspector.png
- 2021-05-16 16:15:16Z fire: Thanks lox9973 for linking me to enough training data for my pose motion transfer tests. https://www.youtube.com/playlist?list=PLmwqDOin_Zt4WCMWqoK6SdHlg0C_WeCP6 (cc-by)
- 2021-05-16 15:11:34Z fire: Brainstorming an intermediate format that isn't exact per bone joint orientation but general across characters
- 2021-05-16 05:53:14Z fire: Investigating ShaderMotion. Now that I can go from some anims to Unity Mechanism / UE4 / VRM skeletons, I want to investigate writing a shader motion player.
- 2021-05-16 01:16:04Z lyuma: https://github.com/V-Sekai/godot-vrm godot3 branch (Godot 3.3): Runtime support requires no patches. Editor requires gltf module. master branch: Runtime support requires no patches. Editor requires two small engine fixes.
- 2021-05-16 01:13:55Z lyuma: Getting very close to a releasable fully featured (Import-only) VRM addon for Godot. Let me know what you think in #pipeline https://cdn.discordapp.com/attachments/836651615532482611/843295167603015700/godot_vrm_1.0.0_beta.mp4
- 2021-05-15 23:15:29Z fire: VRM from jin. Motion from Perfume dance webgl demo from 2013 in bvh format
- 2021-05-15 23:15:13Z fire: Testing animation retargeting software from the Blender ecosystem. https://cdn.discordapp.com/attachments/842452265296986134/843264562430214164/2021-05-15_16-10-49.mp4
- 2021-05-15 14:36:56Z lyuma: wiping history on V-Sekai/godot-vrm will be necessary because some large binary files were pushed in the past, and I want to ensure this addon is lightweight and easy to clone.
- 2021-05-15 14:33:39Z lyuma: "Pushed an update to Godot-VRM for godot 3.x: https://github.com/V-Sekai/godot-vrm/tree/gd3
  It's not finalized yet and I will do a bit more testing and bugfixing before rebasing/wiping all of history pushing it to `godot3`, its final resting place."
- 2021-05-14 15:00:58Z Saracen: Fixed some bugs to improve support for switching between VR and flat modes at runtime. Very ugly hack to fix one of the bugs though, strange issue. Some slight remaining avatar issues, but it's _mostly_ working now it seems.
- 2021-05-14 02:17:44Z fire: Added three pictures and a video.
- 2021-05-14 01:33:44Z fire: VOX to VRM fun. (Autorigging investigation for any static humanoid mesh!)
- 2021-05-13 21:38:00Z lyuma: but yeah! It's really exciting to get this much imported with just a couple clicks and about 30 seconds of waiting
- 2021-05-13 21:37:01Z lyuma: it's a bit of random chance that it looks so similar: the skydome and some objects like flowers have completely custom shaders, so those will have to be ported manually
- 2021-05-13 21:36:32Z Saracen: This is actually starting to look like the original now
- 2021-05-13 21:36:27Z Saracen: Woah!
- 2021-05-13 21:36:04Z lyuma: Unidot Importer: Got lighting and basic environment settings importing. In squiddingme's Traveler's Rift, I'm now able to bake lighting immediately after importing. (You can see the probes are baking as black, so there are still some issues to be worked out.) - Also added support for audio, cameras and reflection probes: https://cdn.discordapp.com/attachments/836651615532482611/842515566413873172/unknown.png
- 2021-05-13 18:14:28Z fire: https://github.com/V-Sekai/vox-to-vrm
- 2021-05-13 18:12:49Z lyuma: Oh, jin is re-rigging it
- 2021-05-13 18:12:28Z lyuma: Jin's proposal does not make sense
- 2021-05-13 18:12:21Z lyuma: Vrm is an avatar format which requires a rigged humanoid model. Obj does not support rigging
- 2021-05-13 17:48:43Z fire: Lyuma https://cdn.discordapp.com/attachments/836651615532482611/842458354202181642/unknown.png
- 2021-05-13 06:35:51Z Saracen: Tweaked the way wristspan is calculated since it came out wrong on some avatars where the arms weren't perfectly aligned. Should result in more accurate VR proportions.
- 2021-05-13 04:26:05Z fire: Rebased my godot 4.0 stack so I can go back to my vrm viewer thing
- 2021-05-13 03:14:34Z Saracen: One more patch just to allow direct assignment of upper and lower bones by ID, but it seems to be working now. Good job! It's now possible to use avatars with in-between bones.
- 2021-05-13 03:00:37Z Saracen: Basically, the new code to automatically assign the next bone in the chain assumed the skeleton was assigned, even though it can be null.
- 2021-05-13 02:55:04Z MMMaellon#2053 whoa wait why was it crashing
- 2021-05-13 02:47:41Z Saracen: Fixed RenIK crashing.
- 2021-05-13 00:48:18Z fire: Reviewed https://github.com/godotengine/godot/pull/46568. Basis universal version update.
- 2021-05-12 23:34:42Z fire: OMI meeting today. OKR Review. Progress was difficult.
- 2021-05-11 15:38:53Z fire: Vive con starts in 20 minutes Voice Notifications. Any interesting talks?
- 2021-05-11 15:38:00Z fire: Anything from Vive Con?
- 2021-05-11 13:49:22Z lyuma: Fixed an issue in EWBIK that was bothering me -- namely, that the result of the algorithm appeared to depend on the root bone having an identity transform. It seems that all that was needed was to transform the "tip" and "target" headings of an IKBoneChain by the inverse transform of the root. https://cdn.discordapp.com/attachments/836651615532482611/841673340740829234/unknown.png 🌅 (1)
- 2021-05-11 03:32:10Z fire: Whoo debugged EWBIK the entire day, and removed the hacks to reveal the broken core to be rebuilt! Thanks Eron!
- 2021-05-10 17:21:03Z fire: Evaluated EWBIK with Motion Retargeting. Suggestions included adding a position indication (with scale) as a child of the correction node that is a child of the bone attachment and olving only one frame at a time. No conclusions yet, because ewbik is too broken.
- 2021-05-10 02:48:21Z fire: Working with Eron on ewbik. Next meeting at 9am or later.
- 2021-05-09 22:31:35Z fire: Working out a system where we create targets from the other skeletal animation using bone attachments and then a corresponding correction node underneath it. The ik solver then uses those correction node targets as the target.
- 2021-05-09 17:22:13Z Saracen: Support for ordered grid super sampling and camera position-based bill-boarding added thanks to help from Silent and Lyuma
- 2021-05-09 16:08:30Z fire: Many patches from トカゲ were merged today \o/. Thanks
- 2021-05-09 14:34:42Z fire: Saracen / Lyuma suggested a hint_string where a skeleton bone attachment gets a filtering tree popup for selecting bones
- 2021-05-08 15:47:13Z Saracen: https://github.com/SaracenOne/godot/tree/collada_semantic_fix_4_0
- 2021-05-08 15:46:07Z Saracen: https://github.com/SaracenOne/godot/tree/collada_semantics_fix_3
- 2021-05-08 15:45:11Z Saracen: Fixed some bugs with the Collada importer
- 2021-05-08 15:44:33Z Saracen: https://cdn.discordapp.com/attachments/836651615532482611/840615163937816585/screenshot_2021_05_08_164031.png
- 2021-05-08 10:48:29Z lyuma: Just to see how close I could get, I manually added a WorldEnvironment and did a few tweaks to light attenuation curves: https://cdn.discordapp.com/attachments/836651615532482611/840540658241634304/unknown.png
- 2021-05-08 10:43:35Z lyuma: (Though, I also have not yet implemented world environment. Also, you can see it fails to port custom shaders like the skybox.)
- 2021-05-08 10:42:42Z lyuma: squiddingme helped provide me with source files to their beautiful Traveler's Rift, and I am finally able to import it using Unidot. This part was all automated, and includes collision meshes for all of the separate pickup objects, as well as light sources. https://cdn.discordapp.com/attachments/836651615532482611/840539201987936306/TravelersRift.jpg 👍 (1)
- 2021-05-08 06:55:06Z fire: Chatted with humbletim about importing an existing armature into EWBIK Java
- 2021-05-08 06:30:40Z MMMaellon#2053 You were talking about it the other day, but all that I got was that it was difficult to set up. idk what it actually did
- 2021-05-08 06:30:13Z MMMaellon#2053 what does matrix server giv us?
- 2021-05-08 06:28:45Z lyuma: "1. We set up a matrix server in 5 hours (a few hours wasted due to firewall).

2. We set up federation to the matrix server in an SRV record
   Next steps?
1. Try godot-matrix to see if we can use the matrix server for interop. (Are there similar bindings for other languages?)
1. See if we can boil everything down to be easy to set up.
1. What is matrix actually useful for? Identity? Establishing E2E messages? Sending invites? How does federation help?"

- 2021-05-07 13:51:55Z fire: EWBIK bone dampening is implemented.
- 2021-05-07 11:09:14Z fire: > You won't need stabilization before you've implemented constraints.
- 2021-05-07 11:08:49Z fire: "Ewbik todo. dampening is about getting a natural pose,
  stabilization is about preventing wobbling when a lot of constraints are being violated."
- 2021-05-06 15:45:06Z fire: Got a reply from glitchtip. Require use cases generation.
- 2021-05-05 21:29:14Z fire: Added better ui for creating the effectors (targets and pins) in ewbik
- 2021-05-05 18:28:53Z fire: Lyuma When you're around, wanted to show you the EWBIK changes. It's working for some small cases.
- 2021-05-05 12:53:56Z lyuma: anyway aside from this PR and one other two-line workaround to the `@export` gdscript bug, Godot VRM master branch is now up-to-date and works on godot master (4.x). Currently working on getting the reins on 3.x and backporting some of the bugfixes
- 2021-05-05 12:52:45Z lyuma: Akien uses a stupid reason to argue against https://github.com/godotengine/godot/pull/48014
- 2021-05-04 22:02:14Z fire: Oops stupid, I didn't enable parent to child for EWBIK
- 2021-05-04 16:34:46Z fire: The idea is to run scripts on the os using ebpf to probe an active system. EBpf is similar to Sun DTrace and made by the same people.
- 2021-05-04 16:34:15Z fire: Discovered: https://pixielabs.ai/ Apache 2 CNCF project. Access metrics, events, traces and logs in seconds without changing code via dynamic eBPF probes and ingestors.
- 2021-05-04 16:15:03Z fire: Debugged with Eron EWBIK. No conclusions.
- 2021-05-04 14:52:02Z fire: "Next steps on EWBIK: The stiffness constraint of a bone determines how much the IK solver should prefer to avoid rotating it if it can. The kusudama constraint limits rotation and twist."
- 2021-05-04 13:01:11Z fire: https://github.com/godotengine/godot/pull/47389#issuecomment-830588813 Saracen Please respond to wave importer review
- 2021-05-04 12:59:10Z fire: "Still working on getting tokage's prs merged (ping pong) https://github.com/godotengine/godot/pull/48332
  (discrete carry) https://github.com/godotengine/godot/pull/48375"
- 2021-05-04 12:55:38Z fire: Porting https://github.com/fire/godot/tree/2d-ik but need to ask pouley something
- 2021-05-04 05:30:19Z lyuma: music?
- 2021-05-04 05:28:37Z fire: V-Sekai music discussion.
- 2021-05-04 01:29:11Z fire: rafallus EWBIK meeting time. Meeting done. Discussed the instability when the target is close and with multiple targets. Investigated future implementation of Kusudama constraints. Described a way to turn off ewbik constraints in the Java demo.
- 2021-05-03 21:25:19Z fire: Godot Vulkan now runs a software renderer (for now SwiftShader) on cicd. Thanks qarmin.
- 2021-05-03 21:24:38Z fire: https://github.com/godotengine/godot/pull/48410
- 2021-05-03 21:23:55Z fire: PSA - We run godot --doctool in the Linux build, so if you modify the public API but fail to update the documentation, it will throw an error: So remember to run --doctool.
- 2021-05-03 21:20:13Z fire: Fetching 2d IK PR for tomorrow.
- 2021-05-03 21:19:37Z fire: Updated lottie to use zstd packedscene compression because vram compression is bad.
- 2021-05-03 20:28:02Z fire: Trying to see if power of two resize will solve a crash on etcpak compressing for Lottie. It does.
- 2021-05-03 20:19:20Z fire: Updated lottie https://github.com/godot-extended-libraries/lottie/tree/next to use texture compression (1GB to 10MB) and change skipping frames which was cursed to a interpolation scheme where the input is frame rate and not skipped frames.
- 2021-05-03 19:10:40Z fire: Discussed with Lyuma about so many Godot Engine bugs to fix. gdparty (1)
- 2021-05-03 16:06:57Z lyuma: Implemented support for unity binary asset format into Unidot Importer (such as LightingData.asset) - note that the actual data in this file isn't used yet, but now we can parse these files.
- 2021-05-03 12:09:06Z fire: Scheduled a meeting with rafallus about ewibik and working on gltf2 normalization pr.
- 2021-05-02 21:09:57Z fire: > wasm2c: Convert wasm files to C source and header
- 2021-05-02 21:01:10Z fire: There's an discussion about OMI and WASM again.
- 2021-05-02 21:00:18Z fire: Discussed with Tylo#4997 in the OMI server, apparently we're GLTF2 buddies. He worked on glTF2 furniture arrangements with 3d product models.
- 2021-05-02 19:48:53Z fire: Reviewed https://github.com/godotengine/godot/issues/41028 with tokage "Blendspace2D BLEND_MODE_DISCRETE_CARRY freezes or doesn't carry #41028 "
- 2021-05-02 15:10:07Z fire: https://github.com/fire/godot/tree/bc7enc_rdo and https://github.com/simd-everywhere/simde Godot Simd proposal
- 2021-05-02 01:35:12Z fire: Working on nested bone attachments that also have a skeleton
- 2021-05-02 01:27:57Z fire: Lyuma We got bone attachments! 🍖 (1)
- 2021-05-01 22:34:48Z fire: Add a pr. Needs review
- 2021-05-01 18:59:03Z fire: Trying to deal with the case where the weights is [2, 2, 2, 2] [0.7, 0.3, 0.0, 0.0] >.<
- 2021-05-01 16:42:28Z fire: Clamping Nans, -Inf, +Inf in gltf exporter in Godot Engine.
