# Accepted: Adopt Meta's OpenXR Simulator for macOS Development

## The Context

Developing and testing VR applications requires frequent interaction checks using VR hardware. For developers on macOS, connecting and using VR headsets like Meta Quest can sometimes be cumbersome or have limitations. Meta provides OpenXR simulation capabilities within its XR SDK for macOS, allowing testing of VR interactions directly on the desktop.

## The Problem Statement

VR development on macOS can be slowed down by the need to constantly switch to a physical headset for testing basic interactions. An efficient in-editor or desktop simulation tool could streamline this workflow.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Utilize Meta's native OpenXR simulation features available for macOS development. This allows running and testing V-Sekai (as an OpenXR application) directly on a Mac, simulating headset and controller input without needing to connect a physical headset for every minor change or interaction test.

## The Benefits

- Faster iteration cycles during development, especially for UI and interaction logic.
- Easier debugging of VR-specific code paths directly on the desktop.
- Improved accessibility for developers on macOS who may not have immediate access to VR hardware.

## The Downsides

- Simulators may not perfectly replicate real-world hardware performance or tracking nuances.
- Potential performance overhead running the simulator alongside the game editor or application.

## The Road Not Taken

- Relying solely on physical hardware testing for all VR interactions.
- Developing a custom in-house VR simulator for Godot.
- Using other third-party simulation tools that might have different features or limitations.

## The Infrequent Use Case

- Testing highly nuanced physics interactions that depend heavily on precise, real-world controller tracking data.
- Performance profiling that requires the exact overhead and timing of physical hardware.
- Verifying end-to-end user experience involving physical setup or room-scale movement.

## In Core and Done by Us

Adopting efficient testing tools like the Meta OpenXR simulator is core to improving our development workflow. The investigation and potential integration/adoption will be handled by the V-Sekai development team.

## Status

Status: Accepted <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai Development Team
- fire

## Tags

- VR, Testing, macOS, Simulation, Meta, OpenXR, Godot

## Further Reading

1. [Meta XR SDK Documentation (General)](https://developer.oculus.com/documentation/)
2. [OpenXR Specification](https://registry.khronos.org/OpenXR/specs/1.0/html/xrspec.html)
3. [Meta XR Simulator Introduction (Unity - provides context on simulation concepts)](https://developers.meta.com/horizon/documentation/unity/xrsim-intro/)

---

### Game Development Jargon

1. **XR Simulator**: A tool that mimics the behavior of VR/AR hardware within a desktop development environment.
2. **OpenXR**: An open, royalty-free standard for access to virtual reality and augmented reality platforms and devices.
3. **SDK (Software Development Kit)**: A collection of software development tools in one installable package.
4. **Iteration Cycle**: The time taken to make a change, build the application, and test the result.
