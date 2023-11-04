# Proposed: Build a Single-Instance MacOS Editor for the iPad

## Metadata

- Status: proposed
- Deciders: V-Sekai
- Tags: V-Sekai, GPT-4, MacOS, iPad

## Context and Problem Statement

We have successfully tested a MacOS editor on the iPhone in February 2023. Now, we want to build a similar editor for the iPad so that people can upload game worlds and avatars from a tablet. However, due to iOS limitations, it's impossible to run multiple instances of the app or restart the app on non-jailbroken devices. Therefore, we need to adapt the existing codebase to work within these constraints.

## Proposed Solution

1. Adapt the existing MacOS editor codebase for the iPad without relying on multi-process architecture.
2. Test the application on various iPad models to ensure compatibility and performance.

## Implementation

1. Clone the existing iPhone Godot Engine editor repository.
2. Create a new branch for the iPad version.
3. Modify the codebase to avoid using multi-process architecture:
   1. Change almost all global states (probably except UIApplication and view controller) to thread-local.
   2. Run multiple Godot instances in threads instead of processes.
4. Implement the editor, import project folder, and export PCK to the filesystem. Our project requires SCN uploads to a web CDN.
5. Test the application on different iPad models and fix any issues found during testing.
   1. Install Xcode.
   2. Generate certificates.
   3. Upload the Godot Engine iPad build to the iPad.
6. Merge the iPad branch back into the main branch once the application is stable and fully functional.

## Positive Consequences

- Expanding the availability of the MacOS editor to iPad users.
- Reusing the existing codebase, reducing development time and effort.

## Negative Consequences

- Additional development and testing efforts required to support another platform.
- Potential maintenance overhead due to supporting multiple platforms.

## Option graveyard

- Developing a separate iPad-only application from scratch.
- Using web-based editor solutions instead of a native app.
- Implementing a remote desktop solution to access a MacOS editor on a different device.
- Porting the MacOS editor to a cross-platform framework, potentially sacrificing performance and native features.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement requires significant changes to the existing codebase to properly support the iPad.

## Is there a reason why this should be core and done by us?

Yes, as the maintainers of Godot Engine, we have the expertise and knowledge of the codebase to efficiently adapt it for the iPad.

## References

- [V-Sekai](https://v-sekai.org/)
- [iPad fork of of Godot Engine](https://github.com/V-Sekai/godot/tree/groups-4.x-ios)
