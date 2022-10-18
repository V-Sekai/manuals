# Build virtual reality games 

Content is key.

Full physically based rendering (PBR) out of the box.

Supports several types of files out of the box:

* Audio (.ogg, .mp3, .wav)
* Image (.png, .jpg, .tga, .exr)
* Video, Text, etc.
* Raw 3D Mesh (.obj)
* glTF2 is a royalty-free specification for 3D content
  * Easy to read JSON format
  * Replaces proprietary FBX
  * Replaces older COLLADA
  * Wide application support in Blender, Godot and numerous others.
  * ISO/IEC 12113
  * Adoption in Unity, Unreal Engine and other software.
* Thanks to hard work by Facebook, FBX2glTF does a nearly perfect conversion of FBX content to glTF. Code is open source, but it does use the Autodesk SDK.

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
