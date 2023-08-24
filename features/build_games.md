# Creating Virtual Reality Games with V-Sekai

## Supported File Types

V-Sekai supports various file types out of the box, including:

- Audio: `.ogg`, `.mp3`, `.wav`
- Image: `.png`, `.jpg`, `.tga`, `.exr`
- Text, and more
- Raw 3D Mesh: `.obj`

### glTF2 Specification

We use the royalty-free 3D content specification, glTF2. It's easy-to-read JSON format and is extensible with Khronos extension registry on Github. It replaces proprietary FBX and older COLLADA formats and has wide application support (Blender, Godot, etc.). It's an ISO/IEC 12113 standard and adopted by Unity, Unreal Engine, and other software.

## Virtual Reality Support

V-Sekai runs on OpenXR and Vulkan.

## Godot User Tools

We provide a file loader for various file types (2D & 3D assets, scenes, scripts, meshes, textures) and editable assets within the editor.

## Scripting

We offer a built-in script editor, GDScript: In-house scripting language, GDExtension: C++ binding ABI with cross-version compatibility, and C++ Modules: Native performance.

## Sandbox Scripting Environment (WIP)

We're actively researching a security-focused sandboxing environment. You can follow our progress on the [godot-wasm project](https://github.com/ashtonmeuser/godot-wasm).