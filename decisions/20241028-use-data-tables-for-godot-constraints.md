# Proposal: Use Data Tables for Godot Constraints

## The Context

In the development of VR applications using the Godot Engine, managing complex interactions and constraints can become cumbersome and error-prone when handled purely through code.

## The Problem Statement

Currently, developers must manually code each constraint and interaction within the Godot Engine, which is time-consuming and increases the risk of errors. This approach lacks scalability and efficiency, particularly in large-scale VR projects like those developed by V-Sekai.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

The proposal involves integrating a data table system within the Godot Engine to manage constraints. Here's a basic example of how it might look in pseudo-code:

## The Benefits

- **Scalability**: Easier to manage large numbers of constraints.
- **Efficiency**: Reduces development time by allowing non-programmers to adjust constraints.
- **Error Reduction**: Minimizes coding errors associated with manual constraint setup.

## The Downsides

- **Complexity in Setup**: Initial setup of data tables and integration into the Godot project might be complex.
- **Performance Concerns**: Reading from data tables at runtime could impact performance if not properly optimized.

## The Road Not Taken

An alternative could have been to develop a visual editor for constraints within Godot, but this would require significantly more development resources and may not offer the same flexibility as a data-driven approach.

## The Infrequent Use Case

For projects where constraints are minimal or highly static, this system might introduce unnecessary complexity and overhead.

## In Core and Done by Us

This feature should be developed and maintained by the core V-Sekai team to ensure it aligns with the overall architecture and performance standards of the engine.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
