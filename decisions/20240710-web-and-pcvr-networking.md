# Proposed: Networking PCVR with the Web

## The Context

In the development of virtual reality (VR) applications, focusing on both PC-based VR (PCVR) and web platforms can provide a broader reach and enhanced user experience.

**Note:** When referring to "web" in this document, it specifically means web desktop platforms and not WebXR.

We use Godot Engine 4.3 pre-release. PCVR uses OpenXR and the web uses threading.

## The Problem Statement

PCVR platforms must be able to communicate with the web platform in a low latency (UDP) network so the web can be a fallback to support everyone.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

- **Communication Protocol**: Implement a UDP-based communication protocol for low-latency data transfer between PCVR and web platforms.
- **Godot's Multiplayer API**: Use Godot's high-level multiplayer API to manage connections and data synchronization.
- **Custom Patch for Godot WebRTC**: Utilize our custom patch for Godot WebRTC for PCVR.
- **Standard Browser WebRTC**: Employ the standard browser WebRTC for the web.

#### Real-Time Chat Application

To test the interoperability between PCVR and web platforms, we propose developing a simple real-time chat application. This will involve:

- A basic text input field and display area for messages on both PCVR and web platforms.
- Establishing a UDP connection between the PCVR and web clients.
- Using Godot's high-level multiplayer API to handle message sending and receiving.
- Ensuring that messages sent from the PCVR client appear in real-time on the web client and vice versa.

To enhance the functionality and flexibility of the communication system, we propose implementing multiple channels for different types of data. This will allow for more organized and efficient data transfer. The channels could include:

1. **Text Channel**:

   - For sending and receiving text messages.
   - Used in the real-time chat application.

2. **Voice Channel**:

   - For transmitting voice data.
   - Enables real-time voice communication between PCVR and web clients.

3. **Data Channel**:
   - For sending miscellaneous data such as user actions, game state updates, etc.
   - Ensures that non-textual data is transmitted efficiently.

## The Benefits

- Ensures real-time interaction between PCVR and web platforms.
- Expands the user base by supporting both PCVR and web platforms.
- Provides seamless integration and interaction across different platforms.

## The Downsides

- Increased complexity in managing cross-platform communication.
- Requires ongoing maintenance and updates to ensure compatibility and performance.

## The Road Not Taken

Consideration of other communication protocols like TCP, which may offer reliability but at the cost of higher latency.

## The Infrequent Use Case

Handling scenarios where network conditions are poor or intermittent, requiring robust error handling and reconnection strategies.

## In Core and Done by Us

This proposal involves integrating the solution directly into the core of the V-Sekai project, managed by the V-Sekai development team.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team
- fire

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
