# V-Sekai Changelog - 2021-06

- 2021-06-30 17:31:02Z lyuma: Updated the GDScript migration script: https://github.com/V-Sekai/gd3to4/commit/bad3998a69273ba3b1172cead10363b7fda706cd
- 2021-06-30 17:29:12Z lyuma: "Posted the MToon shader on the Godot Shaders page:
  https://godotshaders.com/shader/mtoon-shader-for-godot/"
- 2021-06-30 09:27:28Z fire: Shaved some yaks to get the point of gltf2 export. Made 5 prs.
- 2021-06-29 15:13:05Z fire: "Today I will work on:

- [x] Expedite the SVG PR https://github.com/godotengine/godot/pull/49645
- [ ] Investigate gltf2 export https://github.com/godotengine/godot/pull/48947 and https://github.com/fire/godot/tree/gltf-export-02
- [ ] Investigate VOIP in Godot Engine outside of Godot Engine org tree"
- 2021-06-28 03:02:32Z fire: Sent saracen an animation test
- 2021-06-27 20:35:13Z fire: I wrote a 20 step instruction on how to save any pose as the rest pose. https://github.com/V-Sekai/blue-tin-fox-models/blob/master/characters/blender-save-pose-as-rest-pose.md
- 2021-06-27 04:34:09Z fire: Invited a few new people this week. Say hi to LillyByte from Godot Engine Discord and mrmetaverse from OMI Group
- 2021-06-24 22:57:41Z fire: https://hubs.mozilla.com/spoke/projects/new?sceneId=Rpt8DJS
- 2021-06-24 22:40:50Z fire: https://github.com/MozillaReality/hubs-blender-exporter https://github.com/KhronosGroup/glTF/pull/1400 Lyuma
- 2021-06-24 21:34:56Z fire: Talked with Robert from OMI about the useful of a spatial audio emitter extension. There's also a microsoft and a mozilla hub implementation for spatial audio node in wav?, mp3? or ogg? . He had unfinished business with the extension namespace of hubs and wanted to split it.
- 2021-06-23 00:19:33Z lyuma: "https://github.com/V-Sekai-godot-hop-spin-dance
  Don't get your hopes up quite yet: A lot of the lower level dependencies for scene packing and t-posing are not converted yet, but the tool scripts work now, so it's a start :-p" 🔥 (1)
- 2021-06-23 00:19:07Z lyuma: Worked with fire to get the avatar conversion tool updated, using the high level vsk_avatar vsk_vrm_avatar_tool modules: https://cdn.discordapp.com/attachments/836651615532482611/857052116593803284/unknown.png
- 2021-06-22 23:48:06Z lyuma: mux says they also keep hitting this issue. they also made the connection to set_name() interestingly
- 2021-06-22 23:47:51Z lyuma: after a day of debuggin, Saracen got a reproduction project here: https://github.com/godotengine/godot/issues/49843
- 2021-06-22 23:22:17Z fire: Another day. Implement vrm quaternion format from lox9973 from ShaderMotion to move godot VRMs
- 2021-06-22 21:00:23Z fire: We ported the avatar T-Poser to the point the menu popup shows and checkpointed, then concluded for lunch. Multiple modules were ported.
- 2021-06-22 20:56:35Z fire: https://github.com/godotengine/godot-proposals/issues/2903 Lyuma wrote a proposal
- 2021-06-22 17:33:46Z fire: "Did a 5 minute design for libcurl in Godot Engine. Use
  https://github.com/OpenAPITools/openapi-generator/tree/master/modules/openapi-generator/src/main/resources/C-libcurl as a template."
