# V-Sekai Changelog - February 2024

## [Released]

- Not applicable for this month.

## [Unreleased]

### Added

- **UFBX Importer**: Merged into Godot Engine master for version 4.3.
- **Unidot Spring Bones**: Spring bones now import with Unidot Importer! It's compatible with various popular formats and supports all features of the vrm spring bone script. Currently no advanced features like axis locks or inside colliders. While the vrm script supports curves, Unity curve sampling has not been implemented yet, so each bone in the chain imports with a constant value.
- **godot-vrm**: An update to godot-vrm on git has been pushed to make it easier and more straightforward to edit spring bones in the inspector.
- **Unidot**: A lot of bugfixes have been made to the VRM import/export, unidot import pipeline, and springbone support. It's becoming a lot easier to import a set of assets from unitypackage including booth outfits, attach them, and then export a VRM with functional spring bones!
- **Godot FBX Importer**: ArchVizPro volume 6 imported with ufbx. The importer is exceptionally good, and during testing it appears to perfectly replicate the result obtained in the autodesk SDK. This means Unidot in Godot 4.3 will be able to import directly to fbx out of the box without having to go through gltf!
- **godot-whisper**: Added support for real-time audio transcription within the Godot Engine, which includes enhanced compatibility for the Metal API on Apple devices and improved threading performance. (Commit: 2d85a0e update)
- **godot-steamaudio**: Updated the Steam Audio integration by refactoring the build configuration and audio stream handling process. (Commit: 8f15de1 Refactor build configuration)

### Changed

- Remove a V-Sekai-game github release and point to <https://saracenone.itch.io/groups-4x>

### Fixed

- **2024-02-07**: There was a nasty bug involving the springbone gizmo, a node rename, and a Godot bug that would corrupt the node if replace_by was called on an internal node (such as a gizmo) that was leading random meshes to disappear in godot vrm during import. Should be fixed now!

### Deprecated

- Not applicable for this month.

### Removed

- Not applicable for this month.

### Security

- **Security Best Practices**: Applied security best practices as recommended by StepSecurity. ([Commit: d641001](https://github.com/V-Sekai/v-sekai-game/commit/d641001))

This project does not adhere to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Previous Releases]

- Not applicable for this month.
