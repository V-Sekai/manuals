# V-Sekai Changelog - April 2021

This changelog is based on development updates from April 2021.

## 2021-04-30

- **08:42 AM (chibifire):** Proposal design for MaterialX Principled BSDF to Blender Principled BSDF, then to Blender surface. Output to FBX/GLTF2 textures, with future MaterialX glTF2 extension.

## 2021-04-29

- **10:36 AM (chibifire):** Audio Meeting Summary:
  - Design Approved (Juan to Propose): Play scheduled notes/metronome ([Gist](https://gist.github.com/fire/b9ed7853e7be24ab1d5355ef01f46bf1), [Example](https://youtu.be/JEIb0jXcDPA?list=PLQfcaH6N9nlotFGh4WLbGIFf2ijwzA9W1&t=63)).
  - Postponed: Modular audio system (like JACK) ([Godot #35613](https://github.com/godotengine/godot/issues/35613)).
  - Interest: Integrate interactive music PR ([Godot #32769](https://github.com/godotengine/godot/pull/32769)).
  - Interest: Discuss audio stream graph.
  - Approved: Onboarding for new Godot audio developers.
  - Interest: Godot Audio Graph (mixing/effect chain reuse, area interaction).
  - Interest: Pure-Data Audio Graph.
- **11:06 PM (chibifire):** Prototyped GDNative plugin for HTC Facial tracker in Godot 3.x ([V-Sekai/godot-vive-pro-eye](https://github.com/V-Sekai/godot-vive-pro-eye)).
- **11:06 PM (chibifire):** Proposed GLTF2 extension for MaterialX in three stages.
- **11:47 PM (chibifire & Lyuma):** Discussion: MaterialX in glTF could generalize KHR_materials_variants for texture baking at load time for customization.

## 2021-04-28

- **04:21 AM (chibifire):** Investigating [mit-plv/fiat-crypto](https://github.com/mit-plv/fiat-crypto) for edcurve support.
- **05:22 AM (lyuma):** Filed issue [Godot #48265](https://github.com/godotengine/godot/issues/48265) (deadlock in multithreaded .obj importer).
- **09:41 AM (chibifire):** Reviewed server documentation.
- **11:24 AM (chibifire):** Organized files in [V-Sekai/godot-hop-spin-dance](https://github.com/V-Sekai/godot-hop-spin-dance) animation player application.
- **12:52 PM (chibifire):** Lyuma to add a boolean option in VRM import to prevent `.res` file generation (due to large size affecting Git).
- **04:31 PM (lyuma):** Noted need to report bug: editor fails to load scripts on project load, requiring restart or manual script edits.
- **06:56 PM (chibifire):** Discussions in OMI group regarding MaterialX, USDZ, and WASM.

## 2021-04-27

- **10:19 AM (chibifire):** Debugging SVG import for UI ([Godot Issue #48243](https://github.com/godotengine/godot/issues/48243)); closing material import PRs ([Godot PR #48167 comment](https://github.com/godotengine/godot/pull/48167#issuecomment-827757392)).
- **10:21 AM (chibifire):** Explored using IPFS Go binary to make Godot an IPFS server ([fire/godot-ipfs](https://github.com/fire/godot-ipfs)).
- **10:31 AM (chibifire):** Reviewing Play Scheduled proposal ([Gist](https://gist.github.com/fire/b9ed7853e7be24ab1d5355ef01f46bf1)); Audio meeting scheduled; updating `play-scheduled` branch.
- **10:38 AM (chibifire):** Holo display delivery expected in May ([Kickstarter Update](https://www.kickstarter.com/projects/lookingglass/looking-glass-portrait/posts)).
- **10:41 AM (chibifire):** Reviewing WebP as default lossless compression for Godot Engine ([Godot PR #47835](https://github.com/godotengine/godot/pull/47835)).
- **10:42 AM (chibifire):** Decision made to close GIF/APNG import in Godot due to consensus ([Godot Proposals #1433](https://github.com/godotengine/godot-proposals/issues/1433)).
- **10:44 AM (chibifire):** Awaiting 3D print for HTC Facial tracker testing with [FAU-Inf2/godot-vive-pro-eye](https://github.com/FAU-Inf2/godot-vive-pro-eye) ([Reddit Link](https://www.reddit.com/r/ValveIndex/comments/mdw5i6/test_subjects_needed_for_vive_facial_tracker/)).
- **10:57 AM (chibifire):** Updated `play-scheduled` branch ([fire/godot/tree/play-scheduled](https://github.com/fire/godot/tree/play-scheduled)) and demo ([fire/godot-schedule-play-demo](https://github.com/fire/godot-schedule-play-demo)).
- **11:38 AM (chibifire):** Addressed glTF import issue ([Godot Issue #48247](https://github.com/godotengine/godot/issues/48247)) with @Lyuma.
- **12:30 PM (chibifire):** Scheduled meeting with Rafallus about EWBIK.
- **12:42 PM (chibifire):** Arranged meeting with Pouley regarding Physics and Skeleton Modification Stack 3D.
- **02:34 PM (chibifire):** @トカゲ recommended Motoya font for the "Hop, Spin, and Dance" application.
- **03:43 PM (lyuma):** Started bisecting `@export` resource bug; identified commit `160c260` ([GDScript: Allow export of enum variables]) as responsible ([Godot Issue #48224 comment](https://github.com/godotengine/godot/issues/48224#issuecomment-827975641)).
- **03:48 PM (chibifire):** Ported Godot IPFS demo to Windows and created a video ([fire/godot-ipfs release v0.0.1](https://github.com/fire/godot-ipfs/releases/tag/v0.0.1)).
- **06:04 PM (chibifire):** **Pouley Topics:** Discussed 2D IK for 3D IK (Skeleton Modification Stack), vertex painting, @トカゲ's bone subgizmos, glTF2 quads, and subdivision surface UV issues.
- **06:06 PM (chibifire):** **Other Pouley Topics:** Multithreaded physics PR, Pouley's bug-fixing plans and contributor status.
- **06:07 PM (chibifire):** **Godot Physics (Pouley):** Vertex painter for softbody physics.
- **06:28 PM (chibifire):** **Lyuma Topics:** N-gon encoding for glTF/VRM ([glTF PR #1620](https://github.com/KhronosGroup/glTF/pull/1620), [Blender-IO PR #622](https://github.com/KhronosGroup/glTF-Blender-IO/pull/622)).
- **06:28 PM (chibifire):** **Lyuma Topics:** Proposal for soft body creation usability.
- **06:32 PM (chibifire):** **Lyuma Topics:** Normal seam problem.
- **06:34 PM (lyuma):** Lyuma: Revising Softbody weight painting architecture.
- **06:35 PM (lyuma):** Lyuma: Current Softbody architecture (100% weight to single bone) can cause seams.
- **06:36 PM (lyuma):** Lyuma: Planning Softbody architecture proposal this week.
- **06:37 PM (chibifire):** Announced Godot Engine developers' Live Q&A (April 29th).
- **06:50 PM (chibifire):** Reduz updating TPS demo for Godot 4.0.
- **09:29 PM (lyuma):** @iFire filed [Godot Issue #48255](https://github.com/godotengine/godot/issues/48255) (rendering server custom format issue).
- **10:25 PM (lyuma):** Filed [Godot Issue #48257](https://github.com/godotengine/godot/issues/48257) (infinite loop in `reimport_files`).
