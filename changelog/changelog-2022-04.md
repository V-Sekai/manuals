# V-Sekai Changelog - 2022-04

Moved issues into the tracker.

## 2022-04-18

Worked with manifold csg library author and was able to remove the boost dependency. https://github.com/elalish/manifold/pull/92

Also published a first draft on a Godot Engine master branch. See the issue for details.

## 2022-04-05

Lyuma

Made a lot of progress towards animation import in Unidot. Godot's node system means that some paths become different: for example, meshes have to be reparented to skeletons; or extra levels in the hierarchy to keep track of physics bodies.

To this end, it is now keeping a lookup dictionary from path and component to fileID (which can be mapped to Godot node) which means animation support should be close.

(Also, they made a major change to the import system in 2019 which affects id numbering. Still working on it)

Pushed a major update to Unidot, mostly in the post_import script. It should now generate paths much more accurately to the original file, and implemented the hashing algorithm used by Unity 2019 for file ID generation, for example generating ids like 919132149155446097 for the root object.

This has fixed some assets exported from Unity 2019 like below, which used to fail to resolve the fileIDs for meshes! @iFire

Made some progress with terrain import in Unidot. It will import textures, normalmaps and splatmaps (creating an appropriate ShaderMaterial). My plan is to implement trees and grass using MultimeshInstance objects. With this I also now support texture assets. Texture Arrays seem to fail internally. Hard to tell if I did something wrong or something isn't implemented on Godot's end, but we'll get there...

performance-wise, I think it's now acceptable to just pipe all 2+ million polygons (for 1025x1025 terrain) to the GPU. I'm using tristrips so it's mostly just 1 index per triangle. It might be better to use a more dedicated terrain system for this, so this is just a stopgap while Godot 4 is in development since the terrain systems in the asset library are not keeping up with the rapid pace of development.
(if you're interested in this subject, feel free to start a thread or reply on godot-general)

Terrain trees, splatmaps and materials are implemented in Unidot, converting to a single conventional terrain mesh + multimesh. I have not implemented holes yet, but if someone has an example and there is demand, I could work on it.

I also chose not to implement detail (grasses), because I don't understand how detail patches are implemented, and they tend to not look that great in VR, so I'd rather work on something else.

## 2022-04-14

- Restore fix-save-as-binary so we can export projects
- Restore elixir shared branch so we can run godot in elixir
- Poked ludwig about diffusion net for machine learning training.

## 2022-04-07

FBX2GLTF and Blender importers are merged.

## 2022-04-03

iFire

- Made a bug report for Blender exported animation to gltf with @RockyMadio https://github.com/KhronosGroup/glTF-Blender-IO/issues/1613
  GitHub
