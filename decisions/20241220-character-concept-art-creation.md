# Draft: Character Concept Art Creation

## The Context

V-Sekai aims to provide a versatile platform for creating and experiencing virtual worlds. Character creation is a crucial aspect of this process, and concept art plays a vital role in visualizing and refining character designs before 3D modeling. This proposal focuses on integrating Easy Diffusion, Windows 11 tools, and Shoebox to streamline this workflow.

## The Problem Statement

Generating high-quality, 3D-ready concept art often requires significant artistic skill and time. While AI art generators like Stable Diffusion, particularly with the FLUX model, can expedite this process, setting it up and ensuring the generated art is compatible with 3D modeling tools requires technical expertise and careful optimization. This proposal aims to simplify this process further by incorporating readily available Windows tools.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

This proposal outlines a workflow using Easy Diffusion for generating concept art, Windows 11 tools for image editing, and Shoebox for sprite creation, ultimately optimizing the process for 3D character creation in V-Sekai.

### 1. Easy Diffusion Setup

Easy Diffusion provides a user-friendly interface for Stable Diffusion. We will use it with the FLUX model for generating character concepts.

- Install Easy Diffusion.
- Use Beta
- Use 3.5 engine
- Download the FLUX model and necessary LoRAs (CharacterDesign-FluxV2).
- Configure Easy Diffusion with the FLUX model and LoRAs.
- On settings reload remember to force the random seed option.

[concept_prompt.json](attachments/FLUX_Girl_Fantasy_01.json)

### 2. Optimized Prompting in Easy Diffusion

**Settings:**

- Set the width and height to 1024 pixels.

### 3. Image Editing with Krita

- **Background Removal:** Use Krita's Magic Wand tool with a feather of 5px to select the main part of the image (the character). Then, inverse the selection and delete the rest, isolating the character from the generated image. This creates a transparent background, crucial for 3d model creation.
- **Face Erasure:** Use Krita's brush tools to carefully erase the eyebrows, nose, and mouth. You can use a combination of the Eraser tool and the Brush tool with a skin-tone color to blend seamlessly.

  **Reasoning for Face Erasure:**

  - **Focus on Form:** It helps emphasize the character's overall shape, silhouette, and clothing design without getting distracted by facial features.
  - **Flexibility for Later:** It allows for more freedom when creating the actual face in the 3D modeling stage, providing a blank canvas for the artist.
  - **Avoiding Uncanny Valley:** Sometimes AI-generated faces can fall into the "uncanny valley," appearing slightly off-putting. Erasing the face avoids this issue.

- **Refinement (Optional):** Utilize other tools in Krita, like the selection tools and eraser, for further refinement if needed.

### 4. Sprite Creation with Shoebox

Shoebox (https://renderhjs.net/shoebox/) is a free online tool for creating sprite sheets.

- Upload the alpha'd image from Krita to Shoebox.
- Utilize Shoebox's features to cut the image into individual sprites.
- Keep only the sprites that are in different views but in the same consistent 3D shape.

### 5. TRELLIS Setup and Execution (Optional)

TRELLIS can be used for generating 3D models from the concept art or sprites.

- Install Docker Desktop.
- Install WSL2 with a compatible Linux distribution (e.g., Ubuntu).
- Configure Docker Desktop to utilize the WSL2 backend.
- Ensure GPU access is enabled within WSL2.
- Execute TRELLIS within WSL2 using the following command in Powershell:

```powershell
docker run -it -p 7860:7860 --gpus all registry.hf.space/jeffreyxiang-trellis:latest python app.py
```

### 6. Iterative Refinement

The process emphasizes iterative refinement of the prompt based on results from Shoebox or TRELLIS. This cyclical process ensures the generation of optimized concept art and sprites.

### Workflow

1.  **Define Core Concept:** Establish the character's essential characteristics.
2.  **Craft Optimized Prompt:** Create a concise, descriptive prompt using Easy Diffusion.
3.  **Generate and Evaluate:** Produce images and assess their suitability.
4.  **Remove Background:** Use Krita to remove the background.
5.  **Erase Face:** Use Krita to erase the facial features (eyebrows, nose, mouth).
6.  **Create Sprites:** Utilize Shoebox to generate sprites from the alpha'd image.
7.  **(Optional) 3D Conversion:** Utilize TRELLIS to generate 3D models.
8.  **Iterate and Refine:** Adjust the prompt based on the evaluation.

## The Benefits

- **Simplified Workflow:** Streamlines concept art and sprite creation using accessible tools.
- **Reduced Manual Effort:** Minimizes image editing and sprite creation time.
- **Faster Iteration:** Accelerates character design exploration.
- **Standardized Output:** Maintains consistency in character presentation.
- **Accessibility:** Empowers users with varying artistic skills to contribute.
- **Cost-effective:** Leverages free tools readily available on Windows 11.

## The Downsides

- **FLUX.1 Style:** Inherits the distinctive style of the FLUX.1 model.
- **Shoebox Limitations:** May require manual adjustments for complex sprites.
- **TRELLIS Limitations (Optional):** Complex elements may still require manual 3D refinement.
- **WSL2 Setup (Optional):** Requires users to install and configure WSL2 for TRELLIS.

## The Road Not Taken

- **Manual creation of concept art:** Offers greater control but is time-consuming.
- **Using alternative AI models:** Other models may not be as compatible with TRELLIS or as user-friendly.
- **Dedicated Sprite Editors:** Can be more powerful but less accessible than Shoebox.

## The Infrequent Use Case

For highly specific or complex concept art and sprites, manual creation or a combination of AI generation and human artistry may be necessary. Users without dedicated GPUs might experience limitations with TRELLIS.

## Why is it in Core and done by us?

This aligns with V-Sekai's goal of democratizing virtual world creation by streamlining character creation and empowering users with accessible tools.

## Status

Status: Draft

## Decision Makers

- V-Sekai development team
- fire

## Tags

- V-Sekai
- AI Art Generation
- Character Design
- FLUX.1
- TRELLIS
- Easy Diffusion
- 3D Modeling
- Windows 11
- Shoebox
- Sprite Creation

## Further Reading

1.  [V-Sekai · GitHub](https://github.com/v-sekai)
2.  [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)
3.  [flux.1 schnell - Civitai](https://civitai.com/models/618692?modelVersionId=699279)
4.  [TRELLIS - Hugging Face](https://huggingface.co/spaces/JeffreyXiang/TRELLIS)
5.  [Character Design Sheet Helper - Civitai](https://civitai.com/models/100435)
6.  [TOOL_logoscale - GitHub](https://github.com/V-Sekai-fire/TOOL_logoscale/tree/main?tab=readme-ov-file)
7.  [Easy Diffusion](https://easydiffusion.github.io/)
8.  [Windows Subsystem for Linux Documentation](https://docs.microsoft.com/en-us/windows/wsl/)
9.  [Shoebox](https://renderhjs.net/shoebox/)
10. [Creative Image Enhancer/Upscaler](https://github.com/pinokiofactory/clarity-refiners-ui)
11. [Project-Babble/ProjectBabble](https://github.com/Project-Babble/ProjectBabble)
