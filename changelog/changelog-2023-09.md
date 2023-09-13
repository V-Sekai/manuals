# V-Sekai Changelog - September 2023

## [Unreleased]

### Added

- Ported RenIK to GDScript, providing a reference implementation and allowing for separation of RenIKPlacement from RenIK as two distinct nodes. This change enables reuse of the foot placement implementation on any other IK system or swapping out the foot placement system for another animation system and then running the IK algorithm independently. The port was challenging due to differences in the Basis APIs between C++ and GDScript. The GDScript code is available at [https://github.com/V-Sekai/renik/tree/gdscript](https://github.com/V-Sekai/renik/tree/gdscript) and can be used instead of the original C++ version at [https://github.com/V-Sekai/renik](https://github.com/V-Sekai/renik). It includes a test scene for use in projects.

### Changed

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
