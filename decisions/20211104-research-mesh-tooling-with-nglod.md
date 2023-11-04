# Draft: Research mesh tooling with nglod

- Status: draft <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

## Context and Problem Statement

Need geometric tools for many things in the V-Sekai.

## Describe the proposed option and how it helps to overcome the problem or limitation

Use nglod for some of the 3d geometric tools.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. `git clone https://github.com/nv-tlabs/nglod.git`
1. Install https://github.com/conda-forge/miniforge#mambaforge
1. `conda create --name nglod python=3.9`
1. `conda activate nglod`
1. `conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch`
1. `pip install -r ./infra/requirements.txt`

```
python app/main.py --net OctreeSDF --num-lods 5 --dataset-path data/armadillo.obj --epoch 250 --exp-name armadillo
```

## Positive Consequences <!-- optional -->

- Maybe possible to encode as onnx
- Maybe usable cpu only.

## Negative Consequences <!-- optional -->

- Might require the GPU.
- Inferencing may be difficult at interactive rates.

## Option graveyard: <!-- same as above -->

- Option: <!-- [List the proposed options no longer open for consideration.] -->
- Rejection Reason: <!-- [List the reasons for the rejection: (the Bad traits)] -->

## If this enhancement will not be used often, can it be worked around with a few lines of script?

CUDA, PyTorch and c++ are significant works.

## Is there a reason why this should be core and done by us?

I have an approach!

## References <!-- optional -->

- https://kaolin.readthedocs.io/en/latest/notes/installation.html
- https://www.alecjacobson.com/weblog/?tag=qslim

## Derivative License

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
