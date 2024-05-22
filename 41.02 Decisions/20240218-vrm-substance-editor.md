# Proposed VRM mtoon in Substance Designer

## The Context

VRM is a file format for handling 3D humanoid avatars in VR applications. It's designed to be a versatile and exchangeable format across various systems. mtoon is a toon shader used with VRM models to give them a distinct, stylized look that emulates 2D animation within a 3D space.

Substance Designer is a powerful node-based texturing tool essential for creating realistic textures for 3D models. By implementing mtoon support in Substance Designer, we can bridge the gap between high-quality texture design and VRM character customization.

## The Problem Statement

The current workflow for applying toon shading to VRM models is disconnected from the process of designing textures, often requiring multiple tools and manual adjustments. We aim to simplify the workflow by integrating mtoon support directly into Substance Designer, allowing for a more cohesive and efficient design process.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

The implementation would involve developing a custom Substance Designer node set or a template that encapsulates mtoon's parameters and replicates its shading model within the Substance Designer environment. This would allow artists to preview and tweak the toon shader settings in real-time while crafting the textures.

A mock-up interface would present these parameters within Substance Designer, where each one directly corresponds to a property in the VRM mtoon shader.

## The Benefits

- Streamlined Workflow: Artists can create and adjust VRM textures and toon shaders all within Substance Designer.
- Real-time Previews: Immediate feedback on how changes to textures and shader parameters impact the final appearance.
- Consistency: Reduces discrepancies between the design phase and the final rendering in VR applications.

## The Downsides

- Development Time: Significant time investment required to develop and maintain the custom node set/template.
- Complexity: Adds an additional layer of complexity within Substance Designer, which could be overwhelming for new users.
- Niche Audience: The feature might only cater to a relatively small audience of VRM content creators.

## The Road Not Taken

We could have chosen to maintain the status quo, requiring VRM creators to switch between multiple tools to finalize their avatar's appearance. However, this would prolong the existing inefficiencies in the production pipeline.

## The Infrequent Use Case

While most VRM mtoon use cases involve common elements like lit colors and normal maps, less frequent use cases could involve highly custom properties such as UV animations or unique rim lighting effects.

## In Core and Done by Us

The development of this feature would be in-house, ensuring deep integration with existing Substance Designer systems and full control over the implementation and updates.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team and community stakeholders.

## Tags

- V-Sekai, Avatar Customization, AI, Facial Expressions

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.

Below is a table of parameters for the proposed VRM mtoon Substance Designer node set/template:

