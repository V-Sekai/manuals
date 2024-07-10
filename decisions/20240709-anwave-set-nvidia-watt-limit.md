# Proposed: Set Nvidia Watt Limit with Anwave

## The Context

Users have reported issues with their PCs overheating, particularly during the summer months. This problem is exacerbated for those using high-performance GPUs on Windows 11 and using PC virtual reality apps like VRChat.

## The Problem Statement

On Windows 11, my PC was overheating in the summer heat.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

To mitigate the overheating issue, we propose using Anwave to power limit the GPU to 140 watts. This can be achieved by configuring the power management settings of the GPU.

1. Open Anwave application.
2. Navigate to the power management section.
3. Set the power limit of the GPU to 140 watts.
4. Apply the changes and monitor the GPU temperature.

## The Benefits

- **Reduced Overheating**: By limiting the power consumption of the GPU, the overall heat generated will be reduced.
- **Improved Stability**: Lower temperatures can lead to more stable system performance.
- **Extended Hardware Lifespan**: Reducing thermal stress can prolong the life of the GPU and other components.

## The Downsides

- **Performance Impact**: Limiting the power may reduce the performance of the GPU, affecting tasks that require high computational power.
- **Complexity**: Users need to be familiar with tools like Anwave and comfortable making changes to power settings.

## The Road Not Taken

Alternative solutions such as improving cooling systems (e.g., adding more fans or using liquid cooling) were considered but deemed more costly and complex compared to software-based power management.

## The Infrequent Use Case

This solution might not be necessary for users in cooler climates or those who do not push their GPUs to high performance levels.

## In Core and Done by Us

The implementation of this proposal will be handled internally by the V-Sekai development team, ensuring compatibility and stability with our existing systems.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [nvidia-power-management-power-control](https://forums.guru3d.com/threads/anwave-2024-advanced-cleanup-utility-gpu-cleanup-tool-nvidia-power-management-power-control.447584/)

AI assistant Aria assisted with this article.
