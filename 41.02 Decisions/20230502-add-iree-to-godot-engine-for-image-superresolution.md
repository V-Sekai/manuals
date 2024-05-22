# Accepted: Adding IREE to Godot Engine for Image Superresolution

### Metadata

- Status: accepted <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai, IREE, Godot Engine, Image Superresolution, Vulkan Backend,chatgpt 4,Google,

### Context and Problem Statement

V-Sekai currently faces a limitation in the quality of upscaled images, particularly when the image needs to be magnified by a factor of 4x or more.

### Describe the proposed option and how it helps to overcome the problem or limitation

Integrate the Intermediate Representation Execution Environment (IREE) into the Godot Engine 4.0 as a C++ GDExtension. Utilize the Vulkan backend to run an image superresolution demo that generates 4x larger images. IREE is an MLIR-based end-to-end compiler and runtime that lowers Machine Learning (ML) models to a unified IR, allowing for better performance and scaling.

### Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

1. Compile IREE as a C++ GDExtension for Godot Engine 4.0.
2. Use the Vulkan backend to run the image superresolution demo.
3. Load and process ML models for image superresolution using IREE.
4. Integrate the resulting functionality into V-Sekai's existing image processing pipeline.

### Positive Consequences

- Allow image superresolution in V-Sekai.
- Enhanced performance due to IREE's efficient MLIR-based compiler and runtime.
- Scalable solution that adapts to various hardware and software constraints. Not only NVIDIA, but ARM, Intel, AMD and Apple gpus.
- Allow using other machine learning models from PyTorch and Tensorflow

### Negative Consequences

- Additional development time required for integration and optimization.
- Potential trade-offs in implementing other features.

### Option graveyard

1. Use a custom script to work around the image superresolution issue.
   - This might not provide a scalable or high-performance solution.
2. Implement a different image superresolution algorithm.
   - This could lead to suboptimal results compared to IREE's capabilities.

### If this enhancement will be used infrequently, can it be worked around with a few lines of script?

A custom script could serve as a workaround for infrequent use of image superresolution, but it may have drawbacks in terms of efficiency, output quality, and maintenance efforts. If the feature aligns with V-Sekai's goals and significantly improves user experience, integrating the IREE-based solution into the core might be more effective.

### Is there a reason why this should be core and done by us?

In summary, integrating the IREE-based image superresolution feature into V-Sekai's core offers several benefits, including an enhanced user experience, performance optimization, alignment with open source values, and easier maintenance and support. These advantages contribute to a better, more immersive VR experience while staying true to V-Sekai's project goals.

### References

- V-Sekai: https://v-sekai.org/
- IREE (Intermediate Representation Execution Environment): https://github.com/openxla/iree
- Godot Engine: https://godotengine.org
- Vulkan Backend: https://www.khronos.org/vulkan/
- IREE.gd: https://github.com/RechieKho/IREE.gd
