# Proposed: Revised Tracker Configuration and Constraints for HTC VIVE XR Elite

## The Context

In virtual reality (VR), precise motion tracking is import for immersive experiences. Effective tracker configuration is essential to enhance interaction within VR environments, specifically for the HTC VIVE XR Elite.

## The Problem Statement

Tracker configurations distribution across available dongles, affects the setup of motion capture in VR applications, particularly with the HTC VIVE XR Elite.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

### Dongle 1 (connected to HTC VIVE XR Elite HMD)

- **Hips** (1 tracker)
- **Foot Right** (1 tracker)
- **Foot Left** (1 tracker)
- **Elbow Left** (1 tracker)
- **Elbow Right** (1 tracker)

### Dongle 2 (connected to PC)

- **Knee Right** (1 tracker)
- **Knee Left** (1 tracker)
- **Chest** (1 tracker)
- **Hips** (1 tracker optional)
- **Chest** (1 tracker optional)

### Constraints

Each dongle supports a maximum of **5 trackers**. This constraint is critical in determining how trackers are distributed between the two dongles to ensure optimal performance without exceeding the connectivity limit, specifically for the HTC VIVE XR Elite.

### Rationale Behind the Revised Setup

#### **Dongle 1 (HMD)**

- **Enhanced Lower Limb Tracking**: By connecting both knee trackers to the HMD dongle, we ensure precise tracking of lower limb movements, which is essential for accurate motion capture in activities that involve significant leg movement.
- **Upper Extremity Tracking**: Including both elbow trackers on this dongle allows for detailed arm movement tracking, enhancing the realism and responsiveness of upper body interactions in VR.

#### **Dongle 2 (PC)**

- **Comprehensive Upper Body Tracking**:
  - **Chest and Hips Trackers**: These trackers are crucial for capturing the core movements of the body, providing a stable base for upper body motion tracking.
  - **Dual Foot Tracking**: Placing the foot trackers on the PC-connected dongle ensures that foot movements are captured accurately, which is vital for walking, running, and other foot-based interactions in VR environments.

## The Benefits

- **Improved Accuracy**: Optimized tracker placement enhances the precision of motion capture.
- **Enhanced User Experience**: More accurate tracking translates to a more immersive and responsive VR experience.
- **Scalability**: This setup allows for easy adjustments and scalability as new trackers or technologies become available.

## The Downsides

- **Complex Setup**: Initial configuration and calibration may be more complex and time-consuming.
- **Hardware Dependency**: Performance is heavily dependent on the quality and capability of the hardware used.

## The Road Not Taken

Alternative configurations that involved different distributions of trackers were considered but were not pursued due to potential compromises in tracking accuracy and performance.

## The Infrequent Use Case

In cases where extreme precision is not required, such as in less interactive VR applications, a simpler tracker setup might suffice.

## In Core and Done by Us

This proposal aligns with our core mission to push the boundaries of VR technology and will be implemented by our internal development team, focusing on the HTC VIVE XR Elite.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai
- HTC VIVE XR Elite

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
