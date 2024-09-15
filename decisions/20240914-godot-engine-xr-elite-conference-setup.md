# Accepted: Godot Engine XR Elite HMD Conference Setup

## The Context

Fire, an independent developer previously contracted with the Godot Foundation, plans to demonstrate the capabilities of the Godot Engine XR Team's work on the VIVE headset at an upcoming conference. This setup is crucial for showcasing advanced VR features using the XR Elite Headset.

## The Problem Statement

Setting up a reliable and efficient demonstration environment for the XR Elite Headset at a conference can be challenging due to potential network issues and hardware integration complexities.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

The proposed setup involves several components to ensure a stable and high-performance demonstration:

1. **Hardware Connection**:

   - Connect the XR Elite Headset to a USB-C hub.
   - Attach the Vive Ultimate Tracker dongle and a Belkin USB-C to Gigabit Ethernet Adapter to the hub.

2. **Network Configuration**:

   - Use a wired ethernet connection to avoid Wi-Fi instability common in conference venues.
   - Set a fixed IP address for the VIVE Business Streaming server using the VBSIpSetting.exe tool.

3. **Software Setup**:

   - Ensure the business streaming server has a physical display connected to prevent the SteamVR overlay issue.
   - Run SteamVR for VR demonstrations.

4. **Additional Stability Measures**:
   - Disable Wi-Fi on the XR Elite Headset to rely solely on the wired connection.
   - Consider using a gigabit travel router/switch to manage and shorten routing internally at the venue.

## The Benefits

- **Reliability**: Wired connections reduce the risk of connectivity issues during live demonstrations.
- **Performance**: Direct network connections and optimized settings ensure smooth operation of VR applications.
- **Professional Presentation**: A stable setup reflects well on the Godot Engine project and its capabilities in VR.

## The Downsides

- **Complexity**: The setup requires careful configuration and might be daunting for less technical users.
- **Equipment Dependency**: Relies on specific hardware and software that may not be readily available at all venues.

## The Road Not Taken

Alternative simpler setups were considered but rejected due to their reliance on less stable wireless connections which could compromise the demonstration's effectiveness.

## The Infrequent Use Case

In cases where a direct internet connection is unavailable, additional configurations like mobile routers or other networking equipment might be necessary.

## In Core and Done by Us

This proposal aligns with our core mission to showcase the best of Godot Engine's VR capabilities and will be implemented by fire with support from the V-Sekai development team.

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
