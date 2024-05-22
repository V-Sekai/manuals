# Proposed: PDF to SVG Conversion for VR Books

## Metadata

- Status: Proposed
- Deciders: V-Sekai
- Tags: V-Sekai

## The Backdrop

The idea of converting PDFs to SVGs with raster image embeds for use in a VR book reader is an exciting project. However, dealing with PDF conversion can be challenging, especially when it comes to more complex tasks.

## The Challenge

The main challenge lies in the conversion process from PDF to SVG while maintaining the quality and integrity of the original content. This includes handling raster embeds and ensuring they are correctly displayed in the Godot engine.

## The Strategy

The proposed workflow involves taking a PDF page with potential raster embeds, running it through [svgcleaner](https://github.com/RazrFalcon/svgcleaner/releases/tag/v0.9.5), and then using it in the Godot engine. The goal is to create a CBZ where the images are SVGs.

## The Upside

This approach allows for the creation of high-quality, interactive VR books. It also leverages the capabilities of the Godot engine, which supports SVG, PNG, and JPG embeds.

## The Downside

The complexity of the conversion process may present some challenges. Additionally, the quality of the final product will heavily depend on the quality of the original PDF and its embedded raster images.

## The Road Not Taken

An alternative approach could involve converting the PDF to another format that might be easier to work with. However, this would likely result in a loss of quality and may not support the desired interactivity.

## The Infrequent Use Case

This workflow may not be suitable for all types of PDFs, particularly those with complex layouts or numerous embedded images.

## In Core and Done by Us?

The implementation of this workflow would require a deep understanding of both the PDF and SVG formats, as well as the Godot engine. It would likely be a significant undertaking.

## Further Reading

- [V-Sekai](https://github.com/v-sekai/)

This article was assisted by AI.
