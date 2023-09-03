# Enabling VRM to Blender Conversion with Cloud GPUs and replicate.com

## Metadata  

- Status: proposed 
- Deciders: V-Sekai, fire, antpb
- Tags: V-Sekai

## The Backdrop  

The VRM format is becoming increasingly popular in the field of 3D modeling and animation. It allows for easy sharing and transfer of humanoid 3D models with skeletal animations between different software applications. One such application is the Godot Engine, a popular open-source game engine.

## The Challenge  

Currently, developers working with VRM files in Godot Engine face difficulties when trying to convert these files to Blender format for further editing or manipulation. Manual conversion processes can be time-consuming and error-prone. 

## The Strategy  

The proposed strategy is to leverage the computational power of cloud GPUs provided by replicate.com in order to run a GPU blender instance that performs an identity operation on the VRM input, converting it to Blender format. This will greatly simplify the process of converting VRM files to Blender format, enabling developers to seamlessly work with VRM models within the Godot Engine ecosystem.

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

While the proposed solution focuses on streamlining VRM to Blender conversion, performing one-off blender tasks can still be done, although it may be frustrating.

## In Core and Done by Us?

Fire knows the way.

## Further Reading  
- [V-Sekai](https://v-sekai.org/)
- [VRM Animation Specification](https://github.com/vrm-c/vrm-specification/tree/master/specification/VRMC_vrm_animation-1.0)
- [Replicate - Cloud GPU Toy](https://replicate.com/fire/v-sekai.mediapipe-labeler)

This article is assisted by AI.