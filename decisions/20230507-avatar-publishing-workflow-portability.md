# Draft: Describe a avatar publishing workflow for portability

## Metadata

- Status: draft <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai, fire
- Tags: V-Sekai, ChatGPT-4, Avatar Publishing, Workflow, Portability, VRM Format, Silent's Shader, Platform Compatibility, Sketchfab, Booth.pm

## Context and Problem Statement

We want to create a workflow for publishing avatars in a portable format that can be easily used across different platforms. The goal is to streamline the process of converting and exporting avatars while maintaining compatibility with various platforms.

## Proposed Solution

The proposed solution involves using the VRM portable avatar format, Silent's shader, and platform-specific package bundles to create a seamless workflow for avatar publishing.

## Implementation

1. Import avatar in VRM0 portable avatar format.
2. Install Silent's shader 1.11.
3. Convert VRM to compatible platform's internal format.
   a. Avoid "Combine Mesh" option.
   b. The Cutout Rendering Mode matches VRM's usual transparency usage.
   c. UNRESOLVED: VRM Colliders cause greatly increased count of simulated physics objects
   ii. Try switching to inside bounds instead of bone as spheres
4. Swap the mtoon material for Silent's shader's crosstone material. Fire doesn't use the light-ramp shader.
5. Many bones need to be the first child for IK to work.
6. Fire prefers solid colour backgrounds for avatar photos
7. Export as a compatible platform package bundle.
8. Bundle VRM and compatible platform package bundle and publish on Sketchfab and/or Booth.pm.
9. The compatible platform should display the avatar as **poor** rated.

## Positive Consequences

- Streamlined avatar publishing process.
- Increased portability and compatibility with different platforms.
- Easier sharing and distribution of avatars.

## Negative Consequences

- Potential loss of some features or quality during conversion.
- May require additional work to ensure compatibility with all desired platforms.

## Option graveyard

N/A

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement aims to create a comprehensive workflow for avatar publishing, which cannot be achieved with just a few lines of script.

## Is there a reason why this should be core and done by us?

Yes, creating a standardized workflow for avatar publishing ensures consistency and compatibility across platforms, making it easier for users to share and distribute their avatars.

## References

- V-Sekai: [V-Sekai](https://v-sekai.org/)
- Silent Cel Shading Shader: [SCSS](https://gitlab.com/s-ilent/SCSS/-/tree/master/Assets/Silent's%20Cel%20Shading%20Shader)
- Silent Cel Shading Shader v1.11: [Silent Cel Shading Shader v1.11](https://gitlab.com/s-ilent/SCSS/-/releases/v1.11)
- Booth.pm: [Booth.pm](https://booth.pm/)
- Sketchfab: [Sketchfab](https://sketchfab.com/)
- VRM converter for compatible platform: [VRM converter](https://booth.pm/en/items/1025226)
  - Automatically installs Univrm: [Univrm](https://github.com/vrm-c/UniVRM)
