# Proposed: Recovering MakeHuman Parameters Using Depth Map Comparison with Godot Engine

## The Context

In the realm of digital animation and character modeling, fitting an avatar to a specific image can enhance personalization and realism in various applications such as gaming and virtual reality.

## The Problem Statement

The challenge lies in accurately estimating the parameters of a MakeHuman model from a given anime-style image to ensure the avatar closely resembles the original character.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

### Proposal Overview

We propose a system that utilizes depth map comparisons between rendered images from the Godot Engine and depth maps generated from anime images using Apple's ML-Depth-Pro. This approach aims to optimize the MakeHuman parameters to recreate accurate 3D models of anime characters.

#### Key Objectives

- **Depth Map Generation**: Generate depth maps from both anime images and Godot-rendered characters.
- **Optimization**: Employ machine learning techniques to minimize the differences between these depth maps, facilitating accurate parameter recovery.
- **Cost Efficiency**: Leverage open-source tools to maintain budget-friendliness.

#### Scope

- **Input Data**: Anime images with manually labeled MakeHuman parameters for initial calibration.
- **Depth Comparison**: Analyze the discrepancies between the depth maps produced by Godot and those derived from anime images.
- **Optimization Process**: Utilize a search algorithm (e.g., genetic algorithm or bayesian optimization) to iteratively adjust and determine optimal MakeHuman parameters.

#### Work Breakdown

1. **Data Collection**:
   - **Task**: Manually label a small set of images with MakeHuman parameters.
   - **Outcome**: Create a baseline dataset for initial optimization efforts.

2. **Godot Integration**:
   - **Task**: Develop a script within Godot to render depth maps from configured MakeHuman models.
   - **Outcome**: Prepare depth maps for subsequent comparison.

3. **Optimization Algorithm**:
   - **Task**: Implement a cost-effective optimization algorithm using a suitable loss function (e.g., L2, Chamfer distance).
   - **Outcome**: Establish a mechanism to identify the best matching MakeHuman parameters.

4. **Testing and Refinement**:
   - **Task**: Systematically compare generated depth maps and refine the algorithm to improve accuracy.
   - **Timeline**:
     - **Data Collection**: 1 week
     - **Godot Integration**: 2 weeks
     - **Optimization Model**: 3 weeks
     - **Testing & Refinement**: 1 week
     - **Total Duration**: 7 weeks

## The Benefits

This streamlined, budget-conscious methodology promises significant enhancements in personalization and realism in digital character modeling, making it ideal for applications in gaming and virtual reality where character authenticity is crucial.

## The Downsides

- **Limited Creativity**: Strict adherence to replicating existing images may limit creative modifications.
- **Technical Complexity**: The integration of multiple advanced technologies (depth sensing, machine learning, and 3D rendering) requires high technical expertise.

## The Road Not Taken

Alternative methods such as direct 3D scanning of physical models or manual tweaking of parameters were considered but deemed less efficient and scalable compared to our proposed automated depth comparison method.

## The Infrequent Use Case

In cases where extremely high fidelity is required, such as in professional film production, additional manual adjustments by expert artists might still be necessary.

## In Core and Done by Us

This project aligns with our core mission of enhancing digital interaction experiences and will be developed and maintained by our team.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [DepthPro Demo with 3D Visualization](https://huggingface.co/spaces/A19grey/Depth-Pro-in-Meters)

AI assistant Aria assisted with this article.
