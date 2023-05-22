# Issue: Build a MacOS editor for the iPad

## Metadata

- Status: proposed
- Deciders: V-Sekai
- Tags: V-Sekai, GPT-4, MacOS, iPad

## Context and Problem Statement

We have successfully tested a MacOS editor on the iPhone in February 2023. Now, we want to build a similar editor for the iPad.

## Proposed Solution

1. Adapt the existing MacOS editor codebase for the iPad.
2. ~~Ensure that the user interface is optimized for the larger screen size of the iPad.~~
3. Test the application on various iPad models to ensure compatibility and performance.

## Implementation

1. Clone the existing iPhone Godot Engine editor repository.
2. Create a new branch for the iPad version.
3. ~~Modify the user interface to accommodate the larger screen size of the iPad.~~
4. ~~Update any device-specific code to support the iPad.~~
5. Test the application on different iPad models and fix any issues found during testing.
6. Merge the iPad branch back into the main branch once the application is stable and fully functional.

## Positive Consequences

- Expanding the availability of the MacOS editor to iPad users.
- ~~Leveraging the larger screen size of the iPad for an improved editing experience.~~
- Reusing the existing codebase, reducing development time and effort.

## Negative Consequences

- Additional development and testing efforts required to support another platform.
- Potential maintenance overhead due to supporting multiple platforms.

## Option graveyard

1. Developing a separate iPad-only application from scratch.
2. Using web-based editor solutions instead of a native app.
3. Implementing a remote desktop solution to access a MacOS editor on a different device.
4. Porting the MacOS editor to a cross-platform framework, potentially sacrificing performance and native features.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement requires significant changes to the existing codebase to properly support the iPad.

## Is there a reason why this should be core and done by us?

Yes, as the maintainers of Godot Engine, we have the expertise and knowledge of the codebase to efficiently adapt it for the iPad.

## References

- [V-Sekai](https://v-sekai.org/)
- [iPad fork of of Godot Engine](https://github.com/V-Sekai/godot/tree/groups-4.x-ios)