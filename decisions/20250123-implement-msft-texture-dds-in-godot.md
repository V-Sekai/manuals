# Proposed: Implement MSFT Texture dds in Godot Engine

## What is the context of the proposal?

Implementation of a Godot Engine image to dds gltf extension for export.

## What is the problem being solved?

Allowing the Godot Engine HTTP service to export a gltf2 binary that VRChat can load at runtime with meshes and images.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams.

The proposal involves integrating the MSFT_texture_dds extension into the Godot Engine's export pipeline. This will require modifying the export scripts to include DDS support, handling the conversion of image assets to DDS format, and ensuring compatibility with the glTF2 binary structure. Pseudo-code example:

```python
def export_gltf_with_dds(mesh, textures):
    try:
        converted_textures = [convert_to_dds(tex) for tex in textures]
    except ConversionError:
        converted_textures = [convert_to_png(tex) for tex in textures]
    gltf = create_gltf(mesh, converted_textures)
    save_binary_gltf(gltf, "exported_model.glb")
```

## What are the benefits of the proposal?

- Enhanced compatibility with VRChat, allowing for richer textures and better performance.
- Utilizes industry-standard DDS format for textures, ensuring high-quality image exports.
- Streamlines the export process for developers working with VRChat and Godot Engine.
- Provides a fallback to PNG format, ensuring compatibility in environments where DDS is not supported.

## What are the downsides of the proposal?

- Increased complexity in the export pipeline may lead to longer export times.
- Additional maintenance required to keep the DDS integration updated with both Godot Engine and VRChat changes.
- Potential compatibility issues with existing projects not utilizing the DDS format.

## What are the alternative proposals?

- Continue using the existing texture formats supported by Godot Engine without adding DDS support.
- Implement a different texture compression format that may offer better performance or compatibility.
- Outsource the texture conversion process to an external tool rather than integrating it directly into the engine.

## When might the proposed solution be used rarely or not at all?

The solution may be rarely used in projects that do not target VRChat or do not require DDS texture support. Additionally, projects prioritizing other texture formats or those with simple texture needs may not benefit significantly from this integration.

## Is this a V-Sekai core responsibility, and should it be done by us?

Yes, implementing support for MSFT_texture_dds aligns with V-Sekai's core responsibilities to enhance the Godot Engine for social VR functionalities. Providing seamless integration with platforms like VRChat is within our scope to support the development community.

## What is the status of the proposal?

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Who is making decisions on the proposal?

- V-Sekai development team

## What tags does the proposal have?

- V-Sekai

## List further reading references.

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [MSFT_texture_dds](https://github.com/KhronosGroup/glTF/blob/main/extensions/2.0/Vendor/MSFT_texture_dds/README.md)
