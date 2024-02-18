# Proposed: Port Godot Jolt from GDExtension to C++ Module

## Metadata

- Status: Proposed
- Deciders: v-sekai, fire
- Tags: Godot, Jolt, GDExtension, C++ Module, SCons, CMake

## Context and Problem Statement

Godot Jolt is currently implemented as a GDExtension C++ extension. However, we want to use it as a C++ module, which requires porting from CMake to SCons. This change will also allow us to experiment with soft physics.

## Proposed Solution

### Steps

1.  Analyze the current structure of Godot Jolt as a GDExtension.
2.  Plan the new structure as a C++ module.
3.  Convert the build system from CMake to SCons.
4.  Test the newly created C++ module in different scenarios.
5.  Experiment with soft physics once the module is stable.

## Implementation

The implementation details will be decided upon acceptance of this proposal.

## Positive Consequences

- More control over the engine's core functionality.
- Ability to experiment with soft physics.
- Better integration with Godot's core systems.
- Enable double precision support

## Negative Consequences

- Requires knowledge of both CMake and SCons.
- Potential increase in development time due to the complexity of porting.

## Option Graveyard

This section will be filled as we explore different options and discard those that are not feasible or effective.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

Given the complexity of porting a GDExtension to a C++ module, it cannot be simply worked around with a few lines of script.

## Is there a reason why this should be core and done by us?

Porting Godot Jolt to a C++ module will provide more flexibility and control over its functionalities. It aligns with our goal of enhancing the capabilities of our game engine.

## References

- [Godot Engine](https://godotengine.org/)
- [SCons](https://scons.org/)
- [CMake](https://cmake.org/)
