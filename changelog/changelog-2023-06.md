# Changelog 2023-06

In June 2023, various developments and discussions took place in the Godot community, particularly within the V-Sekai project. Key highlights include updates to the `godot-vrm` repository, security improvements in the `v-sekai-game` repository, and progress on animation retargeting and PMX character structure. Additionally, a fix was implemented for Skeleton3D's `rest_dirty` reset issue.

- Fork created: `aaronfranke/godot-vrm` (01/06/2023)
- New commits in `V-Sekai/godot-vrm` repository, including updates to `load_at_runtime_scene` for 4.x and adding `files_dropped` functionality (02/06/2023)
- PR 130 closed, bumping `github/codeql-action` from 2.3.5 to 2.3.6 in `V-Sekai/v-sekai-game` (02/06/2023)
- PR 129 closed, bumping `actions/setup-dotnet` from 3.1.0 to 3.2.0 in `V-Sekai/v-sekai-game` (02/06/2023)
- StepSecurity bot opened PR 131 to apply security best practices in `V-Sekai/v-sekai-game` (02/06/2023)
- New commit in `v-sekai-game:main` to avoid the empty avatar crash (02/06/2023)
- New commits in `v-sekai-game:main`, including changes to assert and early return print `_error` (02/06/2023)
- New tag created in `V-Sekai/godot`: `groups-4.x.2023-06-03T034215Z` (02/06/2023)
- PR 131 closed, applying security best practices in `V-Sekai/v-sekai-game` (02/06/2023)
- New commit in `v-sekai-game:main` to make joining a server less crashy (02/06/2023)
- New commit in `v-sekai-game:main` to remove debug points (02/06/2023)
- New branch created in `V-Sekai/v-sekai-game`: `codeql` (02/06/2023)
- PR 132 opened, creating `codeql.yml` in `V-Sekai/v-sekai-game` (02/06/2023)
- New comment on issue #25 in `V-Sekai/godot-vrm` discussing how to make a VRM model pose using GDScript (02/06/2023)
- New commits in `v-sekai-game:main`, including changes to assert and early return print `_error` part 3, avoiding runtime errors, and removing gut (02/06/2023 - 03/06/2023)
- PR 132 closed, creating `codeql.yml` in `V-Sekai/v-sekai-game` (03/06/2023)
- PR 133 opened, hardening GitHub Actions in `V-Sekai/v-sekai-game` (03/06/2023)
- New comments on issue #25 in `V-Sekai/godot-vrm` discussing animation retargeting and PMX character structure (03/06/2023)
- New commits in `v-sekai-game:main`, including removing hardcoded gravity and gravity direction, inverting state machine condition, and setting up work in progress state chart (03/06/2023)
- New branch created in `V-Sekai/v-sekai-game`: `state-chart` (03/06/2023)
- Skeleton3D now correctly resets `rest_dirty` only after all bone transforms have been updated (PR 78025 by lyuma). This also resolves the SkeletonGizmo display issue when there is more than one bone root.