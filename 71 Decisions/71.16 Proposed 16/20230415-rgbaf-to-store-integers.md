# Proposed: Use godot rgbaf textures to store integers

### Metadata

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

### Context and Problem Statement

Use godot rgbaf textures to store integer.

### Describe the proposed option and how it helps to overcome the problem or limitation

Godot Shader to extract the raw 16-bit integer in a FORMAT_RGBAH texture by Lyuma.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

```gdscript

shader_type spatial;
render_mode unshaded;
uniform usampler2D data_tex;

/*
Use with the following GDScript code:
	var data_img = Image.new()
	var data := PoolByteArray()
	var indexin = 0x8400
	data.append(indexin&0xff)
	data.append((indexin>>8)&0xff)
	data_img.create_from_data(1, 1, false, Image.FORMAT_RH, data)
	var data_tex = ImageTexture.new()
	data_tex.create_from_image(data_img, 0)
	self.get_surface_material(0).set_shader_param("data_tex", data_tex)
*/

// Extract the raw 16-bit integer assigned in a GL_RGBA16F or similar texture format
// (in Godot, Image.FORMAT_RGBAH or Image.FORMAT_RH)

// vectorized ?:
// In GLSL, you are supposed to do this using a mix(uvec4, uvec4, bvec4)
// However, in Godot, they forgot this overload existed, so we reimplement it.

uvec4 godot_hack_mix(uvec4 a, uvec4 b, bvec4 c) {
	return uvec4(c.x ? b.x : a.x, c.y ? b.y : a.y, c.z ? b.z : a.z, c.w ? b.w : a.w);
}

void fragment() {
	// Fetch half precision texture using usampler2D.
	// For some reason, it first converts to 32-bit float (but losslessly????)
	// and so we have to convert the 32-bit float back to 16-bits.
	uvec4 data = texelFetch(data_tex, ivec2(0,0), 0);

	// Calculate bit shifted exponent
	uvec4 exps = godot_hack_mix(
		// Adjust floating point from 8-bit in float32 (127 bias) to 5-bit in half (15 bias)
		uvec4((uvec4((ivec4((data & uvec4(0x7F800000)) >> uvec4(23)) - ivec4(127)) + ivec4(15)) & uvec4(0x1F)) << uvec4(10)),
		// Inf and NaN will remain Inf and Nan (maximum half exponent = 31)
		uvec4(ivec4(31 << 10)),
		// Check for maximum float32 exponent = 255
		equal((data) & uvec4(0x7F800000), uvec4(0x7F800000)));

	// calculate final data.
	data = godot_hack_mix(
		// mantissa | exponent | signbit
		((data & uvec4(0x007FFFFF)) >> uvec4(13)) | exps | (((data >> uvec4(31)) & uvec4(1)) << uvec4(15)),
		// Denormalized case: exponent is all over the place, so instead we add the smallest non-denormalized half, then extract the mantessa bits.
		// Finally, or the sign bit (and exponent = 0)
		(((floatBitsToUint(uintBitsToFloat(data & uvec4(0x7FFFFFFF)) + 1.0/16384.0) & uvec4(0x007FFFFF)) >> uvec4(13))) | (((data >> uvec4(31)) & uvec4(1)) << uvec4(15)),
		// Denormalized case can be detected with half exponent <= -15.
		lessThanEqual((data) & uvec4(0x7F800000), uvec4(0x38000000)));

	// Parse out individual bits if needed
	ivec2 datar = ivec2((uvec2(data.r) >> uvec2(0,8)) & uvec2(0xFF));
	ivec2 datag = ivec2((uvec2(data.g) >> uvec2(0,8)) & uvec2(0xFF));
	ivec2 datab = ivec2((uvec2(data.b) >> uvec2(0,8)) & uvec2(0xFF));
	ivec2 dataa = ivec2((uvec2(data.a) >> uvec2(0,8)) & uvec2(0xFF));

	// Example code: check for precise 16-bit value that matches GDScript.
	ALBEDO = vec3(0,0,0);
	if (data.r == uint(0xFFFF)) {
		ALBEDO = vec3(1,1,1);
	}
}
```

### Positive Consequences

We are able to use V-Sekai easier.

### Negative Consequences

We cannot get other features in.

### Option graveyard

Use 8 bit colors.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

This is a few lines of script.

### Is there a reason why this should be core and done by us?

Wanted to record this.

### References

- [V-Sekai](https://v-sekai.org/)
