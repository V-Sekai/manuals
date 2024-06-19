# Draft: Initial Training of the MeshRWVK Model

## Metadata

- **Status:** Draft
- **Deciders:** V-Sekai
- **Tags:** V-Sekai

## Context

Currently, there is no model for MeshRWVK. This presents a challenge in generating diverse and complex 3D shapes for virtual environments.

## Problem

The lack of a model for MeshRWVK limits the diversity and complexity of 3D shapes that can be generated for virtual environments.

## Solution

To address this issue, we propose to enhance the training of the GPT model using a dataset known as Objaverse-XL, which includes various categories of 3D shapes. The training phase will employ several techniques such as random shifts, scaling, and planar decimation to improve the model's ability to create diverse shapes.

## Evaluation

The performance of the model will be evaluated using several metrics including Minimum Matching Distance (MMD), Coverage (COV), 1-Nearest-Neighbor Accuracy (1-NNA), Chamfer Distance (CD), FID and KID scores, and compactness.

## Benefits

Enhancing the training of the GPT model will improve its ability to generate more complex 3D shapes, allowing for greater diversity and realism in the virtual environments created by V-Sekai.

## Risks

The proposed strategy may require significant computational resources and time. There may also be a learning curve associated with understanding and implementing the proposed enhancements.

## Alternatives

An alternative approach could have been to use a different model for generating 3D shapes. However, this would require a complete overhaul of the current system and may not necessarily yield better results.

## Limitations

The proposed enhancements may not be necessary for simpler virtual environments. In such cases, the current implementation of the MeshGPT model may suffice.

## Implementation

Yes, the proposed enhancements will be implemented by the V-Sekai development team.

## References

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine
3. [Objaverse-XL](https://huggingface.co/datasets/allenai/objaverse-xl)

_This article was assisted by AI assistant, Aria._
