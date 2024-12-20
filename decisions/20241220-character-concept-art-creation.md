# Proposal: Character Concept Art Creation in V-Sekai with FLUX.1

## The Context

V-Sekai aims to provide a versatile platform for creating and experiencing virtual worlds. Character creation is a crucial aspect of this process, and concept art plays a vital role in visualizing and refining character designs before 3D modeling.

## The Problem Statement

Generating high-quality, 3D-ready concept art currently requires significant artistic skill and time investment. While AI models like FLUX.1 can streamline this process, ensuring compatibility with 3D modeling tools like TRELLIS requires careful consideration and optimization.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

This proposal outlines a workflow for generating FLUX.1 concept art optimized for TRELLIS, leveraging AI to accelerate character creation in V-Sekai.

### Optimized Prompting

We will utilize a predefined JSON payload as the foundation for generating character concepts:

```json
{
  "numOutputsTotal": 32,
  "seed": 908967689,
  "reqBody": {
    "prompt": "1girl, standing, full body, simple clothing, closed mouth, looking at viewer, white background, a-pose, short hair",
    "negative_prompt": "words, intricate hairstyle, elaborate braids, flowing hair, hair accessories, jewelry, intricate patterns, excessive details, flowing scarves, complex accessories, dynamic pose, foreshortening, extreme angles, obscured limbs",
    "active_tags": [],
    "inactive_tags": [],
    "width": 1024,
    "height": 1024,
    "seed": 908967689,
    "num_inference_steps": 25,
    "guidance_scale": 1,
    "distilled_guidance_scale": 3.5,
    "preserve_init_image_color_profile": true,
    "use_upscale": "ESRGAN_4x",
    "upscale_amount": "4",
    "latent_upscaler_steps": "10",
    "sampler_name": "forge_flux_realistic",
    "scheduler_name": "beta",
    "use_stable_diffusion_model": "flux1-schnell-fp8",
    "clip_skip": true,
    "tiling": "none",
    "use_vae_model": "ae",
    "use_controlnet_model": "",
    "control_filter_to_apply": "",
    "control_alpha": 1,
    "use_lora_model": ["CharacterDesign-FluxV2", "Flux DetailerV2"],
    "lora_alpha": ["0.5", "1"],
    "num_outputs": 4,
    "stream_image_progress": false,
    "show_only_filtered_image": true,
    "output_format": "png"
  }
}
```

This prompt prioritizes simplicity and clarity for optimal TRELLIS conversion, with negative prompts to exclude challenging elements. The `"use_upscale": "ESRGAN_4x"` parameter utilizes the Logoscale model to enhance the artwork with a vectorized style.

### Iterative Refinement

The process emphasizes iterative refinement of the prompt based on TRELLIS conversion results. This cyclical process ensures the generation of 3D-ready concept art.

### Workflow

1. **Define Core Concept:** Establish the character's essential characteristics.
2. **Craft Optimized Prompt:** Create a concise, TRELLIS-friendly prompt.
3. **Generate and Evaluate:** Produce images and assess their 3D conversion suitability.
4. **Iterate and Refine:** Adjust the prompt based on the evaluation.
5. **3D Conversion:** Utilize TRELLIS to generate 3D models.

## The Benefits

- **Efficient 3D Workflow:** Streamlines 3D model creation from AI-generated art.
- **Reduced Manual Intervention:** Minimizes 3D modeling cleanup.
- **Faster Iteration:** Accelerates character design exploration in 3D.
- **Standardized Output:** Maintains consistency in character presentation.
- **Accessibility:** Empowers users with varying artistic skills to contribute.
- **Vectorized Aesthetic:** Enhances the artwork with a clean, scalable style using Logoscale.

## The Downsides

- **FLUX.1 Style:** Inherits the distinctive style of the FLUX.1 model.
- **TRELLIS Limitations:** Complex elements may still require manual 3D refinement.

## The Road Not Taken

- **Manual creation of concept art:** Offers greater control but is time-consuming.
- **Using alternative AI models:** Other models may not be as compatible with TRELLIS.

## The Infrequent Use Case

For highly specific or complex concept art requirements, manual creation or a combination of AI generation and human artistry may be necessary.

## Why is it in Core and done by us?

This aligns with V-Sekai's core goal of democratizing virtual world creation by streamlining character creation and empowering a wider range of users.

## Status

Status: Draft

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai
- AI Art Generation
- Character Design
- FLUX.1
- TRELLIS
- 3D Modeling

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [flux.1 schnell - Civitai](https://civitai.com/models/618692?modelVersionId=699279) - Information and downloads for the flux.1 schnell AI model.
4. [TRELLIS - Hugging Face](https://huggingface.co/spaces/JeffreyXiang/TRELLIS) - A tool for generating 3D models from images.
5. [Character Design Sheet Helper - Civitai](https://civitai.com/models/100435/character-design-sheet-helper-3-perspectivescolor-palette-illustrious-xl-or-flux-or-xl-pony-or-sd-15-by-yeiyeiart) - A helpful tool for character design with FLUX.
6. [TOOL_logoscale - GitHub](https://github.com/V-Sekai-fire/TOOL_logoscale/tree/main?tab=readme-ov-file) - A FLOSS upscaling model for use with ESRGAN-compatible tools to achieve a vectorized aesthetic.
7. [Flux Detailer V2 - Civitai](https://civitai.com/models/685874/detailer-flux)

AI assistant Aria assisted with this article.