- 2021-06-22 17:22:01Z fire: Defined a mantra for groups: `Presence with custom avatars and custom worlds.`
- 2021-06-22 15:55:37Z fire: Updated https://github.com/godotengine/godot/pull/49645 CICD Passes https://cdn.discordapp.com/attachments/836651615532482611/856925406166515722/unknown.png
- 2021-06-21 13:24:31Z fire: Did I do this wrong? A vs B cs C https://imgsli.com/NTgzMDk/1/2
- 2021-06-21 12:40:26Z fire: Good news, the gd_util, math_util and vsk_avatar plugin enables. Now to test it.
- 2021-06-21 03:30:21Z fire: Updated godot-vrm to latest master. https://github.com/V-Sekai/godot-vrm/tree/master 👍 (1)
- 2021-06-20 23:44:26Z Saracen: More fixes to be compatible with the latest master branch. Also making more bug reports for serious issues I encounter 🐛 (1),👍 (1)
- 2021-06-20 20:29:37Z fire: It's pretty slow like 7 seconds
- 2021-06-20 20:29:23Z fire: > RGBA Max error: 77 RMSE: 1.55 PSNR 44.34 dB
- 2021-06-20 20:29:22Z fire: # bc7_enc_rdo
- 2021-06-20 20:29:01Z Saracen: Wow, the existing one is already pretty fast. Good job!
- 2021-06-20 20:28:33Z fire: "# Current (1 thread)
  RGBA Max error: 57 RMSE: 0.85 PSNR 49.57 dB
  CVTT 1024x1024 total time: 1.55 secs
  \# Previous (1 thread)
  RGBA Max error: 28 RMSE: 0.43 PSNR 55.53 dB
  CVTT 1024x1024 total time: 35.68 secs"
- 2021-06-20 20:28:32Z fire: https://github.com/fire/godot/tree/faster-cvtt Lyuma Saracen Faster BPTC compression.
- 2021-06-19 22:42:58Z Saracen: I think I managed to fix the performance issue. It was a badly ported coroutine calling a heavy function continually. Still some issues with pathfinding and abilities not executing, but it's at least actually functioning now.
- 2021-06-19 19:22:18Z Saracen: Further fixes, there's workarounds now for the tool I wrote to extract root motion. Two of the notable bugs I've discovered are ConfigFile.load returning random values and the fact that there doesn't seem to be implicit casting between String and StringName. Want to create some example projects for this. It's also worth noting that while Amethyst is close to being functional now, it's running OBSCENELY slow at the moment. 🦥 (1)
- 2021-06-19 18:01:49Z Saracen: Some more progress on the Amethyst port
- 2021-06-19 07:45:39Z fire: Can now export blends to gltf2 and save as an artifact. Also installs vrm plugin.
- 2021-06-19 07:45:30Z fire: https://github.com/V-Sekai/blue-tin-fox-models
- 2021-06-19 00:16:57Z fire: Discussed with Saracen and Acquaintances to add a female mannequin to add coloured characters.
- 2021-06-18 21:01:16Z fire: https://github.com/godotengine/godot/pull/49717
- 2021-06-18 20:15:22Z lyuma: That's a bug with shadow mesh actually
- 2021-06-18 20:14:42Z fire: https://github.com/godotengine/godot/issues/49706
- 2021-06-18 10:29:49Z lyuma: https://cdn.discordapp.com/attachments/836651615532482611/855393862876790804/avp_living.jpg
- 2021-06-18 10:28:07Z lyuma: There are still things missing, of course: for example, some materials like the walls use a custom shader with nonstandard property names... but the overall scene structure does get imported! 👏 (3)
- 2021-06-18 10:27:51Z lyuma: I'm proud to announce that Unidot Importer was finally able to import the "Vol. 6" AirBnB House without any major errors! https://cdn.discordapp.com/attachments/836651615532482611/855393367545085983/unknown.png
- 2021-06-17 22:53:22Z fire: 2 visual script godot engine prs merged
- 2021-06-17 17:01:09Z fire: !!!
- 2021-06-17 16:59:42Z Saracen: I pushed an experimental branch of Amethyst designed to work in 4.0 upstream to a new branch. The behaviour tree is still broken though.
- 2021-06-16 23:24:26Z fire: https://github.com/fire/godot/tree/bc7enc_rdo Updated
- 2021-06-16 23:23:49Z fire: https://github.com/godotengine/godot/pull/49669 Lyuma not sure if it's the crash
- 2021-06-16 17:55:57Z fire: OMI meeting notes.
- 2021-06-16 17:54:58Z fire: https://cdn.discordapp.com/attachments/836651615532482611/854781112055234561/June_16th_2021_OMI_Meeting.pdf
- 2021-06-16 17:52:52Z fire: ThorVG made bugfixes to my failure code.
- 2021-06-16 07:18:45Z fire: Got very sidetracked. Also implemented ThorVG to compare.
- 2021-06-14 16:30:44Z fire: Code review from Blender for faster baking performance
- 2021-06-14 16:30:09Z fire: https://github.com/godotengine/godot/pull/49601 PR for SVG module.
- 2021-06-13 02:50:12Z fire: Woke up with a dream. openseeface as a body tracker. https://github.com/you-win/openseeface-gd/issues/16
- 2021-06-13 02:44:32Z fire: Related to the comic book reader idea for vr
- 2021-06-13 02:39:39Z fire: I wrote a SVG module for godot engine https://github.com/sammycage/lunasvg/issues/47
- 2021-06-12 22:26:57Z fire: I think I'm breaking lyuma's server
- 2021-06-12 22:26:21Z fire: Godot Engine 4 and Groups 4.x builds have been flowing for the last day or so on itchio
- 2021-06-12 22:16:36Z fire: Chatted with youwin with Lyuma and did work on gdopenseeface, gltf and godot-vrm
- 2021-06-12 22:16:09Z fire: Chatted with https://twitter.com/CaptainProton42 and joined a few repositories
- 2021-06-11 22:07:17Z fire: https://github.com/Tom94/tev !
- 2021-06-11 03:46:06Z lyuma: Updated the `@export` fix for a third time. It's amazing how many different ways there are to fix bit operations on a single line of code
- 2021-06-11 03:45:26Z lyuma: Updated shader_improvements_meta_3.x branch for latest 3.x godot so someone could try SCSS (I want to keep it for historical purposes). I'm not going to update 4.x because it's in flux and too much churn with renames to keep anything working
- 2021-06-11 03:44:54Z lyuma: Found a bug in MToon, related to a line of code that flips the normal if it's pointing backwards from the view direction (you can see this if you look at an MToon face with custom normals from a sharp direction).
- 2021-06-10 22:56:30Z fire: Restoring the CICD builds for godot 4. I did the changes, but currently verifying that it builds on Groups 4.x and then I'll try github.com/godotengine@master
- 2021-06-10 03:11:20Z fire: https://cdn.discordapp.com/attachments/845777129605300255/852383622606094346/unknown.png https://cdn.discordapp.com/attachments/845777129605300255/852383560882323487/unknown.png I tested compute graphs earlier. This is is the important part. I can now start a github action, start a kubernetes server, start a argo server, start an alpine linux image, have a whale message a hello world and then save it as a file and have it be download as a github artifact
- 2021-06-09 20:50:29Z lyuma: "I tried baking lighting in the ""AirBNB"" and ran into this error:
  > WARNING: Inconsistency found in triangulation while building BSP, probe interpolation quality may degrade a bit.
  > at: LightmapGI::_compute_bsp_tree (scene\3d\lightmap_gi.cpp:460)
  >
  > Jfons informed me it is an issue with separating tetrahedrons. The scene has 2641 light probes so there's probably something suspect there. I'll have to look into it further. I think I have an idea: we have to make sure there are probes above and below to form a complete tetrahedron"
