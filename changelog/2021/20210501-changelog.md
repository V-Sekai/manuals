# V-Sekai Changelog - May 2021

This changelog is based on development updates from May 2021.

## 2021-05-31

- **02:10 PM (chibifire):** @Lyuma Merged [Godot PR #49120](https://github.com/godotengine/godot/pull/49120) (Backport glTF module with scene export support).
- **02:28 PM (chibifire):** Discussion with Haagch on OpenXR port for Godot 4, specifically on handling `VkInstance` and `VkPhysicalDevice` between the plugin and engine.
- **11:25 PM (lyuma):** Tweeted about the V-Sekai VRM Importer and MToon Shader release for Godot 3 ([Twitter Link](https://twitter.com/VSekaiOfficial/status/1399608449101484032)).

## 2021-05-30

- **03:58 AM (lyuma):** Submitted "VRM Importer and MToon Shader" to Godot Asset Library ([Asset #964](https://godotengine.org/asset-library/asset/964), [Issue #14](https://github.com/V-Sekai/godot-vrm/issues/14#issuecomment-850979766), [Video](https://www.youtube.com/watch?v=M7psmdcDHAo)).
- **05:58 AM (chibifire):** V-Sekai released the VRM addon ([Asset #964](https://godotengine.org/asset-library/asset/964)).

## 2021-05-29

- **09:59 AM (lyuma):** Ported Godette-Chan model to VRM format while working on a tutorial video and icon for Godot-VRM.
- **10:06 AM (lyuma):** Shared current version of Godette-Chan VRM model, created in Blender with some Unity setup for shader parameters and springbones.
- **10:09 AM (lyuma):** Debugging issue with MToon outlines in MixedLight mode; planning to demonstrate VRoid Studio character export.
- **10:13 AM (lyuma):** Fixed bugs and implemented anonymous skin joints for VRM importer to include all humanoid and springbones. GDNative glTF plugin build working in CI/CD for multi-platform support.
- **10:52 AM (chibifire):** Requested Ubuntu LTS version for CI/CD test matrix for Godot-VRM, in addition to Fedora.
- **03:08 PM (chibifire):** Identified bug in LOD on integer locations; requested assistance.
- **05:57 PM (chibifire):** Merged LOD fix ([Godot PR #49197](https://github.com/godotengine/godot/pull/49197)).

## 2021-05-28

- **01:45 PM (chibifire):** Shared [SourcetrailDotnetIndexer](https://github.com/packdat/SourcetrailDotnetIndexer) with @Lyuma and @初音ミク for .NET assembly visualization.
- **02:15 PM (chibifire):** Investigating "CMValley_to_Godot_Demo" open content map.
- **02:53 PM (lyuma):** Updated godot-cpp due to `godot_headers` rename; fixed SConstruct and clang errors for glTF GDNative plugin.
- **03:45 PM (chibifire):** Organized work on the CMValley Godot Demo.

## 2021-05-27

- **11:45 AM (chibifire):** Discussed creating a realistically lit 3D game environment in Godot Engine.
- **11:24 PM (chibifire):** Conducted glTF code review.

## 2021-05-26

- **02:25 AM (lyuma):** Successfully ported glTF module to GDNative; VRM module now runs in Godot 3.3-stable. Export functionality is untested due to bugs.
- **03:38 AM (lyuma):** Tweeted about the VRM model importer for stable Godot Engine builds (3.2.2+) using GDNative for glTF support ([Twitter Link](https://twitter.com/Lyuma2d/status/1397501932827078658)).
- **10:43 AM (chibifire):** Shared OMI group values, to which V-Sekai contributed.
- **02:17 PM (chibifire):** Tokage improved Skeleton Gizmos (color choices, depth shadow bugfix).
- **02:43 PM (lyuma):** Filed glTF bugs ([Godot #49111](https://github.com/godotengine/godot/issues/49111), [Godot #49118](https://github.com/godotengine/godot/issues/49118)) and PRs ([Godot #48915](https://github.com/godotengine/godot/pull/48915), [Godot #49119](https://github.com/godotengine/godot/pull/49119), [Godot #49120](https://github.com/godotengine/godot/pull/49120)).

## 2021-05-24

- **08:37 AM (chibifire):** Collaborated with Hutty to transfer glTF export technology to his voxel drawing tool.
- **11:08 AM (saracenone):** Progress on asset validation layer; outlined remaining issues (mesh/collider layers, value tracks, UI elements, error reporting, cyclic dependencies, scene embedding, web scene checks).
- **11:13 AM (chibifire):** Evaluating curve fitter from Maya2glTF ([fire/Maya2glTF/tree/reducer-fire](https://github.com/fire/Maya2glTF/tree/reducer-fire)).

## 2021-05-23

- **05:55 PM (chibifire):** Pitching features for funding: Full glTF2/VRM pipeline, VRM retargeting system (BVH encoding), Basis Universal in glTF2, Quads in glTF2, Quad-based mesh simplification/LODs.
- **05:56 PM (chibifire):** Pitching USDZ support after Godot 4.0.

## 2021-05-22

- **09:23 AM (chibifire):** Meshoptimizer update and LOD normals fix merged ([Godot PR #47764](https://github.com/godotengine/godot/pull/47764/files)).

## 2021-05-21

- **03:29 PM (chibifire):** Discussed V-Sekai wider testing with Lyuma and Saracen, blocked by scene validation feature. Also, ability to post more tweets.
- **03:51 PM (lyuma):** Worked with @iFire on glTF debugging. Proposed approaches for glTF skeleton issues (radical parser change for 4.x, BoneAttachments for 3.x, or specific case handling in `_determine_skeletons`). Identified bugs related to SkinnedMesh animation, fake_joints, and missing mesh nodes in specific glTF files.
- **04:31 PM (chibifire):** Discussed QR/DataMatrix code for 15-frame animation encoding ([lox9973.com/ShaderMotion/player-gltf.html](https://lox9973.com/ShaderMotion/player-gltf.html)) and OBS script for data reading.
- **07:30 PM (chibifire):** Investigating V-Sekai compilation for JavaScript.

## 2021-05-20

- **08:26 AM (chibifire):** @Lyuma: IK and Modification stack are now a stacked branch.
- **08:28 AM (chibifire):** @トカゲ: Cleaned up, rebased skeleton-gizmos feature branch on modification stack, and changed selected bone color ([godot-extended-libraries/godot-fire/commits/features/skeleton-gizmos](https://github.com/godot-extended-libraries/godot-fire/commits/features/skeleton-gizmos)).

## 2021-05-19

- **07:37 AM (chibifire):** Resolved Linux RPM database issue, enabling WSL2 to work again.
- **12:20 PM (chibifire):** OMI Week 3: Attended talk, discussed OMI Identity with Robert Long, and lack of open-source OpenXR mobile client ([OMI Issue #36 comment](https://github.com/omigroup/OMI/issues/36#issuecomment-844392614)). Lyuma and chibifire summarized concerns about implementation ease and off-the-shelf code usability.
- **09:21 PM (chibifire):** Worked with Lyuma on glTF bug fixes: failing only once for mesh errors, skin duplication removal bug (check skin bind bone/name, pose transform), removed skin bind code, backported glTF 4.0 modules to 3.2.

## 2021-05-18

- **07:01 AM (chibifire):** @Lyuma: Discussed runtime glTF in Godot XR channel; potential political difficulty for merging, focusing on glTF export bug fixes instead.
- **07:43 AM (chibifire):** Posted last revision of runtime export ([godot-extended-libraries/godot-fire/tree/extended-fire-master-runtime-gltf](https://github.com/godot-extended-libraries/godot-fire/tree/extended-fire-master-runtime-gltf)).
- **07:46 AM (chibifire):** GSOC 2021 started; mentoring Theoway on Visual Script node organization.
- **10:41 AM (chibifire):** Outlined coordination problems for V-Sekai 4.x: merge script name, V-Sekai/godot branch name, initial patch set for Godot master.
- **11:32 AM (chibifire):** Defined `groups-4.x` branch structure for V-Sekai Godot Engine Repo and `merge-script-4.x` for groups_merge_script Repo, listing required patches and features.

## 2021-05-17

- **08:48 PM (chibifire):** Worked with Lyuma and Tim on MotionShader to glTF2 ([HackMD Link](https://hackmd.io/@tI5OkracQhuas5Kjh-kG0g/S1uzKIgt_/edit)).

## 2021-05-16

- **08:11 AM (chibifire):** Brainstorming a general intermediate animation format, not tied to exact bone joint orientations.
- **09:15 AM (chibifire):** Thanked @lox9973 for providing training data for pose motion transfer tests ([YouTube Playlist](https://www.youtube.com/playlist?list=PLmwqDOin_Zt4WCMWqoK6SdHlg0C_WeCP6)).
- **02:11 PM (lyuma):** Developed a custom shader inspector using `EditorInspectorPlugin`.
- **02:19 PM (chibifire):** Confirmed ability to process a massive dataset thanks to @lox9973.
- **03:17 PM (chibifire):** Submitted Blender glTF bug report ([glTF-Blender-IO Issue #1392](https://github.com/KhronosGroup/glTF-Blender-IO/issues/1392)).
- **03:22 PM (chibifire):** Found workaround for Blender glTF bug: import into Godot and re-export as GLB.
- **03:58 PM (saracenone):** Fixed runtime switching of VR/flat modes, including avatar pose and VR controller issues.
- **05:07 PM (saracenone):** Additional fixes to XR switching; added ability to alter real-world height at runtime.

## 2021-05-15

- **07:33 AM (lyuma):** Pushed update to Godot-VRM for Godot 3.x (`gd3` branch), pending finalization ([V-Sekai/godot-vrm/tree/gd3](https://github.com/V-Sekai/godot-vrm/tree/gd3)).
- **07:36 AM (lyuma):** Planning to wipe history on `V-Sekai/godot-vrm` to remove large binary files.
- **04:15 PM (chibifire):** Testing animation retargeting software from Blender ecosystem with Jin's VRM and Perfume dance BVH motion.
- **06:13 PM (lyuma):** Nearing release of import-only VRM addon for Godot; requested feedback.
- **06:16 PM (lyuma):** Godot-VRM branches: `godot3` (Godot 3.3, no runtime patches, editor needs glTF module), `master` (Godot 4.x, no runtime patches, editor needs two engine fixes).
- **10:53 PM (chibifire):** Investigating ShaderMotion for creating a shader-based motion player, following ability to convert animations to various skeleton formats.

## 2021-05-14

- **08:00 AM (saracenone):** Fixed bugs for VR/flat mode runtime switching; some avatar issues remain.

## 2021-05-13

- **10:48 AM (chibifire & Lyuma):** Discussion about Jin's proposal to re-rig OBJ models into VRM.
- **11:14 AM (chibifire):** Link to [V-Sekai/vox-to-vrm](https://github.com/V-Sekai/vox-to-vrm).
- **02:36 PM (lyuma):** Unidot Importer: Imported lighting, basic environment settings, audio, cameras, and reflection probes for Traveler's Rift; light baking now possible post-import.
- **06:33 PM (chibifire):** Explored VOX to VRM autorigging for static humanoid meshes.

## 2021-05-12

- **04:34 PM (chibifire):** OMI meeting: OKR review, progress difficult.
- **05:48 PM (chibifire):** Reviewed Basis Universal version update PR ([Godot #46568](https://github.com/godotengine/godot/pull/46568)).
- **07:47 PM (saracenone):** Fixed RenIK crashing (null skeleton assignment issue).
- **08:14 PM (saracenone):** Added patch to RenIK for direct bone ID assignment; avatars with in-between bones now usable.
- **09:26 PM (chibifire):** Rebased Godot 4.0 stack for VRM viewer work.
- **11:35 PM (saracenone):** Tweaked wrist span calculation for more accurate VR proportions on misaligned arm avatars.

## 2021-05-11

- **06:49 AM (lyuma):** Fixed EWBIK issue where results depended on root bone identity transform by transforming tip/target headings by inverse root transform.
- **08:38 AM (chibifire):** Inquired about Vive Con news.

## 2021-05-10

- **10:21 AM (chibifire):** Evaluated EWBIK with Motion Retargeting; suggestions made, but EWBIK too broken for conclusions.
- **08:32 PM (chibifire):** Debugged EWBIK extensively with Eron, removing hacks to reveal core issues for rebuilding.

## 2021-05-09

- **07:34 AM (chibifire):** Saracen/Lyuma suggested `hint_string` for skeleton bone attachment to get a filtering tree popup for bone selection.
- **09:08 AM (chibifire):** Many patches from @トカゲ merged.
- **10:22 AM (saracenone):** Added support for ordered grid super sampling and camera position-based billboarding with help from @Silent and @Lyuma.
- **03:31 PM (chibifire):** Designing system for creating IK targets from another skeletal animation using bone attachments and correction nodes.
- **07:48 PM (chibifire):** Working with Eron on EWBIK; next meeting scheduled.

## 2021-05-08

- **03:42 AM (lyuma):** Imported @Waai!'s Traveler's Rift using Unidot, including collision meshes and light sources (custom shaders like skybox not ported).
- **03:48 AM (lyuma):** Manually added WorldEnvironment and tweaked light attenuation for Traveler's Rift import.
- **08:45 AM (saracenone):** Fixed bugs with Collada importer.
- **08:46 AM (saracenone):** Collada semantics fix branches: [3.x](https://github.com/SaracenOne/godot/tree/collada_semantics_fix_3), [4.0](https://github.com/SaracenOne/godot/tree/collada_semantic_fix_4_0).

## 2021-05-07

- **04:08 AM (chibifire):** EWBIK todo: Dampening for natural pose, stabilization for constraint violation (stabilization after constraints implemented).
- **06:51 AM (chibifire):** Implemented EWBIK bone dampening.
- **11:28 PM (lyuma):** Set up Matrix server and federation; outlined next steps (godot-matrix interop, setup simplification, Matrix use cases).
- **11:55 PM (chibifire):** Chatted with Humbletim about importing existing armature into EWBIK Java.

## 2021-05-06

- **08:45 AM (chibifire):** Received reply from Glitchtip; use case generation required.

## 2021-05-05

- **05:52 AM (lyuma):** Akien arguing against [Godot PR #48014](https://github.com/godotengine/godot/pull/48014) (expose `set_surface_material` and `set_editable_instance`).
- **05:53 AM (lyuma):** Godot VRM master branch up-to-date with Godot master (4.x) after PR and GDScript bug workaround; working on 3.x backports.
- **11:28 AM (chibifire):** Planning to show EWBIK changes to @Lyuma.
- **02:29 PM (chibifire):** Added better UI for creating effectors (targets and pins) in EWBIK.

## 2021-05-04

- **05:55 AM (chibifire):** Porting [fire/godot/tree/2d-ik](https://github.com/fire/godot/tree/2d-ik); needs input from Pouley.
- **05:59 AM (chibifire):** Working on merging Tokage's PRs ([Godot #48332](https://github.com/godotengine/godot/pull/48332) - discrete carry, [Godot #48375](https://github.com/godotengine/godot/pull/48375)).
- **06:01 AM (chibifire):** Requested @Saracen to respond to wave importer review ([Godot PR #47389 comment](https://github.com/godotengine/godot/pull/47389#issuecomment-830588813)).
- **07:52 AM (chibifire):** EWBIK next steps: Stiffness constraint (bone rotation preference), Kusudama constraint (rotation/twist limits).
- **09:15 AM (chibifire):** Debugged EWBIK with Eron; no conclusions.
- **09:34 AM (chibifire):** Discovered [Pixie Labs](https://pixielabs.ai/) (Apache 2 CNCF project for eBPF-based system probing).
- **03:02 PM (chibifire):** Realized parent-to-child was not enabled for EWBIK.

## 2021-05-03

- **05:09 AM (chibifire):** Scheduled meeting with Rafallus about EWBIK; working on glTF2 normalization PR.
- **09:06 AM (lyuma):** Implemented Unity binary asset format support in Unidot Importer (e.g., `LightingData.asset`).
- **12:10 PM (chibifire):** Discussed Godot Engine bug fixing with Lyuma.
- **01:19 PM (chibifire):** Updated Lottie ([godot-extended-libraries/lottie/tree/next](https://github.com/godot-extended-libraries/lottie/tree/next)) with texture compression and frame interpolation.
- **01:28 PM (chibifire):** Confirmed power-of-two resize fixes `etcpak` crash for Lottie.
- **02:19 PM (chibifire):** Updated Lottie to use ZSTD PackedScene compression.
- **02:20 PM (chibifire):** Fetching 2D IK PR.
- **02:23 PM (chibifire):** PSA: Run `godot --doctool` after modifying public API to avoid documentation errors in Linux build.
- **02:25 PM (chibifire):** Godot Vulkan now runs SwiftShader (software renderer) on CI/CD (thanks Qarmin).
- **06:29 PM (chibifire):** EWBIK meeting with Rafallus: Discussed instability with close/multiple targets, Kusudama constraints, and disabling constraints in Java demo.

## 2021-05-02

- **08:10 AM (chibifire):** Godot SIMD proposal with [fire/godot/tree/bc7enc_rdo](https://github.com/fire/godot/tree/bc7enc_rdo) and [simd-everywhere/simde](https://github.com/simd-everywhere/simde).
- **12:48 PM (chibifire):** Reviewed [Godot Issue #41028](https://github.com/godotengine/godot/issues/41028) (BlendSpace2D discrete carry issue) with Tokage.
- **02:00 PM (chibifire):** Discussed glTF2 with Tylo#4997 (OMI server); Tylo worked on glTF2 furniture arrangements.
- **02:01 PM (chibifire):** OMI and WASM discussion ongoing.
- **02:09 PM (chibifire):** Noted `wasm2c`: Convert WASM files to C source and header.

## 2021-05-01

- **09:42 AM (chibifire):** Clamping NaNs, -Inf, +Inf in Godot Engine glTF exporter.
- **11:59 AM (chibifire):** Dealing with weight issues like `[2, 2, 2, 2] [0.7, 0.3, 0.0, 0.0]`.
- **03:34 PM (chibifire):** Submitted a PR needing review.
- **06:27 PM (chibifire):** @Lyuma: Bone attachments implemented.
- **06:35 PM (chibifire):** Working on nested bone attachments that also have a skeleton.
