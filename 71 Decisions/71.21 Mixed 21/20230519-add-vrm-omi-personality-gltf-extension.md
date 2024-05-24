# Proposed: Add VRM portable avatars and OMI_personality to the GLTF Transform tool

## Metadata

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai
- Tags: V-Sekai, GPT-4

## Context and Problem Statement

We want to use OMI_personality, but it needs to be injected into a VRM file by tooling like GLTF Transform and GLTF Transform needs to know completely the VRM0 and VRM1 specification.

## Proposed Solution

1. Study and understand the VRM0 and VRM1 specifications.
2. Implement support for VRM portable avatars in GLTF Transform.
3. Add functionality to add OMI_personality into VRM files using GLTF Transform.

## Implementation

### 1. Research and analyze the VRM0 and VRM1 specifications

- Review the official VRM documentation and specifications.
- Identify key components and features required for supporting VRM portable avatars in GLTF Transform.

### 2. Develop a new extension for GLTF Transform that supports VRM portable avatars

- Design and implement a new extension for GLTF Transform that can handle VRM portable avatars.
  - Enable ".vrm" io reads
  - Write a plugin that increases the VRM version by one.
- Ensure compatibility with existing GLTF Transform features and extensions.

### 3. Extend the CLI configuration to allow injecting OMI_personality into VRM files

- Modify the CLI configuration to accept OMI_personality data as input.
- Implement functionality to add OMI_personality data into VRM files using the new extension.

### 4. Test the implementation with various VRM files and OMI_personality configurations

- Create test cases with different VRM files and OMI_personality configurations.
- Verify the correct injection of OMI_personality data into VRM files.
- Ensure compatibility with other GLTF Transform features and extensions.

## Positive Consequences

- Support for VRM portable avatars in GLTF Transform.
- Ability to inject OMI_personality into VRM files.
- Increased adoption of GLTF Transform for VRM-related projects.

## Negative Consequences

- Additional development and maintenance effort required for the new extension.

## Option graveyard

N/A

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement requires a deeper integration with GLTF Transform and understanding of the VRM specifications.

## Is there a reason why this should be core and done by us?

Yes, implementing this feature will provide a valuable addition to the GLTF Transform tool and cater to the growing VRM community.

## References

- [V-Sekai](https://v-sekai.org/)
- For an example similar to KHR_lights_punctual, refer to [this implementation](https://github.com/donmccurdy/glTF-Transform/blob/main/packages/extensions/src/khr-lights-punctual/lights-punctual.ts).
- No known design for VRM glTF_transform. However, there are two npm packages by [quantumcraft](https://www.npmjs.com/~quantumcraft) that deal with VRM data, but they're not open source.
- The glTF Transform CLI allows specifying a config file, which can register additional glTF extensions and CLI functionality. Check out the [CLI configuration documentation](https://gltf-transform.donmccurdy.com/cli-configuration). Needle Tools has been trying this approach for NEEDLE\_\* extensions.
- [OMI_personality](https://github.com/omigroup/gltf-extensions/tree/main/extensions/2.0/OMI_personality)
