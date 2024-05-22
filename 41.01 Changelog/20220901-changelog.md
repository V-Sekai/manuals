# V-Sekai Changelog - 2022-09

# 2022-09-05

tefusion took iFire's previous Godot Engine 3 branch and forward ported quad subdivision to an gdextension addon https://github.com/tefusion/godot-subdiv

We discuss with Reduz, Calinou and Lyuma about astc and limiting astc block size to 4x4, 8x8, and 12x12 block sizes. 4x4 was agreed on. Others have not yet.

# 2022-09-06

Restored Lillybyte's https://github.com/godotengine/godot/pull/59675 Show the 3D transform gizmo in the center when otherwise offscreen work.

Godot Engine astc block size agreed to be 4x4 and 8x8.

Saracen's Make auto-advance flag a requirement for conditional/expression evaluation with design amendments approved. https://github.com/godotengine/godot/pull/65312

https://twitter.com/KenneyNL made a V-Sekai logo for us. https://twitter.com/KenneyNL/status/1567077172866596868?s=20&t=RIGyiux3A_KNX_HCLCVKvg

# 2022-09-09

https://github.com/Geequlim/ECMAScript/issues/131#issuecomment-1241570998 Javascript update.

https://github.com/fire/ewbik Collaborated with Eron and Lyuma. Worked on the design of EWBIK bone weights and bone priority. Worked on the different bone rolls vs silhouette problem in regular 3d formats versus VRM which has a indentity bone roll. (Use the original bone and then parent the change to be in ewbik bone roll.) Made the EWBIK solve less jello. Also discussion using kusudama constraints in Godot Engine core.
