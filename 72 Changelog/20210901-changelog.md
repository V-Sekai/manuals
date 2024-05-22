# V-Sekai Changelog - 2021-09

- 2021-09-30 18:33:19Z fire: Saracen https://github.com/godotengine/godot/pull/52210 https://cdn.discordapp.com/attachments/836651615532482611/893203877367779408/unknown.png
- 2021-09-30 01:28:33Z fire: https://www.youtube.com/watch?v=Dp42lQYVzwo&t=47s
- 2021-09-29 22:12:20Z fire: Holoplay initial commit https://github.com/CaptainProton42/GodotHoloPlayExtension
- 2021-09-29 22:08:01Z fire: "Fales 12:31 PM
  Okay peeps, I got the WebRTC plugin for 4.0 to build on all platforms (and most architectures): https://github.com/Faless/webrtc-native/actions/runs/1288153747 ." 👍 (1)
- 2021-09-29 21:39:33Z fire: Closed 6 bugs related to 53114
- 2021-09-29 21:03:56Z fire: https://github.com/godotengine/godot/pull/53114 Merged
- 2021-09-29 20:23:20Z lyuma: "Posted the glTF export bugfix for review. Fixes blend shapes, skeletons and nested bone attachment hierarchies:
  https://github.com/godotengine/godot/pull/53114"
- 2021-09-29 10:10:12Z lyuma: Successfully exported a glTF model with multiple surfaces and blend shapes: https://cdn.discordapp.com/attachments/836651615532482611/892714872012406794/unknown.png kickass (2)
- 2021-09-28 22:34:20Z fire: <player two> has entered the discussion
- 2021-09-28 22:33:40Z fire: Spent some time at OMIGROUP discussing OMI-WASM-ECS
- 2021-09-28 16:33:48Z fire: https://twitter.com/mux213/status/1442820373322420224?s=20 😎 (2)
- 2021-09-28 16:25:34Z fire: Updated https://github.com/V-Sekai/godot/tree/export_skin_fixes to master
- 2021-09-27 21:24:18Z fire: > From reduz all would you be up for an animation meeting tomorrow?
- 2021-09-27 19:30:01Z fire: point to child and point to global as a skeleton modifier. just dreamed this. Per frame 😱
- 2021-09-27 17:03:16Z fire: https://github.com/GodotVR/godot_xr_reference
- 2021-09-27 15:31:37Z lyuma: "Nice blog post by Mux about GDExtension! A good read:
  https://godotengine.org/article/introducing-gd-extensions
  Maybe we can try making one of these for VRM springbone" 👍 (2)
- 2021-09-27 14:32:29Z fire: Wrote down a bake miku miku motion workflow. With a rebased 3.x (not 3.3) we can export the baked scene with a manual step to delete the face / blendshapes. Remember to copy both the reset and the transferred anim. Then in 4.0 import and put it on the original vrm. Enable RESET bake.
- 2021-09-27 14:26:53Z fire: Reviewed godot-tests pr and had some comments. Added a comment to fix export of skeletons and skins. Tested the export more. Noted a weird issue where if the blend was animated it would cause the blend shape to be exported wrong. Like `a` shape mouth blend set to 1.0 and looking in blender
- 2021-09-27 14:25:36Z fire: Approved gltf2 making light activate again. Discussed IK with Eron and on VRM rests.
- 2021-09-27 12:51:50Z fire: I exported the scene from your pr. Testing it with joy set to 1. https://cdn.discordapp.com/attachments/836651615532482611/892030776210780210/unknown.png
- 2021-09-27 07:18:36Z fire: godot-tests? ✅ (1)
- 2021-09-27 07:18:31Z fire: Lyuma want to add cursed hat to the models repo?
- 2021-09-27 07:01:50Z lyuma: Pushed pull request https://github.com/godotengine/godot/pull/53114 to address gltf skin and skeleton objects being generated at the wrong time during the export process. Still in draft state because it needs more testing.
- 2021-09-26 11:28:12Z Saracen: https://github.com/godotengine/godot/pull/53086 🐱 (2)
- 2021-09-24 18:21:54Z fire: Ellenhp discussion about HRTF audio in the audio channel in chat.godotengine.org.
- 2021-09-24 14:59:37Z fire: Good news everyone. https://twitter.com/yunayuna64/status/1441288908659048453
- 2021-09-23 22:43:33Z lyuma: "Just resolved yet another server downtime. It was down overnight because I was unavailable to investigate due to an appointment.
  Cause for failure: Fedora (without NetworkManager?) defaults to non-daemonized dhclient and allowed the dhcp lease to expire.

