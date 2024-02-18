# V-Sekai Changelog - February 2024

## [Released]

- Not applicable for this month.

## [Unreleased]

### Added

- **2024-02-01**: Spring bones now import with Unidot Importer! It's compatible with various popular formats and supports all features of the vrm spring bone script. Currently no advanced features like axis locks or inside colliders. And while the vrm script supports curves, I did not implement Unity curve sampling yet, so each bone in the chain imports with a constant value.
- **2024-02-06**: Pushed an update to godot-vrm on git to make it easier and more straightforward to edit spring bones in the inspector.
- **2024-02-07**: Made a lot of bugfixes to the VRM import/export, unidot import pipeline, and springbone support. It's getting a lot easier to import a set of assets from unitypackage including booth outfits, attach them, and then export a VRM with functional spring bones!
- **2024-02-15**: ArchVizPro volume 6 imported with ufbx. The importer is exceptionally good, and in my testing it appears to perfectly replicate the result obtained in the autodesk SDK. This means Unidot in Godot 4.3 will be able to import directly to fbx out of the box without having to go through gltf!

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
