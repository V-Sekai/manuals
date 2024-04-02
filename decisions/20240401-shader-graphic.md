# Proposed: Material Shader Graphic Shirt with Sharp Edges

## The Context

In the vibrant and ever-evolving realm of virtual reality, personal expression is paramount. Users crave the ability to showcase their unique style and personality through their avatars. One powerful avenue for this self-expression is through avatar apparel customization. In this scenario, we're exploring the creation of a virtual shirt adorned with two distinct patterns. These patterns are applied using SVG files that are converted into a signed distance field mask, ensuring the edges remain crisp and sharp.

## The Problem Statement

At present, there's no straightforward method to design a shirt featuring two different patterns using SVG files in MaterialX, while also maintaining sharp pattern edges. This proposal seeks to address and resolve this issue.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

We can harness the power of MaterialX's shader graph system to craft a custom shader for our shirt. Here's a rudimentary sketch of how it might be structured:

```python
# Import MaterialX library
import MaterialX as mx

# Create a new document
doc = mx.createDocument()

# Create a new shader graph
shaderGraph = doc.addNode('shadergraph', 'myShaderGraph', 'surfaceshader')

# Add two image nodes for our SVG patterns
pattern1 = shaderGraph.addInput('pattern1', 'filename')
pattern2 = shaderGraph.addInput('pattern2', 'filename')

# Convert SVGs to signed distance fields for sharp edges
sdfPattern1 = convertSVGToSDF(pattern1)
sdfPattern2 = convertSVGToSDF(pattern2)

# Add a mix node to blend the two patterns together
mix = shaderGraph.addNode('mix', 'mix', 'color3')
mix.setInputValue('fg', sdfPattern1)
mix.setInputValue('bg', sdfPattern2)

# Connect the mix node to the shader graph output
shaderGraph.setOutputValue(mix)
```

Please note, this is a simplified example and may require adjustments based on your project's specific needs.

## The Benefits

Implementing this feature will empower users with additional options for avatar customization. This could potentially boost user engagement and satisfaction. Moreover, by utilizing signed distance fields, we can guarantee sharp pattern edges, enhancing the visual appeal of the shirt.

## The Downsides

The primary drawback is that this feature could potentially amplify the complexity of the codebase. It may also necessitate additional resources for implementation and ongoing maintenance.

## The Road Not Taken

An alternative approach might involve using a different library or tool that already supports this feature. However, this could potentially introduce other challenges such as compatibility issues or increased project complexity.

## The Infrequent Use Case

This feature might not see frequent use if the majority of users favor simpler designs for their avatars' clothing. Nonetheless, it could still prove beneficial for those desiring more advanced customization options.

## In Core and Done by Us

This feature will be developed by the V-Sekai development team and will form an integral part of our project's core functionality.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine

AI assistant Aria assisted with this article.
