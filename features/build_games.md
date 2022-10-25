# Build virtual reality games 

|Name  |Description  |
|---|---|
|Godot Engine 4 Beta  |Remixable game engine  |
|Godot Engine OpenXR  |VR integration into Godot Engine  |
|Godot VRM  |Portable avatar format  |
|V-Sekai Unidot  |Import `.unitypackage`  |
|V-Sekai Lasso  |XR interaction framework  |
|V-Sekai Wasgo  |Virtual worlds scripting langauge  |
|Godot Engine 3D Formats  |glTF 3d format  |
|Godot Engine Animations  |A to T pose. Silhouette changer.  |
|V-Sekai Renik  |IK system  |
|V-Sekai Ewbik  |Next IK system  |
|V-Sekai proposals / manual site  |  |
|Godot fbx2GLTF  |Portable avatar format  |
|V-Sekai Speech  |Voice chat  |
|V-Sekai Uro  |Online services  |
|Godot MaterialX |Procedural materials|
|Godot Sqlite / Godot mvsqlite| Relation database and Distributed relational database |
|V-Sekai CI/CD| GOCD, Dagger and/or Github Actions|
|XR Tunneling shader for Godot Engine|For VR usability tunneling shader|

Full physically based rendering (PBR) out of the box.

Supports several types of files out of the box:

* Audio (.ogg, .mp3, .wav)
* Image (.png, .jpg, .tga, .exr)
* Video, Text, etc.
* Raw 3D Mesh (.obj)
* glTF2 is a royalty-free specification for 3D content
  * Easy to read JSON format
  * glTF2 is extensible. Khronos extension registry on Github. 
  * Replaces proprietary FBX
  * Replaces older COLLADA
  * Wide application support in Blender, Godot and numerous others.
  * ISO/IEC 12113
  * Adoption in Unity, Unreal Engine and other software.
  * glTF-Blender-IO by Khronos
  * glTF Transform by Don McCurdy
  * Godot: New GLTFDocumentExtension API
* Thanks to hard work by Facebook, FBX2glTF does a nearly perfect conversion of FBX content to glTF. Code is open source, but it does use the Autodesk SDK.

## Virtual Reality

V-Sekai runs on OpenXR and Vulkan.

## Content

Content is key.

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
