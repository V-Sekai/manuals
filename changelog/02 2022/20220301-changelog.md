# V-Sekai Changelog - 2022-03

Steamdeck test with V-Sekai.

Restored image grid in V-Sekai content picking.

Working with the animation team to approve the skeleton animation retargeter.

https://github.com/fire/geodesiac-path-on-mesh https://mindsdb.com/ https://github.com/godotengine/godot/pull/56902 https://github.com/KhronosGroup/glTF-Blender-IO/pull/1582.

Restored wasd in V-Sekai build.

Also the last line also reduced the warning from 700 to around 8-30

Last week improved openxr support but not yet locomotion.

Hand actions and triggers still bugged

Collaboration with Khronos and Lucasfilm has added gltf principled pbr to materialx

A static materialx baking importer has been added to a Godot Engine c++ master module

Abandoned the work on webview because it required too much mingw hacking of windows calls. Should have worked in msvc still
https://github.com/AcademySoftwareFoundation/MaterialX/issues/874

Want to propose gltf specular and gltf volumetric to the godot engine rendering team

Worked on an idea with Krsytof https://github.com/godotengine/godot-proposals/discussions/4226 to pin inspectors.

Fire collaborated with Tokage and Lyuma on the UIUX of a skeletal retargeting importer

Started a discussion on a train station stress test. https://github.com/godotengine/godot-proposals/discussions/4233

## 2022-03-07

OpenXR mode works!!!

Made a skeleton retargeting demo.

## 2022-03-05

### @ellenhp

Added a new audio effect to down-mix stereo audio to mono progressively. https://github.com/godotengine/godot/pull/58823

### @fire

1. Allow automatic lod when importing 3D scenes with Static Lightmaps https://github.com/godotengine/godot/pull/58548
1. productionize a clothing band / bracelet maker on 3d manifold-only meshes https://github.com/fire/geodesiac-path-on-mesh
1. play with a auto-ml thing that guesses floats, guesses classes and forecasts https://mindsdb.com/
1. working with the animation team to approve the skeleton animation retargeter. https://github.com/godotengine/godot/pull/56902
1. convinced the gltf blender maintainer it's super easy to export pure 3d animations as gltf. https://github.com/KhronosGroup/glTF-Blender-IO/pull/1582
