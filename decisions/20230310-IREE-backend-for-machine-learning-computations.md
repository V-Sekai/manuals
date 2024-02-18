# Superseded: Creating a Godot Engine C++ module with IREE backend for machine learning computations using Vulkan and CUDA

### Metadata

- Status: superseded by 20230502-add-iree-to-godot-engine-for-image-superresolution <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai, IREE, Godot Engine, Image Superresolution, Vulkan Backend,chatgpt 4,Google,

### Context and Problem Statement

I want to have a starting place for testing ai algorithms.

### Describe the proposed option and how it helps to overcome the problem or limitation

Create a Godot Engine C++ module with a machine learning computation backend.

Find a interesting test case.

Want to run the machine learning technology on the player's computer, the cpu-only server that hosts the game, and the gpu cloud.

To summarize, if you're looking for a sample that demonstrates loading a model at runtime for CPU, Vulkan, and CUDA in C++, you can check out the IREE samples. In particular, the dynamic_shapes and simple_embedding samples showcase how to run on your choice of target. The input program may have a signature in the stablehlo dialect, and you can use IREE or XLA depending on your preferred tech stack or runtime requirements. The Vulkan stack in IREE is relatively stable and offers good performance, with nod.ai's SHARK offering extra tuning and APIs on top. However, there may be differences in optimization depending on the workload and potential driver bugs and pitfalls.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Provide IREE to godot engine.

Uses the Vulkan back end.

1. input_count
2. input/0/data (TypedArray)
3. output_count
4. output/0/data (TypedArray)

### Positive Consequences

Have a playground for testing.

### Negative Consequences

_No response_

### Option graveyard

Don't use onnx because it doesn't have vulkan support which limits reach.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a small number of gdscript lines.

### Is there a reason why this should be core and done by us?

I know how, and no one else is doing it.

### References

- [V-Sekai](https://v-sekai.org/)
- [SHARK](https://github.com/nod-ai/SHARK)
- IREE in-tree samples: https://github.com/openxla/iree/tree/main/samples
- IREE extra/more complex samples: https://github.com/iree-org/iree-samples
- IREE dynamic shapes sample: https://github.com/openxla/iree/tree/main/samples/dynamic_shapes
- IREE CPU/Vulkan/CUDA sample: https://github.com/openxla/iree/tree/main/samples/simple_embedding
- XLA axpy example: https://github.com/openxla/xla/tree/main/xla/examples/axpy
- nod.ai SHARK: https://github.com/nod-ai/SHARK
- nod.ai SHARK results on AMD GPUs using Vulkan: https://nod.ai/sd-rdna3-ces2023/
