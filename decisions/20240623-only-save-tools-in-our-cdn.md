# Proposal: Only Save Tools in Our CDN

## Context

Currently, our Content Delivery Network (CDN) is responsible for storing a variety of assets. These include home world props, avatars, worlds, V-Sekai tools, and our sources.

## Problem Statement

The main issue we face is the need to optimize storage space while ensuring that essential tools are readily accessible for use.

## Proposed Solution

Our proposed solution is to limit the types of assets stored in our CDN. Specifically, we suggest not saving home world props, avatars, or worlds in our CDN. This would help conserve storage space. Instead, we would focus on storing only the V-Sekai tools and our tool sources. The underlying idea is that homeworlds should be responsible for storing their own content.

## Benefits

This strategy ensures the sovereignty of the content by allowing each homeworld to manage its own assets.

## Downsides

There may be potential issues with accessibility and latency as homeworlds will have to manage their own content delivery.

## The Road Not Taken

An alternative approach could have been to upgrade our CDN to accommodate all types of assets. However, this would increase costs and still not address the issue of content sovereignty.

## The Infrequent Use Case

In cases where a homeworld's server is down or experiencing issues, users might not be able to access certain assets.

## In Core and Done by Us

The implementation of this proposal will be done by us, the V-Sekai development team. It aligns with our core principle of decentralization and user empowerment.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

_This proposal was assisted by AI assistant Aria._
