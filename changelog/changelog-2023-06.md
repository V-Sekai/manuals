# Changelog 2023-06

Skeleton3D now correctly resets rest_dirty only after all bone transforms have been updated (PR 78025 by lyuma). This also resolves the SkeletonGizmo display issue when there is more than one bone root.