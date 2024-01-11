# Proposal: Fit Clothing on Humans Without Tearing

## Metadata

- **Status**: Proposed
- **Deciders**: V-Sekai, Fire, Joe Cat
- **Tags**: V-Sekai

## Context

The challenge is to accurately fit clothing on a 3D human model without causing any tearing in the fabric. The proposed solution involves utilizing machine learning technology that ensures constraints are maintained for vertex faces during the fitting process.

# Strategy

# Direct Strategy

Implement the cloth simulation's pinning functionality to attach the base mesh hull to the clothing hulls. This can be achieved by developing an algorithm that selects optimal vertices based on certain criteria such as distance from the texel or texture similarity.

Leverage machine learning technology to maintain constraints for vertex faces and effectively fit clothing on a 3D model.

**Two Hulls Provision**: Provide one hull on the base mesh and another on the clothing. The objective here is to first generate the material/clothing and then wrap it onto the character.

The constraint solver used in this process is a cloth simulator that can solve backwards and forwards differentially. This is unique as most physics engines can't solve backwards for a large number of vertices.

## Pros and Cons

To be determined.

## Alternatives

To be determined.

## Rare Use Cases

To be determined.

## Core Functionality?

To be determined.

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine

_This article was assisted by Aria, an AI assistant._
