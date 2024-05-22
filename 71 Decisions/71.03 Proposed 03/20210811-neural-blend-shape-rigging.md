# Proposed: Neural Blend Shape Rigging

### Context and Problem Statement

Rigging characters takes too much effort and skill.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

Use Neural Blend Shapes to rig a base mesh.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

#### Requirements

1. t-pose base mesh
2. Similar to the smpl_std.

#### Get neural Blend shapes

Clone neural blend shapes

`git clone https://github.com/PeizhuoLi/neural-blend-shapes.git`

#### Blender

1. Open your base mesh
2. Open the smpl_std.obj into the Blender mesh
3. Enable the mesh align Blender addon
4. Select the rest of the meshes and then the smpl_std mesh
5. Align base_mesh.obj to the base mesh and then translate it so it stands on the floor
   ![image](attachments/125210550-4bfe8100-e255-11eb-9bc3-cbc7bfe4b98e.png)

#### Neural Blend Shapes

```bash
wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-pypy3-Linux-x86_64.sh
sh Mambaforge-pypy3-Linux-x86_64.sh
mamba create --name neural python=3.7
mamba activate neural
mamba install tensorboard tqdm PyTorch torchvision torchaudio -c PyTorch -y
python demo.py --pose_file=./eval_constant/sequences/house-dance.npy --obj_path=./eval_constant/meshes/ALPAPAAM.obj --normalize=1 --animated_bvh=1 --obj_output=0
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install org.blender.Blender
cd blender_scripts
flatpak run org.blender.Blender -b -P `pwd`/nbs_fbx_output.py -- --input `pwd`/../demo --output `pwd`/../demo/output.fbx
```

#### Use voxel diffuse skinning

1. The skeleton model above weighted the eye area. This is not good.
2. Use https://www.blendermarket.com/products/voxel-heat-diffuse-skinning
3. Take skeleton from output.fbx and reweight it onto the original mesh set

#### VRM

![image](attachments/125210653-0b533780-e256-11eb-8758-caeca92a16e2.png)

1. Set bone mappings
2. In the scripting set first person json to use bone "22" for the head
3. TODO Move the skeleton so it stands on the floor

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not workaround-able.

### Positive Consequences

_No response_

### Negative Consequences

No finger support yet.

### Is there a reason why this should be core and done by us?

Mixamo is a black box and V-Sekai would be more robust to have an alternative.

### References

- https://github.com/PeizhuoLi/neural-blend-shapes
- Skeleton https://github.com/Xananax/ALPAPATAM
- Mannequin https://github.com/V-Sekai/blue-tin-fox-models/actions

### Derivative License

Copyright (c) 2020-2021 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
