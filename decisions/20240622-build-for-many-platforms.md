# Proposed: Build V-Sekai editor for many platforms

## The Context

V-Sekai is a versatile tool that we utilize across various domains. Its adaptability and functionality make it an integral part of our operations.

## The Problem Statement

The challenge at hand is to build the V-Sekai editor for multiple platforms, thereby enhancing its accessibility and usability.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Our approach to this problem involves leveraging existing resources and tools:

1. Utilize our existing gocd pipeline.
2. Employ osxcross for Mac builds.
3. Use mingw for Windows builds.
4. Apply clang for Linux builds.
5. Implement emscripten for web assembly.
6. Utilize the android sdk on linux for Android builds.

In addition to these steps, we will also implement automated testing to ensure consistency across all systems. This will involve creating test scripts that can run on each platform, checking for any discrepancies or issues.

## The Benefits

Our goal is to showcase V-Sekai in October 2024. To achieve this, we need to prepare for various hardware targets. This multi-platform build will significantly enhance our reach and impact.

## The Downsides

The primary downside is the potential complexity and challenges associated with managing and testing numerous build targets. Automated testing should help mitigate this issue, but it will still require careful management and oversight.

## The Road Not Taken

We could have chosen to focus on a single platform, but this would limit the reach and versatility of V-Sekai. By targeting multiple platforms, we can ensure that V-Sekai is accessible to a wider audience.

## The Infrequent Use Case

While the main use case is for regular users, there may be infrequent use cases where developers or other tech-savvy individuals might want to customize or extend the functionality of V-Sekai. Our multi-platform approach caters to these users as well.

## In Core and Done by Us

This project is core to our mission and will be executed by me. We believe that having control over the development process will allow us to maintain the high quality and consistency that we strive for.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team
- Fire

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - This is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

This proposal was assisted by AI assistant Aria.
