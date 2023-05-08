# Creating Virtual Reality Games

## Supported File Types

The platform supports various file types out of the box, including:

- Audio: `.ogg`, `.mp3`, `.wav`
- Image: `.png`, `.jpg`, `.tga`, `.exr`
- Text, and more
- Raw 3D Mesh: `.obj`

### glTF2 Specification

- Royalty-free 3D content specification
- Easy-to-read JSON format
- Extensible with Khronos extension registry on Github
- Replaces proprietary FBX and older COLLADA formats
- Wide application support (Blender, Godot, etc.)
- ISO/IEC 12113 standard
- Adopted by Unity, Unreal Engine, and other software
- Tools: glTF-Blender-IO (Khronos), glTF Transform (Don McCurdy), Godot GLTFDocumentExtension API
- FBX2glTF by Facebook for near-perfect FBX to glTF conversion (open source, uses Autodesk SDK)

## Virtual Reality Support

- V-Sekai runs on OpenXR and Vulkan

## Godot User Tools

- File loader for various file types (2D & 3D assets, scenes, scripts, meshes, textures)
- Editable assets within the editor

## Scripting

- Built-in script editor
- GDScript: In-house scripting language
- GDExtension: C++ binding ABI with cross-version compatibility
- C++ Modules: Native performance

## Sandbox Scripting Environment (WIP)

- Active research: [godot-wasm project](https://github.com/ashtonmeuser/godot-wasm)
- Security-focused sandboxing