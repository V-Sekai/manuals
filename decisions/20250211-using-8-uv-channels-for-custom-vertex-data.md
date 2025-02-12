# Proposed: Use 8 UV Channels for Custom Vertex Data in V-Sekai

## What is the context of the proposal?

The proposal addresses advanced use cases for transferring custom vertex data from Blender to Godot via 8 UV channels. This enables creative applications such as dynamic shader effects, modular armor systems, and procedural texture masking.

## What is the problem being solved?

Godot's default support for two UV channels limits complex shader workflows. Users need methods to encode additional data (e.g., hitbox IDs, visibility values) while ensuring compatibility between Blender's UV maps and Godot's CUSTOM0-3 attributes.

## Describe how your proposal will work

1. **Blender Setup**: Create UV maps (UV3-UV8) under _Mesh Properties > UV Maps_. Encode data into these channels (e.g., UV5.x for hitbox IDs).
2. **Export**: Use `.gltf` or `.blend` files, ensuring UVs are unwrapped on the Face Corner domain.
3. **Godot Shaders**:

   ```glsl
   // Access CUSTOM0 (UV3 + UV4)
   vec4 custom_data = CUSTOM0;
   float hitbox_id = custom_data.x;

   // Example: Procedural armor toggling
   if (CUSTOM1.z > 0.5) { // UV7 value stored in CUSTOM1.zw
       ALBEDO = armor_texture;
   }
   ```

4. **Data Handling**: Use `surface_get_arrays` to access `ARRAY_CUSTOM0-3` in scripts.

## What are the benefits of the proposal?

- Enables complex effects without mesh modifications (e.g., dynamic damage masking).
- Efficient data transfer via existing UV workflows.
- Supports up to 10 channels using half-precision packing.

## What are the downsides of the proposal?

- Vertex count mismatches if meshes are shaded flat in Blender.
- Requires careful UV management to avoid vertical flipping issues.
- Limited debugging tools for custom data validation.

## What are the alternative proposals?

- Using texture maps instead of UVs (increases memory usage).
- Relying on vertex colors (limited to 4 channels).

## When might the proposed solution be used rarely or not at all?

Unnecessary for simple assets without shader-driven interactivity or when targeting platforms with strict performance constraints.

## Is this a V-Sekai core responsibility?

Yes, as it enhances content creation pipelines for social VR experiences. V-Sekai should document best practices and provide shader templates.

## What is the status of the proposal?

Status: Proposed

## Who is making decisions on the proposal?

- V-Sekai development team
- fire
- lyuma
- funkbison

## What tags does the proposal have?

- V-Sekai
- Shaders
- Asset Pipeline

## List further reading references.

1. [Godot Mesh Documentation](https://docs.godotengine.org/en/stable/classes/class_mesh.html)
2. [Blender UV Map Workflow](https://blender.stackexchange.com/questions/51174/how-do-i-create-multiple-uv-maps)
3. [V-Sekai GitHub](https://github.com/v-sekai)

AI assistant Aria assisted in structuring this proposal based on community discussions.
