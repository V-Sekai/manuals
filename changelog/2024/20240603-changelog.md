# V-Sekai Changelog - June 2024

## [Released]

- Not applicable for this month.

## [Unreleased]

### Added
- Worked on a pull request for motion blur, which included:
  - Pushing updates to the `vsk-motion-blur-4.3-beta1` branch in the Godot repository.
- Initiated and updated a paint mixer spectral.js project in the `world:main` branch
- Pushed an update to the mirror script at V-Sekai/avatar_vr_demo so it works in desktop mode as well as XR, and works at arbitrary aspect ratios. Thanks iFire for rubber duckying and encouraging me. Note that if you want square pixels and wish to use the screenspace mode, you need this commit V-Sekai/godot. However, it also supports using Godot's builtin Frustum camera in non-screenspace mode where the pixels will be aligned along the plane of the mirror. See if you can spot the differences. (the skybox shader doesn't fully support frustum mode)
- Integrated OpenTelemetry into the codebase for enhanced debugging capabilities. This will allow developers to trace and monitor application performance in real-time, helping to identify and resolve issues more efficiently.

### Changed

- Not applicable for this month.

### Fixed

- Not applicable for this month.

### Deprecated

- Not applicable for this month.

### Removed

- Not applicable for this month.

### Security

- Bumped github/codeql-action from 3.25.6 to 3.25.7 for security best practices.

This project does not adhere to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Previous Releases]

- Not applicable for this month.