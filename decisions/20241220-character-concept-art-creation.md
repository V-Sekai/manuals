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

- **Background Removal:** Use Krita's Magic Wand tool to select the main part of the image (the character). Then, inverse the selection and delete the rest, isolating the character from the generated image. This creates a transparent background, crucial for 3D model creation.

**Caution:** Do not feather the edges because it corrupts the background removal algorithm.

- **Face Erasure:** Use Krita's brush tools to carefully erase the eyebrows, nose, and mouth. You can use a combination of the Eraser tool and the Brush tool with a skin-tone color to blend seamlessly.

  **Reasoning for Face Erasure:**

  - **Focus on Form:** It helps emphasize the character's overall shape, silhouette, and clothing design without getting distracted by facial features.
  - **Flexibility for Later:** It allows for more freedom when creating the actual face in the 3D modeling stage, providing a blank canvas for the artist.
  - **Avoiding Uncanny Valley:** Sometimes AI-generated faces can fall into the "uncanny valley," appearing slightly off-putting. Erasing the face avoids this issue.

- **Refinement (Optional):** Utilize other tools in Krita, like the selection tools and eraser, for further refinement if needed.

### 4. Sprite Creation with Shoebox

Shoebox (<https://renderhjs.net/shoebox/>) is a free online tool for creating sprite sheets.

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

1. **Define Core Concept:** Establish the character's essential characteristics.
2. **Craft Optimized Prompt:** Create a concise, descriptive prompt using Easy Diffusion.
3. **Generate and Evaluate:** Produce images and assess their suitability.
4. **Remove Background:** Use Krita to remove the background.
5. **Erase Face:** Use the Grounded-SAM model to identify and remove facial features (eyebrows, nose, mouth) and paint the area skin color.
6. **Create Sprites:** Utilize Shoebox to generate sprites from the alpha'd image.
7. **(Optional) 3D Conversion:** Utilize TRELLIS to generate 3D models.
8. **Iterate and Refine:** Adjust the prompt based on the evaluation.

## Checklist for A-Pose Avatar Creation from Concept Art

**1. Image Generation and Preparation**

- [ ] **Install Easy Diffusion:** This will be your primary AI art generation tool.
- [ ] **Use Beta and 3.5 Engine:** Ensure you're using the latest version of Easy Diffusion with the most up-to-date Stable Diffusion engine.
- [ ] **Download FLUX Model and LoRAs:** Get the FLUX model and the CharacterDesign-FluxV2 LoRA for optimal character generation.
- [ ] **Configure Easy Diffusion:** Set up Easy Diffusion with the FLUX model, LoRAs, and 2048x1024 pixel resolution.
- [ ] **Generate A-Pose Image:** Use prompts in Easy Diffusion that specifically emphasize a clear A-pose with the palms facing forward or slightly angled outwards. Include details like:
  - "A-pose"
  - "palms facing forward" (or "slightly outwards")
  - "symmetrical pose"
  - "well-defined hands"
  - Any specific style or details from your concept art
- [ ] **Refine in Krita:**
  - Use the Magic Wand tool to remove the background.
  - Use the Grounded-SAM model to identify and remove facial features, then paint the area skin color.
  - Use brush tools to clean up any artifacts or unwanted details. Pay close attention to the hands and fingers.
- [ ] Use `pinokiofactory/clarity-refiners-ui` to get the description of the model.

**2. Sprite Creation and Rigging**

- [ ] **Upload to Shoebox:** Import the cleaned image into Shoebox.
- [ ] **Generate Sprites:** Use Shoebox to create sprites from your image.
- [ ] **Verify Finger Generation:** Ensure all 5 fingers are clearly generated and separated in the sprites.
- [ ] **Confirm A-Pose:** Double-check that the avatar maintains a perfect A-pose throughout the sprite generation process.

**3. Advanced Setup (Optional)**

- [ ] **Install Docker Desktop, WSL2, and Configure:** If you need more advanced features or prefer a Linux environment, consider setting up Docker Desktop with WSL2.
- [ ] **Execute TRELLIS in WSL2:** TRELLIS can potentially offer more advanced rigging options if needed.

**Important Notes for Palm and A-Pose:**

- **Prompt Engineering:** Carefully craft your prompts in Easy Diffusion to get the desired A-pose and hand orientation. Experiment with different keywords and phrases.
- **Iteration:** You might need to generate multiple images and refine them in Krita until you achieve a perfect A-pose with well-defined palms and fingers.
- **Shoebox Settings:** Explore Shoebox's settings to fine-tune sprite generation and ensure it preserves the A-pose and hand details.
- **Alternative Tools:** If Shoebox doesn't meet your needs, consider other sprite generation or 3D modeling tools that might offer more control over rigging and posing.

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

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)
3. [flux.1 schnell - Civitai](https://civitai.com/models/618692?modelVersionId=699279)
4. [TRELLIS - Hugging Face](https://huggingface.co/spaces/JeffreyXiang/TRELLIS)
5. [Character Design Sheet Helper - Civitai](https://civitai.com/models/100435)
6. [TOOL_logoscale - GitHub](https://github.com/V-Sekai-fire/TOOL_logoscale/tree/main?tab=readme-ov-file)
7. [Easy Diffusion](https://easydiffusion.github.io/)
8. [Windows Subsystem for Linux Documentation](https://docs.microsoft.com/en-us/windows/wsl/)
9. [Shoebox](https://renderhjs.net/shoebox/)
10. [Creative Image Enhancer/Upscaler](https://github.com/pinokiofactory/clarity-refiners-ui)
11. [Project-Babble/ProjectBabble](https://github.com/Project-Babble/ProjectBabble)
12. [schananas/grounded_sam](https://replicate.com/schananas/grounded_sam)