To prevent future disruption, I have implemented both mitigations outlined in this helpful ServerFault answer!
https://serverfault.com/a/291202
regrets_for_not_using_ubuntu++;"

- 2021-09-23 21:28:31Z fire: https://github.com/V-Sekai/godot-vrm/issues/23 👍 (1)
- 2021-09-23 09:02:30Z lyuma: in terms of ui, is VisualScript good?
- 2021-09-23 09:02:13Z lyuma: "co-opting this channel to discuss the AnimationTree draft proposal
  > https://docs.google.com/document/d/1mkGjnj8VzCJmZS2x6l6qMVvemylGR2OPYq4hF-sTPRI/edit?usp=sharing

I think the overall design is great. we are wondering how to configure the variables"

- 2021-09-22 19:42:40Z fire: VMD to VRM Dance https://cdn.discordapp.com/attachments/836651615532482611/890322222042976286/2021-09-22_12-03-13.mp4 👍 (3)
- 2021-09-21 01:25:13Z fire: First draft of new updated extensions api. https://github.com/godotengine/godot/pull/52802 Lyuma
- 2021-09-20 23:21:50Z lyuma: Cool
- 2021-09-20 23:19:13Z fire: Chatted with Robert. Proposed design to do the import_node and import_scene APIs as a first pass for the OMI_audio_emitter extension. Can fallback to post hook.
- 2021-09-20 22:44:46Z lyuma: ImporterMeshInstance3D. Nice that is moving out of the Editor namespace, and less typing
- 2021-09-20 22:44:11Z fire: https://cdn.discordapp.com/attachments/836651615532482611/889643129525907546/unknown.png
- 2021-09-20 19:50:39Z fire: gltfdocument extensions works I think. next steps 1) review 2) merge 3) update godot-vrm. for now. khajit needs food
- 2021-09-20 19:31:58Z fire: false success >.>
- 2021-09-20 16:57:12Z fire: > reduz: it should only check whether its the same for vertex, normal and tangent
- 2021-09-20 12:26:23Z fire: openvr
- 2021-09-20 12:26:06Z fire: and after you compile it make sure you create a new `extensions_api.json` and copy the `gdnative_extensions.h` file into the godot-cpp of the plugin
- 2021-09-20 12:25:53Z fire: https://github.com/BastiaanOlij/godot/tree/xr_extension_return_buffers
- 2021-09-19 04:43:53Z fire: Contacted moody he wanted to get scons ninja and scons shared libraries done. there are new prs needing review
- 2021-09-19 04:33:10Z fire: Lots of headless crash bugs
- 2021-09-19 04:13:07Z fire: https://cdn.discordapp.com/attachments/836651615532482611/889001129877340160/unknown.png 😩 (1)
- 2021-09-19 03:23:59Z fire: Next up. rebuild GDExtension Openvr
- 2021-09-19 03:18:41Z fire: Spending some time checking CICD still works. Updated misc. See logs on pipeline https://github.com/V-Sekai/groups-gocd-pipelines/
- 2021-09-18 19:32:11Z lyuma: "Updated cluster install directions to account for the recent changes seeing remote ip; cockroachdb not from helm; and disabling eviction:
  https://github.com/V-Sekai/v-sekai-proposals/blob/master/docs/decisions/20200602-manage-backend-with-k3s.md"
- 2021-09-18 18:48:46Z lyuma: "Our server was down for 4 hours due to a kubernetes misconfiguration (one of the options was reverted to default by mistake when changing the network metallb options):

To correct, I edited /etc/systemd/system/k3s.service
and changed the ExecStart lines to:

```cs
ExecStart=/usr/local/bin/k3s \
    server \
        '-o' \
        '/root/.kube/config' \
        '--default-local-storage-path' \
        '/kube/pvc' \
        '--disable=traefik' \
        '--disable=servicelb' \
        '--disable=flannel' \
        '--disable=cni' \
        '--kubelet-arg=eviction-soft=memory.available<0%,imagefs.available<0%,nodefs.available<0%' \
        '--kubelet-arg=eviction-hard=memory.available<0%,imagefs.available<0%,nodefs.available<0%' \
```

- 2021-09-18 12:41:48Z fire: "> WOW.... workarounds galore and its not pretty, and it crashes badly when you exit Godot, but OpenVR is breathing life and renders to the headset now. That means that the system at its core is working and we're now at a stage of fixing bugs (well I still need to finish the changes to controllers).

> For OpenXR there is far more work to do because there currently isn't any support for rendering to texture chains supplied by the plugin and I'm only about halfway through converting all the code.
> I plan to do more on that conversion tomorrow as I wait for things to be fixed in Godot before I can take the next steps with OpenVR."

