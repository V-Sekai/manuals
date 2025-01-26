# Proposed: Mesh primitive outline as Hologram

## What is the context of the proposal?

Instead of a lens, we generate an overlay using the primitive outline. The multi-tool like Half-Life: Alyx tool’s interface surfaces entity details as a holographic overlay.

## What is the problem being solved?

How do we generate the holographic overlay using a list of triangle edges as outlined data?

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams.

The proposal involves parsing the mesh data to extract triangle edges and then rendering these edges as a holographic overlay. Using a rendering engine compatible with our platform, each edge will be converted into a visible line with appropriate shading and anti-aliasing. The system will update the hologram in real-time based on user interactions and underlying data changes.

## What are the benefits of the proposal?

The proposal provides enhanced visualization, offering a clear and immersive way to interact with mesh data. It improves user interaction through intuitive controls that allow users to engage with the overlay seamlessly. Performance efficiency is achieved by utilizing triangle edge data to optimize rendering performance. Additionally, the solution is scalable and can be extended to support more complex interactions and data types in the future.

## What are the downsides of the proposal?

The proposal introduces increased complexity by adding more components to the rendering pipeline, which may complicate development. It may require more processing power, potentially limiting accessibility on lower-end devices. There is a learning curve as users may need time to adapt to the new interaction methods. Furthermore, the additional features will require ongoing support and updates, leading to maintenance overhead.

## What are the alternative proposals?

Alternative proposals include implementing a 2D overlay system using traditional 2D interfaces for similar functionality, point-based rendering instead of outlining edges, integrating existing third-party holographic tools instead of developing in-house solutions, and simplifying interactions by removing gesture-based controls.

## When might the proposed solution be used rarely or not at all?

The proposed solution may be rarely or not used in environments with limited hardware support where holographic displays are not available. It may also be unnecessary for simple projects that do not require advanced visualization or interaction features. High resource constraints could prevent the overlay from being supported, and alternative preferences may lead users to favor traditional interfaces over holographic ones.

## Is this a V-Sekai core responsibility, and should it be done by us?

Yes, developing the holographic overlay aligns with V-Sekai’s mission to enhance social VR functionalities. Implementing this feature will strengthen our core offerings and provide significant value to our user base.

## What is the status of the proposal?

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Who is making decisions on the proposal?

V-Sekai development team

## What tags does the proposal have?

V-Sekai

## List further reading references.

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [CESIUM Primitive Outline](https://github.com/KhronosGroup/glTF/blob/main/extensions/2.0/Vendor/CESIUM_primitive_outline/README.md) CESIUM Primitive Outline extension indicates to a rendering engine that a list of triangle edges should be outlined. While it does not dictate how the rendering should be done, the fact that all lines are edges of triangles allows the rendering engine to use a higher quality – and faster – technique for rendering the lines without deducing the suitability of such a technique at runtime. Cesium uses a mipmapped 1D texture and three sets of 1D texture coordinates to render high-quality, anti-aliased lines on the edges of triangles.

AI assistant Aria assisted with this article.
