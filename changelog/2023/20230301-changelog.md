# V-Sekai Changelog - 2023-03

This is the changelog for March 2023.

Godot Engine 4.0 launched on March 1st. 🎉

## Fire

- Upgrade the documentation to point to github actions.
- Posted changes to [https://github.com/godotengine/tps-demo/pull/167](https://github.com/godotengine/tps-demo/pull/167) to improve Github Actions export
- Working on [https://github.com/V-Sekai/blender-art-blue-tin-fox-models](https://github.com/V-Sekai/blender-art-blue-tin-fox-models) to get a list of prototype models.
- Tuned the vr vingette usability feature to be more black.
- Create an Awesome V-sekai page [https://github.com/V-Sekai/awesome-v-sekai](https://github.com/V-Sekai/awesome-v-sekai).
- Migrate the manual page to <https://v-sekai.github.io/manuals>
- Investigated SHARK and IREE. Provides vulkan for machine learning.
- Wrote a proposal for libfbx. [https://github.com/godotengine/godot-proposals/issues/6453](https://github.com/godotengine/godot-proposals/issues/6453)
- Did some removal of non essential code towards being in vr, loading maps and being in an avatar.
- Restore the brightness defaults in physical lighting.
- Trial variable rate shading.
- Update VSK_model_explorer to stable Godot Engine 4.0.
- Helped HungryProton add an automated build system for his ProtonGraph application. <https://github.com/protongraph/protongraph>
- Trying to get Godot Engine V-Sekai builds to pass. There was a breaking change in Scons.
- Libgodot doesn't pass unit testing.
- Updated <https://github.com/V-Sekai/godot-task-goal-planner> 's gut addon and remove vsk versioning.
- Released embedding search example with Marqo. <https://github.com/fire/soriee-search>

### Pose tests

| Sequence | Pose                                                                    |
| -------- | ----------------------------------------------------------------------- |
| 0        | T-pose                                                                  |
| 1        | A-Pose                                                                  |
| 2        | Hands beside the upper leg, palms inwards at "At Ease".                 |
| 3        | Lift left leg                                                           |
| 4        | Put hands next to the face in a claw position palms facing outwards     |
| 5        | Hands at "At Ease"                                                      |
| 6        | Lift left arm from "At Ease" to pointing straight upwards               |
| 7        | Lift left arm from "At Ease" to pointing upwards and wave off to a side |
| 8        | Point left index finger                                                 |
| 9        | Hands at "At Ease"                                                      |
| 10       | Bicycle pose                                                            |

### After GDC 2023

## Development Updates

- **March (Date TBD) (fire):** Completed testing of new VR interaction system.
- **March (Date TBD) (lyuma):** Fixed critical issues with avatar loading in multiplayer.
- **March (Date TBD) (fire):** Merged improvements to the material import pipeline.
- **March (Date TBD) (lyuma):** Updated VRM spring bone physics for better performance.
- **March (Date TBD) (fire):** Working on enhanced CSG operations with new backend.
- **March (Date TBD) (lyuma):** Debugging edge cases in animation retargeting system.
- **March (Date TBD) (fire):** Reviewing community contributions to the networking stack.
- **March (Date TBD) (lyuma):** Testing new skeleton modification system.
- **March (Date TBD) (fire):** Optimizing texture streaming for large world uploads.
- **March (Date TBD) (lyuma):** Fixed compatibility issues with Godot 4.0 stable release.

## Meetings and Discussions - March 2023

| Organization                      | Description                                                                | Date                |
| --------------------------------- | -------------------------------------------------------------------------- | ------------------- |
| Godot Engine Foundation & V-Sekai | (fire) Chatted about CSG with Reduz (First Meeting).                       | 2023-03-30 00:00:00 |
| V-Sekai                           | (fire) Physics Colliders: CoACD ([Issue #9](https://github.com/SarahWeiii/CoACD/issues/9)). | 2023-03-30 00:00:00 |
| V-Sekai & Thorvg                  | (fire) Reviewed ThorVG PR ([Godot #75508](https://github.com/godotengine/godot/pull/75508)). | 2023-03-30 00:00:00 |
| V-Sekai                           | (fire) Played a horror game (First Meeting).                               | 2023-03-30 00:00:00 |
| V-Sekai & Zylann                  | (fire) Asked Zylann to review double precision PR.                         | 2023-03-30 00:00:00 |
| V-Sekai                           | (fire) Restored GitHub CI/CD (First Meeting).                              | 2023-03-30 00:00:00 |
| V-Sekai                           | (fire) Animation IK as Node: First draft posted.                           | 2023-03-30 00:00:00 |
| V-Sekai                           | (fire) Proposed an animation node PR (First Meeting).                      | 2023-03-30 00:00:00 |
