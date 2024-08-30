# Accepted: PCI-E Lane Depletion and Thunderbolt 4 Issues

## The Context

In modern computing, PCI-E lanes are a critical resource for connecting various high-speed components such as GPUs, SSDs, and network cards. However, the number of available PCI-E lanes is finite and can become a bottleneck when multiple high-bandwidth devices are connected. This proposal addresses the issue of PCI-E lane depletion, particularly in systems utilizing Thunderbolt 4.

## The Problem Statement

When all PCI-E slots are utilized, especially with high-bandwidth devices like GPUs and Thunderbolt 4 controllers, users may experience performance degradation or device malfunctions due to insufficient PCI-E lanes. This problem was highlighted by a user who reported that their Thunderbolt 4 connection broke after using their last PCI-E slot.

## Proposal Implementation

To mitigate this issue, it is recommended to keep the last PCI-E slot empty to ensure sufficient lanes for all connected devices.

```plaintext
+-------------------+
|   CPU             |
|                   |
| PCI-E Lanes    |
+---------+---------+
          |
          v
+---------+---------+
|       PCI-E       |
|      Switch       |
+---------+---------+
          |
          v
+---------+---------+---------+---------+
|   GPU   | Thunderbolt 4 |  NVMe SSD  |
|     |           |        |
+---------+---------+---------+---------+
```

## The Benefits

1. **Improved System Stability**: Ensuring sufficient PCI-E lanes for all devices will prevent system crashes and performance issues.
2. **Optimized Resource Allocation**: Users can make informed decisions about which devices to prioritize based on available PCI-E lanes.
3. **Enhanced User Experience**: By avoiding unexpected device failures, users will have a more reliable and predictable computing experience.

## The Downsides

1. **Complexity**: Implementing checks for PCI-E lane availability adds complexity to system configuration and management.
2. **Hardware Limitations**: Users with limited PCI-E lanes may need to upgrade their hardware to fully utilize all desired devices.

## The Road Not Taken

An alternative approach could be to develop software solutions that dynamically manage PCI-E lane allocation based on real-time usage patterns. However, this would require significant changes to both hardware and software architectures and may not be feasible for all users.

## The Infrequent Use Case

In scenarios where users only utilize a single high-bandwidth device, such as a GPU, PCI-E lane depletion is unlikely to be an issue. This proposal primarily targets power users and professionals with multiple high-bandwidth devices.

## In Core and Done by Us

The V-Sekai development team will integrate PCI-E lane checks into the system configuration process, ensuring that users are alerted to potential lane depletion issues before they occur.

## Status

Status: Accepted <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