- 2021-09-18 12:41:23Z fire: > mux
- 2021-09-18 03:58:34Z fire: https://github.com/godotengine/godot/pull/52802
- 2021-09-18 01:04:23Z fire: https://cdn.discordapp.com/attachments/836651615532482611/888591247835541584/unknown.png
- 2021-09-18 01:04:19Z fire: first draft design of GLT2DocumentExtensionEditor
- 2021-09-17 07:07:15Z fire: https://twitter.com/VR_Rosie/status/1438600868245426180?s=20
- 2021-09-16 16:24:13Z fire: Added https://github.com/godotengine/godot-proposals/issues/3305 and updated https://github.com/godotengine/godot-proposals/issues/3273
- 2021-09-16 06:28:45Z fire: "Lyuma Saracen When I wake up tomorrow I'm going to be hyped and implement
  https://hackmd.io/37S0FGw7TruwjiLIspl8vQ. I think the proposal is ready to go. Please read and comment."
- 2021-09-15 15:58:29Z fire: https://twitter.com/bjornornorn/status/1435607551031357443?s=20 🆗 (1)
- 2021-09-15 15:57:26Z fire: "Having fun with shaders, but gotta go do errands. Trying to make the circle fit the box. Might need some help
  https://github.com/V-Sekai/godot/tree/ok_color"
- 2021-09-15 15:57:09Z fire: https://cdn.discordapp.com/attachments/836651615532482611/887728757702537247/unknown.png
- 2021-09-15 00:43:01Z fire: Devise a workflow for https://github.com/godotengine/godot/pull/49775#issuecomment-919608377
- 2021-09-14 18:23:20Z fire: https://hackmd.io/37S0FGw7TruwjiLIspl8vQ
- 2021-09-14 17:18:20Z fire:
  > Discussion this morning with Reduz to unify the `Ref<GLTFDocument>` api.
  >
  > - `load_file()`, `load_buffer()` that just generates the internal state, and `save_file` and `save_buffer` functions that save back the files.
  > - `parse_scene(Node*)` generates the internal state from a Node* scene. And Node* write_scene() writes it out
  >
  > Expose a `Vector<Ref<GLTFDocumentExtension>>`"
- 2021-09-14 17:17:39Z fire: https://github.com/godotengine/godot/pull/52541#issuecomment-919353368 Lyuma, Saracen, MMMaellon, Silent. Feedback requested on GLTFDocument api.
- 2021-09-14 07:23:22Z fire: Four Godot 4 prs on my list -- 1) libcurl complete the pr and not be at 98% 2) core based gltf i/o 3) svg 4) cvtt
- 2021-09-13 22:44:02Z fire: https://cdn.discordapp.com/attachments/836651615532482611/887106377716224000/2021-09-13_15-42-22.mp4 👏 (4)
- 2021-09-13 22:33:29Z fire: https://github.com/TwistedTwigleg/Godot_GSOC_2020_Project/tree/IK_Modification_Fix Updated Skeleton Modifier example code Saracen
- 2021-09-13 19:07:30Z fire: Put https://github.com/godotengine/godot/pull/52541 for review again.
- 2021-09-13 19:07:11Z fire: Godot Meson updates https://github.com/godotengine/godot/pull/52311#issuecomment-918474496
- 2021-09-13 11:08:54Z fire: "Contacted Eron and sent demo materials.
  https://ifiregames.itch.io/chibifire-godot-4-custom-engine
  https://github.com/V-Sekai/godot-ik-tests"
- 2021-09-13 11:08:14Z fire: Can't sleep so updated the skeleton modification demo https://github.com/godotengine/godot-demo-projects/issues/649
- 2021-09-11 17:59:00Z fire: Eron was interested in ewbik on sunday
- 2021-09-11 16:37:08Z fire: https://github.com/V-Sekai/godot-vrm/issues/22
- 2021-09-11 16:32:05Z fire: Lyuma I updated godot engine to remove PackedSceneGLTF. The changes will be posted in a bit for godot-vrm
- 2021-09-09 17:50:45Z fire: 👀 https://www.vrfocus.com/2021/09/ray-ban-stories-is-facebooks-299-entry-into-the-smart-glasses-market/
- 2021-09-08 17:24:52Z fire: Lyuma Saracen from reduz > fire it looks good. We got quite a lot of demand to make the GLTF importer part of core, given it is needed for VR and other stuff, so I have the feeling we should optimize it for performance (which we should do anyway) and have an option to load actual meshes instead of EditorImporterMesh.. so that means we would need to provide a function to parse the mesh node into a scene node and the editor supplies, otherwise it uses Mesh as a default
- 2021-09-07 18:32:54Z fire: Miku Base Textures https://cdn.discordapp.com/attachments/836651615532482611/884868837978288178/unknown.png
- 2021-09-07 18:02:00Z fire: Miku Miku Dance now split into materials. https://cdn.discordapp.com/attachments/836651615532482611/884861074648760380/unknown.png 👍 (2)
- 2021-09-07 16:39:33Z トカゲ: "fixed skinning
  https://github.com/godotengine/godot/pull/52462"
