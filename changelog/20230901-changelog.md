# V-Sekai Changelog - September 2023

## [Unreleased]

### Added

- Ported RenIK to GDScript, providing a reference implementation and allowing for separation of RenIKPlacement from RenIK as two distinct nodes. This change enables reuse of the foot placement implementation on any other IK system or swapping out the foot placement system for another animation system and then running the IK algorithm independently. The port was challenging due to differences in the Basis APIs between C++ and GDScript. The GDScript code is available at [https://github.com/V-Sekai/renik/tree/gdscript](https://github.com/V-Sekai/renik/tree/gdscript) and can be used instead of the original C++ version at [https://github.com/V-Sekai/renik](https://github.com/V-Sekai/renik). It includes a test scene for use in projects.

## Changed

### Fixed

### Deprecated

- Not applicable for this month.

### Removed

### Security

- Not applicable for this month.

This project does not adhere to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Previous Releases]

- Not applicable for this month.

**Note:** This changelog has been compiled based on the updates provided. For more detailed information, please refer to the specific issues or pull requests in the respective repositories.

## Work in progress

commit dc4754b - (main) Merge pull request #242 from V-Sekai/move-utility
Move the utility folder.

commit f854698 - (main) Merge pull request #241 from V-Sekai/better-svgs
Improve the logos.

commit 5928dee - (main) Merge pull request #239 from V-Sekai/remove-unused-01
Remove unnecessary files and configurations for Mac development in vs code.

commit 8c34654 - (remove-unused-math-utils) Remove unused math utils.

commit 9860967 - (main) Merge pull request #245 from V-Sekai/xr-on
Make xr mode on.

commit 6147202 - (xr-on) Make xr mode on.

commit dc4754b - (main) Merge pull request #242 from V-Sekai/move-utility
Move the utility folder.

commit 83b4490 - (move-utility) Move the utility folder.

commit f854698 - (main) Merge pull request #241 from V-Sekai/better-svgs
Improve the logos.

commit 6519cce - (better-svgs) Improve the logos.

Write a constraint minimizer https://github.com/V-Sekai/v-sekai-game/blob/constraint-minimizer/new_script.gd

Write a github action for godot engine so I can push releases

Update github actions for tagged release. Use the `0.1.0-alpha1` tag.

Investigate https://about.signpath.io/product/open-source for part 2

Launcher https://gist.github.com/fire/e5a16d3e738e8575b8ce7f527c245d27

People are asking about 3d ik so I need to increase the code quality of https://github.com/V-Sekai/renik
