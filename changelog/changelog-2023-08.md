# V-Sekai Changelog - August 2023

## [Unreleased]

### Added

- Basisu (ktx2) for gltf was merged to allow compressing the textures to KTX2, which is GPU compatible and has a very small size. Our project also deals with hundreds and thousands of models placed in one scene, making the file size of each model crucial.
- RechieKho Integrated the iree.gd library with Godot game engine and allows Godot projects to leverage IREE for machine learning workflows.
    - Addition of Godot image <-> IREE buffer view conversion utilities
    - Exposure of IREE workflow
    - Addition of Godot demos showing IREE integration
- Recreated [Architext demo](https://huggingface.co/spaces/ifire/Architext_deployed) for testing apartment blueprint generation.
- **Godot VRM** has been submitted to the asset library for 4.x by Lyuma on 2023-08-03. It's now usable and most bugs have been fixed. One known issue is that node constraints have some issues on models which were retargeted (needed bone rotation). If anyone wants to play with godot-vrm, feel free to clone it from github: it's the same as the version that will be available in the Godot Asset Library. Readme is updated. Feel free to check it out and give feedback. [Github Link](https://github.com/V-Sekai/godot-vrm/)
- New commits to godot_uro:main by Lyuma and Fire.
- New commits to v-sekai-game:main by Lyuma and Fire.
- New commits to godot:groups-staging-4.2 by Fire.
- New commits to godot:vsk-many-bone-ik-4.2 by Fire.
- New commits to v-sekai-game:update-translations by Fire.
- New commits to v-sekai-game:update-godot by Fire.
- New commits to godot-vrm:only-addon by Lyuma.
- New commits to godot-vrm:master by Lyuma.
- New commits to godot:vsk-flac-4.2 by Fire.

### Changed

- Updated localization files for VR manager and menu strings by Fire.
- Updated the ref value for the v-sekai-game repository to groups-4.2.2023-08-01T161313Z by Fire.
- Updated godot-deps action.yml by Fire.
- Updated icons path in FLAC config module by Fire.

### Fixed

- Fix theme of export dialog by Lyuma.

### Deprecated

- Not applicable for this month.

### Removed

- Many Bone IK has been removed temporarily to ensure the engine builds and passes tests.

### Security

- Not applicable for this month.

This project does not adhere to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Previous Releases]

- Not applicable for this month.

**Note:** This changelog has been compiled based on the updates provided. For more detailed information, please refer to the specific issues or pull requests in the respective repositories.