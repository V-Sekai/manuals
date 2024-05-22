# V-Sekai Changelog - 2023-05

In May 2023, significant progress was made in the Godot community and V-Sekai project. Key developments include the implementation of WebAssembly modules for Godot Engine 4, improvements to the V-Sekai Godot Engine fork, and advancements in Unidot's FBX humanoid support. Additionally, there were updates to the manual site, suggestions for Blender VRM drag-and-drop support, and bug fixes related to LODs.

- https://github.com/ashtonmeuser/godot-wasm/tree/godot-4 Implements wasm modules for Godot Engine 4.
- Fire has chatgpt4 api access.
- Merged godot-wasm into V-Sekai Godot Engine fork for experimenting with user generated scripting and optimization of computation.
- vsk_speech branch of V-Sekai Godot Engine passes cicd again!!
- Revised and optimized the manual site.
- Suggested that .VRM drag and drop support is added to Blender. https://github.com/mika-f/blender-drag-and-drop/issues/34#issuecomment-1539429579
- Use a better representation of feminine and masculine avatars
- Fixing bugs with lods

## Unidot Update Summary

Lyuma has been working on implementing imported humanoid FBX support in Unidot, including bone guessing. The current implementation supports FBX source models and performs bone name guessing when humanDescription is empty. However, it does not yet support humanoid .anim clips, and there are known issues applying Animator components to already-imported models.

After fixing a typo in Fix Silhouette, Lyuma reported that FBX humanoid animation import in Unidot seems much closer. They also implemented support for "Copy from other Avatar" to handle conversion of Maya FBX files with the first frame posed like the animation. This allows using the T-pose of another model as the rest pose.

Lyuma shared their progress on Twitter, showcasing the effectiveness of Unidot-Importer by VSekaiOfficial and Godot 4.0's new humanoid retargeter system. The Godot Engine community also discovered the team's GLTF work, as seen in a tweet by Bramwell.

Gamefromscratch covered Godot -> Unity migration in a YouTube video, highlighting the use of barcoderdev's version of FBX2glTF with Unidot, which might solve the pivot issue encountered earlier.
