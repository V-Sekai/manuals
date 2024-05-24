# Proposed: Adoption of Intended Effort Versioning (EffVer) in V-Sekai

## The Context

V-Sekai currently does not adhere to any specific versioning scheme. This can lead to confusion and inefficiency when users try to adopt new versions of the software.

## The Problem Statement

Without a clear versioning system, users may struggle to understand the effort required to adopt new versions of V-Sekai. This can result in wasted time and resources, and potentially deter users from updating to newer versions.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

We propose adopting EffVer, short for Intended Effort Versioning. This versioning scheme categorizes version increments into Macro, Meso, and Micro, based on the effort needed for adoption—large, some, and little to no effort, respectively.

```python
# Example of EffVer in action
version = "1.0.0"  # Initial release

# A micro update requiring little to no effort to adopt
version = "1.0.1"

# A meso update requiring some effort to adopt
version = "1.1.0"

# A macro update requiring large effort to adopt
version = "2.0.0"
```

## The Benefits

Adopting EffVer would provide clear communication to users about the expected effort required to adopt new versions of V-Sekai. This respects users' time by quantifying and communicating the adoption effort upfront.

## The Downsides

The main downside is that it requires the development team to accurately estimate the effort required for each update, which could be subjective and vary between users.

## The Road Not Taken

Alternatives such as Semantic Versioning (SemVer) and Calendar Versioning (CalVer) were considered. However, these focus on technical orthogonality or time of release, rather than the intended impact of changes.

## The Infrequent Use Case

EffVer may not be as effective for infrequent users who are less familiar with the software and may require more effort to adopt new versions regardless of the changes made.

## In Core and Done by Us

The implementation of EffVer would be done by the V-Sekai development team and integrated into the core project.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team and community stakeholders.

## Tags

- V-Sekai, Avatar Customization, AI, Facial Expressions

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine
3. [Intended Effort Versioning (EffVer)](https://jacobtomlinson.dev/effver/)

AI assistant Aria assisted with this article.