| Rank | Parameter                   | Type    | Description                                                                                                                                      | Impact Level     | Range           |
| ---- | --------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------- | --------------- |
| 1    | `_Color`                    | vec4    | Lit Color, Alpha (Lit RGB, Alpha A)                                                                                                              | High             | [0, 1]          |
| 2    | `_MainTex`                  | texture | Main Texture (RGB)                                                                                                                               | High             | [0, 1]          |
| 3    | `_ShadeColor`               | vec4    | Shade Color (Shade RGB)                                                                                                                          | High             | [0, 1]          |
| 4    | `_ShadeTexture`             | texture | Shade Texture (RGB)                                                                                                                              | High             | [0, 1]          |
| 5    | `_ShadeToony`               | float   | Shading Toony (0.0 is Lambert. Higher value get toony shading.)                                                                                  | High             | [0.0, 1.0]      |
| 6    | `_RimColor`                 | vec4    | Rim Color (RGB)                                                                                                                                  | High             | [0, 1]          |
| 7    | `_RimTexture`               | texture | Rim Texture (RGB)                                                                                                                                | High             | [0, 1]          |
| 8    | `_EmissionColor`            | vec4    | Emission Color (RGB)                                                                                                                             | High             | [0, 1]          |
| 9    | `_EmissionMap`              | texture | Emission Map (RGB)                                                                                                                               | High             | [0, 1]          |
| 10   | `_Cutoff`                   | float   | Alpha Cutoff (Discard pixels below this value in Cutout mode)                                                                                    | High             | [0.0, 1.0]      |
| 11   | `_AlphaCutoutEnable`        | int     | Rendering Type (TransparentWithZWrite mode can cause problems with rendering.)                                                                   | High             | {0, 1}          |
| 12   | `_MainTex_ST`               | vec4    | UV Offset (UV Scale X,Y, UV Offset X,Y)                                                                                                          | High             | [0, 1]          |
| 13   | `_BumpScale`                | vec2    | Normal Map and Multiplier for normals in tangent space                                                                                           | High             | [0.0, 1.0]      |
| 14   | `_BumpMap`                  | texture | Normal Map (RGB)                                                                                                                                 | High             | [0, 1]          |
| 15   | `_OutlineWidth`             | float   | Width (Outline Width)                                                                                                                            | High             | [0.01, ∞)       |
| 16   | `_OutlineWidthTexture`      | texture | Outline Width Texture (R)                                                                                                                        | High             | [0, 1]          |
| 17   | `_OutlineColor`             | vec4    | Outline Color (RGB)                                                                                                                              | High             | [0, 1]          |
| 18   | `_SphereAdd`                | texture | MatCap Texture (RGB)                                                                                                                             | Subtle           | [0, 1]          |
| 19   | `_ShadeShift`               | float   | Shading Shift (Zero is Default. Negative value increase lit area. Positive value increase shade area.)                                           | Moderate         | [-1.0, ∞)       |
| 20   | `_ReceiveShadowRate`        | float   | Shadow Receive (Texture R \* Rate. White is Default. Black attenuates shadows.)                                                                  | Moderate         | [0.0, 1.0]      |
| 21   | `_ReceiveShadowTexture`     | texture | Receive Shadow Texture (R)                                                                                                                       | Moderate         | [0, 1]          |
| 22   | `_ShadingGradeRate`         | float   | Shading Grade (Lit & Shade Mixing Multiplier: Texture R \* Rate. Compatible with UTS2 ShadingGradeMap. White is Default. Black amplifies shade.) | Moderate         | [0.0, 1.0]      |
| 23   | `_ShadingGradeTexture`      | texture | Shading Grade Texture (R)                                                                                                                        | Moderate         | [0, 1]          |
| 24   | `_LightColorAttenuation`    | float   | Light Color Attenuation                                                                                                                          | Moderate         | [0.0, ∞)        |
| 25   | `_IndirectLightIntensity`   | float   | GI Intensity (Indirect Light Intensity)                                                                                                          | Moderate         | [0.0, ∞)        |
| 26   | `_MatcapColor`              | vec4    | MatCap Color (Color multiplied with Additive Sphere map / MatCap Texture RGB)                                                                    | Subtle           | [0, 1]          |
| 27   | `_RimLightingMix`           | float   | Rim Lighting Mix                                                                                                                                 | Subtle           | [0.0, 1.0]      |
| 28   | `_RimFresnelPower`          | float   | Fresnel Power (If you increase this value, you get sharper rim light.)                                                                           | Subtle           | [0.0, 100.0]    |
| 29   | `_RimLift`                  | float   | Rim Lift (If you increase this value, you can lift rim light.)                                                                                   | Subtle           | [0.0, ∞)        |
| 30   | `_OutlineWidthMode`         | int     | Mode (None = outline pass disabled; World = outline in world coordinates; Screen = screen pixel thickness)                                       | Outline-Specific | {0, 1, 2}       |
| 31   | `_OutlineScaledMaxDistance` | float   | Outline Scaled Distance (Width Scaled Max Distance)                                                                                              | Outline-Specific | [1.0, 10.0]     |
| 32   | `_OutlineColorMode`         | int     | Color Mode (FixedColor = unshaded; MixedLighting = match environment light (recommended))                                                        | Outline-Specific | {0, 1}          |
| 33   | `_OutlineLightingMix`       | float   | Outline Mix (Outline Lighting Mix)                                                                                                               | Outline-Specific | [0.0, 1.0]      |
| 34   | `_UvAnimMaskTexture`        | texture | Auto Animation Mask Texture (R)                                                                                                                  | UV Animation     | [0, 1]          |
| 35   | `_UvAnimScrollX`            | float   | UV Scroll X (per second)                                                                                                                         | UV Animation     | [-100.0, 100.0] |
| 36   | `_UvAnimScrollY`            | float   | UV Scroll Y (per second)                                                                                                                         | UV Animation     | [-100.0, 100.0] |
| 37   | `_UvAnimRotation`           | float   | UV Rotation (per second)                                                                                                                         | UV Animation     | [-100.0, 100.0] |
| 38   | `_DebugMode`                | int     | Visualize (Debugging Visualization: Normal or Lighting)                                                                                          | Debugging        | {0, 1, 2}       |
