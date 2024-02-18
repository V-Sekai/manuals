# V-Sekai Changelog - November 2023

## [Released]

### xr-grid

V-Sekai.xr-grid is a VR interaction tool.

- **First release**
- **Release Version**: 0.1.0-rc1
- **Changes**: The game name environment variable has been updated in the build workflow. A new commit was also made to set the draft flag to false for the release.
- [Release Link](https://github.com/V-Sekai/V-Sekai.xr-grid/releases/tag/0.1.0-rc1)

### model_explorer

V-Sekai Model Explorer is a 3D model viewer built with Godot 4. It supports various model formats like VRM and glTF 2.0. With this tool, you can dive deep into the components of a 3D model - inspecting meshes, materials, textures, and animations.

- **First release**
- **Release Version**: v0.2.0-rc2
- **Changes**: The GAME*NAME environment variable value has been changed to "vsekai_model_explorer*". The macos_editor_macos_deploy job from builds.yml has been removed. A README.md for GitHub actions has been added and the warning has been moved to the top of the file.
- [Release Link](https://github.com/V-Sekai/TOOL_model_explorer/releases/tag/v0.2.0-rc2)

## [Unreleased]

### Added

- **MacOS Editor Builds**: MacOS editor builds have been added to the project. ([Commit: df041f0](https://github.com/V-Sekai/v-sekai-game/commit/df041f0))
- **Export Mac Game**: The game can now be exported for Mac. Pending code-signing and App support.
- **Golang Installation**: Golang has been installed in the project. ([Commit: c25456b](https://github.com/V-Sekai/v-sekai-game/commit/c25456b))
- **Unidot Dependency Removal**: The dependency on the post-import script by Unidot has been removed after conversion is complete. This means the converted assets will work standalone without the Unidot importer, with one exception\*.
- **Supported Asset Types**: Supported asset types are listed in the readme. It should support many types of meshes, animations, Standard shader materials, scenes/prefabs and physics objects.
- **Optimization for Generating Tangents in Mikktspace:** An optimization has been added for generating tangents in mikktspace. ([Pull Request #83648](https://github.com/godotengine/godot/pull/83648/files))

### Changed

- **Game Name Variable**: A game name variable has been implemented on Github Actions. ([Commit: 08d87db](https://github.com/V-Sekai/v-sekai-game/commit/08d87db))
- **Godot Engine Repository Update**: The Godot engine repository and reference in build workflows have been updated. ([Commit: f7f609d](https://github.com/V-Sekai/v-sekai-game/commit/f7f609d))
- **Imports Update**: Imports in the project have been updated. ([Commit: 896cb7c](https://github.com/V-Sekai/v-sekai-game/commit/896cb7c))
- **Unidot Beta Release**: Unidot is now in a beta / early RC for the first release.

### Fixed

- Not applicable for this month.

### Deprecated

- Not applicable for this month.

### Removed

- Not applicable for this month.

### Security

- **Security Best Practices**: Applied security best practices as recommended by StepSecurity. ([Commit: d641001](https://github.com/V-Sekai/v-sekai-game/commit/d641001))

This project does not adhere to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Previous Releases]

- Not applicable for this month.

## Misc

- Lyuma, a member of the V-Sekai team, recently attended the Godot Engine Munich 2023 conference.
- Shaders or MonoBehaviors/scripts are not currently supported. This will not be part of the initial release. The goal for now is scene / character / animation conversion.
- AnimationTree uses the standalone runtime/anim_tree.gd script as a blackboard system to simulate unity parameters. This file should remain.
- [Unidot Importer Github Link](https://github.com/V-Sekai/Unidot_Importer)
- A wild spooky dev snapshot appears! 👻 🎃 Contributors are making great progress on solving regressions in Godot 4.2! This new 4.2 beta 4 should be significantly more stable and reliable to upgrade 4.1 projects (not perfect yet though!). [Godot Engine Dev snapshot: Godot 4.2 beta 4](https://godotengine.org/article/dev-snapshot-godot-4-2-beta-4/) We continue iterating quickly on beta snapshots for Godot 4.2 to ensure that we can solve regressions before the stable release.
