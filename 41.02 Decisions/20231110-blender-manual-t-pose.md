# Accepted: Overcoming the Blender T-Pose Limitation with Documentation

## Metadata

- Status: Accepted
- Deciders: V-Sekai, fire, Lyuma, Zodiepupper, Cthulhoo
- Tags: V-Sekai, VRM, Godot Engine, T-Pose, A-Pose

## Context

The VRM importer and specification in Godot Engine necessitates a T-Pose. However, artists often prefer using an A-Pose as it simplifies body modelling.

## Problem

The issue arises when Blender VRM defaults the skeleton without adjusting the pose.

## Solution

Here's a step-by-step guide to overcome this limitation:

1. Select all bones and create an animation pose for A-Pose. (Optional)
2. Click on the mirror axis butterfly icon and the x-axis.
3. Adjust the shoulder by approximately 15 degrees and position the upper arm to form a T-Pose.
4. Position the legs straight and at shoulder width apart to match the T-Pose.
5. Select all bones again and create an animation pose for T-Pose. (Optional)

## Benefits

This solution allows artists to continue using their preferred A-Pose for modeling while still meeting the T-Pose requirement of the VRM importer in Godot Engine.

## Drawbacks

The process of manually adjusting the pose from A-Pose to T-Pose can be time-consuming and may require some technical knowledge.

## Alternatives Not Pursued

At this time, no other alternatives have been pursued.

## Rare Use Cases

This solution is primarily beneficial for artists who prefer using A-Pose for modeling but need to meet the T-Pose requirement of the VRM importer in Godot Engine.

## In-House Solution?

Yes, this solution was developed by us.

## Additional Resources

1. [V-Sekai · GitHub](https://github.com/v-sekai) - The official GitHub account for the V-Sekai development community, which focuses on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - The GitHub page for the V-Sekai open-source project that brings social VR/VRSNS/metaverse components to the Godot Engine.

This article was assisted by AI.