- 2021-09-07 05:53:14Z fire: https://cdn.discordapp.com/attachments/836651615532482611/884677671563460639/unknown.png
- 2021-09-07 02:10:09Z fire: Trying to write down steps to make a V-Sekai/godot update
- 2021-09-06 00:25:10Z fire: https://cdn.discordapp.com/attachments/836651615532482611/884232728839606284/kaitai_mmd_pmx.zip
- 2021-09-06 00:24:45Z fire: https://github.com/kaitai-io/kaitai_struct_formats/pull/446 Lyuma Thanks to Hakanai I can now generate mmd_pmx c++/stl via `& 'C:\Program Files (x86)\kaitai-struct-compiler\bin\kaitai-struct-compiler.bat' --cpp-standard=11 --target=cpp_stl .\3d\mmd_pmx.ksy -I=. --cpp-namespace kaitai_mmd_pmx` Also glb binary has a parser for read and write too. Can also do fbx!?!!!! Also tscn, scn, tres and res mikuleek (3)
- 2021-09-06 00:09:07Z トカゲ: "Child class of `EditorProperty`'s `read_only` property has been implemented correctly
  https://github.com/godotengine/godot/pull/51722" https://cdn.discordapp.com/attachments/836651615532482611/884228687992594482/2021-09-06_9.07.35-1.mov 👍 (2)
- 2021-09-04 02:10:44Z fire: GLTF Skeletons
- 2021-09-04 01:30:12Z lyuma: We found an infinite recursion bug in the godot gltf exporter caused by the construction of gltf node objects from skeletons and skins. I believe the issue is treating skeletons as special objects, and if we expand skeleton bones to nodes initially that should simplify things greatly and prevent this type of bug.
- 2021-09-03 22:23:17Z fire: use vnen's fix to replace saracen's auto load fix
- 2021-09-03 15:36:00Z fire: If you were crashing Godot Engine when opening vrms, it's a Nvidia driver bug. Please update.
- 2021-09-03 08:10:01Z lyuma: This was all imported using Unidot on godot 4.x (with progress bar patch :-p)
- 2021-09-03 08:09:11Z lyuma: https://cdn.discordapp.com/attachments/836651615532482611/883262336243216424/rin_himeji_lineup.png FeaturingDanteFromTheDevilMayCry (1)
- 2021-09-03 08:09:06Z lyuma: Fixed material searching logic for legacy materials. There are some issues with material ordering, but most scenes now import with the correct materials! https://cdn.discordapp.com/attachments/836651615532482611/883262312969011250/rin_himeji_diorama2.png
- 2021-09-03 08:08:15Z lyuma: https://cdn.discordapp.com/attachments/836651615532482611/883262098942079026/archery_sample.png
- 2021-09-02 03:56:26Z lyuma: "Progress on Unidot Importer: I made some major fixes on binary asset deserialization: I finally figured out how padding works (short answer: flag 0x4000 adds padding after a byte or short), and fixed a crash by implementing support for Unity 4.x and earlier assets, since you never know where they will show up.

Next up is parsing the texture filename mapping from FBX files to assist in material discovery, since Unity legacy materials default to lookup by texture _filename_ rather than material name or texture name. Since Godot has no means for preserving the original filename on import when the files are not present, doing a fix to the FBX2glTF tool won't quite cover my necessary usecase, so I think extracting the map in the tooling is easiest. Will probably revisit this decision later." 👍 (4)

- 2021-09-02 01:27:40Z fire: https://twitter.com/babylonjs/status/1433216048036122629?s=20 webgpu
- 2021-09-01 21:26:59Z fire: <hesien bugs>
- 2021-09-01 15:39:17Z fire: Tried to get additional screenshots to work https://github.com/godotengine/godot/pull/52316
- 2021-09-01 14:53:33Z fire: Worked with ellenhp on a proposal on import, to extract all the vorbis packets and just decode vorbis so the imported file gets rid of the ogg container. This is to remove stb_vorbis because of its documented crashing nature. Has preapproval from reduz.
