# Creating virtual reality games

## Avatars & Places

V-Sekai has added support for VRM avatar files, which are open-source standards for sharing portable humanoid avatars between different virtual reality platforms.

The addition of VRM support allows users all over the world to customize their avatars in V-Sekai by importing models made with Blender or VRoid Hub, then using them as their persona within this virtual space.
[Using VRM by extending glTF for portable humanoid avatars.](https://www.khronos.org/assets/uploads/developers/presentations/VRM-Extending-glTF-for-Portable-Humanoid-Avatars_SIGGRAPH-Asia_Nov19.pdf)

## VRM glTF2 Extension

- Avatars for XR, on top of glTF.
- Automatic humanoid rigging
- Interactive hair and clothing
- Twist bones, constraints
- Toon shading + glTF PBR
- Face shapes for speech
- Cross-engine support
- Contains simplified physics simulation for spring bones
- Meta-information with author and license
- Custom facial expressions using morphs

## Animation retargeting

- Animation Retargeting import as a model, or import
- Animation Retargeting as an animation library
- Built-in humanoid profile
- Custom profiles possible, e.g. monsters or animals
- Compatible with animations from Mixamo, Blender
- Blend walk and run animations with blend spaces

## Create and visit places

V-Sekai can import worlds and visit them.

## Supports many file types

Supports several types of files out of the box:

- Audio (.ogg, .mp3, .wav)
- Image (.png, .jpg, .tga, .exr)
- Video, Text, etc.
- Raw 3D Mesh (.obj)
- glTF2 is a royalty-free specification for 3D content
  - Easy-to-read JSON format
  - glTF2 is extensible. Khronos extension registry on Github.
  - Replaces proprietary FBX
  - Replaces older COLLADA
  - Wide application support in Blender, Godot and numerous others.
  - ISO/IEC 12113
  - Adoption in Unity, Unreal Engine and other software.
  - glTF-Blender-IO by Khronos
  - glTF Transform by Don McCurdy
  - Godot: New GLTFDocumentExtension API
- Thanks to hard work by Facebook, FBX2glTF does a nearly perfect conversion of FBX content to glTF. The code is open source, but it does use the Autodesk SDK.

## Virtual Reality

V-Sekai runs on OpenXR and Vulkan.

## Common tools for Godot users include:

A file loader that can open any file type it finds, including 2D and 3D assets (including scenes, scripts, meshes & textures) which can all be edited directly within the editor.

## Script games

A built-in script editor.

GDScript – in-house scripting language.

GDExtension – C++ binding ABI with cross-version.

C++ Modules - for native performance and portability.

## Sandbox scripting environment

The sandboxed scripting environment is not active yet as of October 2022.

A security-focused sandboxed scripting environment backed by WASM
