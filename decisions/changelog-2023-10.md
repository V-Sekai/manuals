# V-Sekai Changelog - October 2023

## [Unreleased]

### Added

- Lyuma has pushed support to GodotEngine Unidot-Importer for humanoid unity .anim import including lox9973's center of mass correction for hips. [#gamedev](https://vxtwitter.com/Lyuma2d/status/1718394964109935094)
- Humanoid anim support is complete, including arm/leg twist! Import of standalone Avatar assets is now functional (such as converted VRM files).
- Unpacked avatar prefabs are now extracted into their own scenes.

### Changed

- Updated `casync` for `v-sekai-game`. This is still using the old version binaries.

```bash
git clone https://github.com/V-Sekai/casync-v-sekai-game.git
cd casync-v-sekai-game
./extract.sh
```

### Fixed

- Fixed an issue with GLTF images being referenced directly instead of going through the GLTFState.textures mapping. This was causing texture mis-matches on some VRMs when loaded. The fix involved passing the GLTF state into a few more functions, replacing the image list, so we could also access the textures mapping directly alongside them. ([#82](https://github.com/V-Sekai/godot-vrm/pull/82))

### Deprecated

- Not applicable for this month.

### Removed

- Not applicable for this month.

### Security

- Not applicable for this month.

This project does not adhere to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Previous Releases]

- Not applicable for this month.

## Misc

- Convinced PolygonJS to change their license to the MIT license.
- Reviewed a character generator with OMI and JIN
- Discussed svg in gltf at OMI
- Proposed feature request to add an extractor to save 3d assets, gltf files, CAD files, shapefiles, STLs, etc to ArchiveBox. [Issue #668](https://github.com/ArchiveBox/ArchiveBox/issues/668)
- Discovered a method of json document sync. [JsonJoy](https://jsonjoy.com/)

## Quotes of the month

> "The term logbook originated with the ship's log, a maritime record of important events in the management, operation, and navigation of a ship. The captain was responsible for keeping a log, as a minimum, of navigational wind, speed, direction and position." - Wikipedia
