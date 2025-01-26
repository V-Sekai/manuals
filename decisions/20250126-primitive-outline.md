# Proposed: Mesh Primitive Outline as Hologram

## What is the context of the proposal?

Instead of a lens, we aim to generate an overlay using the mesh's primitive outline. Similar to the multi-tool interface in Half-Life: Alyx, the tool will surface entity details as a holographic overlay.

## What is the problem being solved?

How can we generate a holographic overlay by utilizing a list of triangle edges extracted from mesh data?

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams.

The proposal involves parsing the mesh data to extract triangle edges and rendering these edges as a holographic overlay. Utilizing a compatible rendering engine, each edge will be transformed into visible lines with appropriate shading and anti-aliasing. The system will dynamically update the hologram in real-time based on user interactions and changes in the underlying data.

## What are the benefits of the proposal?

This approach enhances visualization by providing a clear and immersive method to interact with mesh data. It improves user interaction through intuitive controls, allowing seamless engagement with the overlay. Performance is optimized by leveraging triangle edge data for efficient rendering. Additionally, the solution is scalable, enabling support for more complex interactions and data types in future developments.

## What are the downsides of the proposal?

The proposal adds complexity to the rendering pipeline, potentially complicating development. It may require increased processing power, which could limit accessibility on lower-end devices. Users may face a learning curve adapting to the new interaction methods. Furthermore, additional features will necessitate ongoing support and updates, leading to maintenance overhead.

## What are the alternative proposals?

Alternative approaches include implementing a 2D overlay system with traditional interfaces, using point-based rendering instead of outlining edges, integrating existing third-party holographic tools instead of developing in-house solutions, and simplifying interactions by removing gesture-based controls.

## When might the proposed solution be used rarely or not at all?

The solution may see limited use in environments lacking hardware support for holographic or virtual reality displays. It may be unnecessary for simple projects that do not require advanced visualization or interaction features. High resource constraints could hinder support for the overlay, and some users may prefer traditional interfaces over holographic ones.

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
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which integrates social VR/VRSNS/metaverse components into the Godot Engine.
3. [CESIUM Primitive Outline](https://github.com/KhronosGroup/glTF/blob/main/extensions/2.0/Vendor/CESIUM_primitive_outline/README.md) - Describes the CESIUM Primitive Outline extension for rendering triangle edges with high-quality, anti-aliased lines.

AI assistant Aria assisted with this article.
