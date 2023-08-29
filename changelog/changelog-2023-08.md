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
- New commits to godot:vsk-subdiv-4-0 branch.
- Force-pushed updates to godot branches: vsk-subdiv-4-0, groups-staging-4.2, scene-import-fixes, faster-generate-lod.
- Deletion of branches in V-Sekai/v-sekai-game: migrate-authors, all-contributors/add-lyuma, all-contributors/add-EnthWyrr.
- Creation of new branches in V-Sekai/v-sekai-game: gh-readonly-queue/main/pr-213-d5fbc97d5854516d4305eb94fb6a81307256c978, all-contributors/- add-s-ilent, gh-readonly-queue/main/pr-215-e72f9297674c4c2f82dcc59ba8af18a03fd86fcc, gh-readonly-queue/main/pr-215-d5fbc97d5854516d4305eb94fb6a81307256c978, gh-readonly-queue/main/pr-213-2a174801a0b88ccdfc9c3671230911f6978477bd.
- New commits to godot:groups-staging-4.2 branch.
- Creation of new branches in V-Sekai/godot: groups-staging-lbfgs, vsk-lbfgs-4.2.
- Bump of github/codeql-action from 2.21.4 to 2.21.5 in V-Sekai/v-sekai-game.
- Creation of new branch in V-Sekai/v-sekai-game: dependabot/github_actions/github/codeql-action-2.21.5.
- Pull requests #213 and #215 in V-Sekai/v-sekai-game.
- Pull request #216 (Bump github/codeql-action from 2.21.4 to 2.21.5) in V-Sekai/v-sekai-game.
### Changed

- Updated localization files for VR manager and menu strings by Fire.
- Updated the ref value for the v-sekai-game repository to groups-4.2.2023-08-01T161313Z by Fire.
- Updated godot-deps action.yml by Fire.
- Updated icons path in FLAC config module by Fire.
- Updates to README.md and .all-contributorsrc in V-Sekai/v-sekai-game.
- Refactoring and updates in godot:groups-staging-4.2 and godot:vsk-lbfgs-4.2 branches.
### Fixed

- Fix theme of export dialog by Lyuma.

### Deprecated

- Not applicable for this month.

### Removed

- Many Bone IK has been removed temporarily to ensure the engine builds and passes tests.
- Deletion of branches in V-Sekai/v-sekai-game: gh-readonly-queue/main/pr-213-d5fbc97d5854516d4305eb94fb6a81307256c978, gh-readonly-queue/main/pr-215-e72f9297674c4c2f82dcc59ba8af18a03fd86fcc, gh-readonly-queue/main/pr-215-d5fbc97d5854516d4305eb94fb6a81307256c978, gh-readonly-queue/main/pr-213-2a174801a0b88ccdfc9c3671230911f6978477bd, groups-4.2-latest, dependabot/github_actions/github/codeql-action-2.21.5.
MMD PMX scene importer in godot:groups-staging-4.2 branch.
### Security

- Not applicable for this month.

This project does not adhere to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Previous Releases]

- Not applicable for this month.

**Note:** This changelog has been compiled based on the updates provided. For more detailed information, please refer to the specific issues or pull requests in the respective repositories.