# Proposed: Focus on PCVR and the Web

## The Context

In the development of virtual reality (VR) applications, focusing on both PC-based VR (PCVR) and web platforms can provide a broader reach and enhanced user experience.

Note: When referring to "web" in this document, it specifically means web desktop platforms and not WebXR.

## The Problem Statement

Balancing the development efforts between PCVR and web platforms presents challenges in terms of resource allocation and maintaining consistent performance across different environments.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

1. **Unified Codebase**: Develop a unified codebase that supports both PCVR and web platforms to ensure consistency and reduce maintenance overhead.
2. **Unified Networking**: A PCVR client can communicate with a web client.
3. **Platform-Specific Optimizations**: Implement platform-specific optimizations to leverage the strengths of each environment.
4. **Responsive Design**: Ensure the user interface is responsive and adapts seamlessly to different devices and screen sizes.
5. **Performance Monitoring**: Continuously monitor performance metrics to identify and address any platform-specific issues promptly.
6. **Multithreaded Web**: Opt for a multithreaded web approach instead of a single-threaded one to enhance performance and responsiveness on web platforms.

## The Benefits

- **Broader Reach**: Supporting both PCVR and web platforms allows us to cater to a wider audience.
- **Enhanced User Experience**: Platform-specific optimizations ensure users have the best possible experience regardless of their device.
- **Consistency**: A unified codebase ensures consistent functionality and appearance across platforms.

## The Downsides

- **Resource Allocation**: Balancing development efforts between two platforms may require additional resources.
- **Complexity**: Managing a unified codebase with platform-specific optimizations can introduce complexity.

## The Road Not Taken

Focusing exclusively on either PCVR or web platforms was considered but ultimately deemed less effective in reaching a broader audience.

## The Infrequent Use Case

In scenarios where the application is highly specialized for either PCVR or web, focusing on one platform might be more efficient.

## In Core and Done by Us

This proposal aligns with our core values of inclusivity and innovation and will be implemented by our team.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team
- Fire

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
