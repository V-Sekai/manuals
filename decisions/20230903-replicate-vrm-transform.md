# Rejected: Enabling VRM to Blender Conversion with Cloud GPUs and replicate.com

## Metadata

- Status: rejected
- Deciders: V-Sekai, fire, antpb
- Tags: V-Sekai

## The Backdrop

The VRM format is becoming increasingly popular in the field of 3D modeling and animation. It allows for easy sharing and transfer of humanoid 3D models with skeletal animations between different software applications. One such application is the Godot Engine, a popular open-source game engine.

## The Challenge

Currently, developers working with VRM files in Godot Engine face difficulties when trying to convert these files to Blender format for further editing or manipulation. Manual conversion processes can be time-consuming and error-prone.

## The Strategy

The proposed strategy for enabling VRM to Blender conversion involves leveraging the computational power of cloud GPUs provided by replicate.com. By running a GPU-accelerated Blender instance, developers can perform an identity operation on the VRM input, converting it to Blender format. This simplifies the process of converting VRM files to Blender format.

To convert VRM files to Blender format, developers can follow these steps:

1. Install the necessary libraries or plugins in Blender that support the VRM format.
2. Leverage replicate.com's infrastructure to spin up a GPU-accelerated Blender instance.
3. Develop a script or tool that takes the VRM file as input and sends it to the GPU-accelerated Blender instance via a REST interface.
4. In the GPU-accelerated Blender instance, use the installed libraries or plugins to perform the conversion from VRM to Blender format.
5. Also use Blender to perform the conversion from Blender to VRM/GLTF format.

This strategy streamlines the workflow for developers, saving time and improving collaboration between designers and developers. The use of cloud GPUs and replicate.com's infrastructure ensures fast and efficient conversion processes.

Additionally, this strategy can also be extended to other software applications or websites that can utilize a REST interface, allowing developers working with VRM files to convert them to Blender format seamlessly, regardless of the software they are using.

## The Upside

- Streamlined workflow: Developers can easily convert VRM files to Blender format, opening up a wide range of editing and manipulation possibilities.
- Time-saving: The use of cloud GPUs and replicate.com's infrastructure ensures fast and efficient conversion processes.
- Improved collaboration: The ability to work with VRM models in both Godot Engine and Blender facilitates collaboration between designers and developers.

## The Downside

- Development effort and expertise: Creating the necessary library or plugin may require significant technical knowledge in both the Godot Engine and VRM format.
- Compatibility issues: Different versions of FBX or GLB files may introduce compatibility challenges during the conversion process.
- Maintenance challenges: Keeping up with future updates to the Godot Engine and VRM specifications may require ongoing effort.

## The Road Not Taken

We considered developing a web application, but it was deemed to have heavy engineering costs.

## The Infrequent Use Case

While the proposed solution focuses on streamlining VRM to Blender conversion for the Godot Engine ecosystem, the same concept can be extended to other software applications or websites that can utilize a REST interface. This allows developers working with VRM files to convert them to Blender format seamlessly, regardless of the software they are using. The use of cloud GPUs and replicate.com's infrastructure still ensures fast and efficient conversion processes.

## In Core and Done by Us?

Fire knows the way.

## Further Reading

- [V-Sekai](https://v-sekai.org/)
- [VRM Animation Specification](https://github.com/vrm-c/vrm-specification/tree/master/specification/VRMC_vrm_animation-1.0)
- [Replicate - Cloud GPU Toy](https://replicate.com/fire/v-sekai.mediapipe-labeler)

This article is assisted by AI.

Is there anything else I can assist you with?