- 2021-06-09 20:49:09Z lyuma: "Summary about lightmap UV problem: Mesh scale & import scale matters when dealing with lightmaps. There were bugs reading the scale, but now that is fixed and the issue with losing polygons will only happen on triangles with 1e-7 edge length in world space.

The issue with removing mesh edges still exists, in theory, but in practice it seems unlikely so let's wait and see if it shows up in the wild and then we can take another look"

- 2021-06-09 18:09:18Z lyuma: https://cdn.discordapp.com/attachments/836651615532482611/852248004215570432/unknown.png
- 2021-06-09 18:07:18Z lyuma: Due to a glitch in Godot's etcpak implementation, I had to use BPTC texture compression. It took 3-4 hours to compress all the textures :-p (I can't use uncompressed textures because VRAM isn't free and I don't own a 3090) godette (1)
- 2021-06-09 18:06:25Z lyuma: so it's bound to improve further. it's pretty fun seeing this place come together
- 2021-06-09 18:06:04Z lyuma: A lot of objects are missing material assignments due to naming rules (for example " - " or " #" in filenames
- 2021-06-09 18:05:39Z lyuma: I know it's not the v-sekai 4.x port but I took a break from it to work a bit more on fixing import issues: https://cdn.discordapp.com/attachments/836651615532482611/852247085931298896/unknown.png
- 2021-06-09 13:44:28Z fire: https://github.com/godotengine/godot/pull/49458#event-4864988341 Lyuma
- 2021-06-08 16:57:57Z fire: Blank screen
- 2021-06-08 16:57:53Z fire:

```OpenVR: initialising OpenVR context
Application in scene (normal) mode.
Main OpenVR interface has been initialized
Main render models interface has been initialized.
Exec path: C:/Users/XXXX/Desktop/groups-4.x/godot/bin
```

- 2021-06-08 16:04:42Z fire: Fell asleep doing Quat and Transform3D renames
- 2021-06-08 12:25:39Z fire: "Need to build godot, then copy the generated files for GDNative.
  `--gdnative-generate-json-api api.json`
  `--gdnative-generate-json-builtin-api builtin_api.json`"
- 2021-06-08 10:22:22Z fire: Lyuma Openvr godot 4
- 2021-06-08 10:21:49Z fire: fire build godot using:

godot#49301

Then build the plugin with:

godot_openvr#123

Make sure to use vnens godot-cpp and copy all the gdnative headers and stuff into place from your godot build"

- 2021-06-08 02:36:48Z fire: Lyuma Saracen MMMaellon https://cdn.discordapp.com/attachments/836651615532482611/851650948467916810/unknown.png 👍 (1),VRDude (2)
- 2021-06-07 19:44:27Z fire: https://github.com/godotengine/godot/pull/49401 PR
- 2021-06-07 07:02:52Z fire: Made a release of FBX2glTF https://github.com/V-Sekai/FBX2glTF/releases/tag/v2021-06-07T06_5500_00
- 2021-06-06 16:20:36Z fire: ✨ Silent's Birthday Party. Cake, Shrine and 15 fps. Someone mentioned there was a guest list of a hundred.
- 2021-06-04 14:59:40Z fire: My first Blender pr. ✨ https://developer.blender.org/D11502/new/ 👍 (1)
- 2021-06-03 22:27:31Z fire: Lyuma lots of things changed today. Including Transform -> Transform3D
- 2021-06-03 14:55:15Z fire: Meeting done.
- 2021-06-03 12:59:57Z fire: "Lyuma Saracen MMMaellon PR review meeting on https://meet.jit.si/godot-pr-review in 5 min, everyone welcome.
  We'll bikeshed about ""breaks compat"" PRs for 4.0 (mostly renaming stuff in the API, etc.)"
- 2021-06-03 04:47:29Z fire: "

  ````c++
  diff --git a/source/blender/io/collada/AnimationExporter.cpp b/source/blender/io/collada/AnimationExporter.cpp
  index 73952b06bc9..3679dd090b4 100644
  --- a/source/blender/io/collada/AnimationExporter.cpp
  +++ b/source/blender/io/collada/AnimationExporter.cpp
  @@ -100,6 +100,10 @@ bool AnimationExporter::exportAnimations()
      openLibrary();

      BCObjectSet::iterator it;
  +
  +#ifdef WITH_OMP
  +#pragma omp parallel for
  +#endif
      for (it = animated_subset.begin(); it != animated_subset.end(); ++it) {
          Object *ob = *it;
          exportAnimation(ob, animation_sampler);``` 15 minutes to 5 minutes gltf2 anim export.
  ````

- 2021-06-02 20:39:33Z fire: Lyuma Any thoughts on making Mousse a VRM? I'm stuck. Meshes are not exporting from Blender. Compiling Blender 2.93 (LTS) for debugging.
- 2021-06-02 20:19:18Z fire: Wasm GDNative and Godot Engine will be evaluated in future releases https://twitter.com/nonunknown3/status/1400090487005011970?s=20
- 2021-06-02 20:14:14Z fire: \o/ Blender 2.93 is out https://www.blender.org/download/releases/2-93/ https://twitter.com/i/status/1373384489146142720
- 2021-06-02 19:03:14Z fire: Worked with Lyuma with posting a comment about small and bigger than [-1, 1] weights on blend shapes. Will send it off to the rendering team and we're punting it.
- 2021-06-02 15:08:21Z fire: Spent an hour debugging gltf2 blend shapes. 💤 Conclusion, blender export bug in 2.91 (stable is 2.92)
- 2021-06-01 15:03:23Z fire: lottie -> zstd compressed packaged scene (online)
- 2021-06-01 15:03:08Z fire: inkscape -> lottie -> saved in an ordered list container with zstd (all offline). `.cb7l`
- 2021-06-01 14:41:05Z fire: Investigating a path where we do pdf -> svg (vectors and raster images) -> lottie (vectors and raster images)
- 2021-06-01 13:43:29Z fire: Finding libraries that does pdf https://github.com/reMarkable/pdfium-binaries https://pdfium.googlesource.com/pdfium/+/HEAD/docs/getting-started.md `pdfium page as_image`
- 2021-06-01 06:25:26Z lyuma: https://twitter.com/VSekaiOfficial/status/1399608449101484032
