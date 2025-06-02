# V-Sekai Changelog - 2022-12

This is the changelog for December 2022.

# 2022-12-05

- Restored AEC3 to speech for echo cancellation.

# 2022-12-06

- (chibifire) Reorganized V-Sekai game issues and proposal repository: bugs to `V-Sekai/v-sekai-game`, enhancements to `V-Sekai/V-Sekai.github.io`.
- (lyuma) Godot Speech now includes echo cancellation using WebRTC AEC3 (thanks to @iFire).

# 2022-12-12

- (MMMaellon) Updated V-Sekai game FOV to 70.
- (Lyuma, Saracen, fire, Tokage) Animation meeting discussing open issues, extending/overriding AnimationNode classes. Agreed to punt SkeletonModificationStack3D to 4.1 and remove from 4.0 due to bugginess.

# 2022-12-14

- **02:42 AM (lyuma):** Implemented oblique clipping plane for screenspace mirrors.
  ![oblique clipping plane for screenspace mirrors](attachments/Screenshot_Wed_Dec_14_02-39-03_2022_VR.png)
- **04:12 AM (lyuma):** Shared engine patch for projection override ([V-Sekai/godot/tree/override_projection](https://github.com/V-Sekai/godot/tree/override_projection)) and VR Demo branch for screenspace mirror ([V-Sekai/avatar_vr_demo/tree/screenspace_mirror](https://github.com/V-Sekai/avatar_vr_demo/tree/screenspace_mirror)).

# 2022-12-16

- **08:04 AM (chibifire):** Updated staging V-Sekai engine build with mirror and projection override patches; awaiting multiplayer test.
- **08:26 AM (chibifire):** Wrote proposal for resource migration scheme ([Godot Proposals #5945](https://github.com/godotengine/godot-proposals/issues/5945)).
- **09:05 AM (chibifire):** Switched staging V-Sekai engine build to `groups-4.x` branch and updated some game code.
- **11:34 AM (chibifire):** Added the CC0 hut (without mirrors) to a map/project.

# 2022-12-17

- **08:06 AM (chibifire):** Fixed hand T-pose: open palm now faces the ground.
- **08:06 AM (chibifire):** Confirmed posing system is working (video shared, pre-palm fix).

# 2022-12-18

- **12:29 PM (chibifire):** Lasso interaction implemented: can pull and hold physics objects (e.g., basketball).

# 2022-12-20

- **01:34 PM (chibifire):** Lasso interaction now initiated by OpenXR trigger action.
- **01:35 PM (chibifire):** Fixed issue with duplicate lassos caused by duplicate main menus.
- **05:40 PM (lyuma):** Shared Godot Engine article on the status of the OpenGL renderer ([Link](https://godotengine.org/article/status-of-opengl-renderer)).
- **06:09 PM (chibifire):** Shared demo videos from Monday (2022-12-19) showcasing recent progress; control sensitivity improved later.

# 2022-12-27

- **06:43 AM (chibifire):** Created and shared videos for Many Bone IK development over the holidays ([V-Sekai/many_bone_ik](https://github.com/V-Sekai/many_bone_ik)).
