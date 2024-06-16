# Proposed: Triangle to Quad Mesh Dataset Creation

## The Context

Mesh Transformers, which consist of a construction worker (auto encoder) and an architect (transformer), aim to simplify the process of generating 3D models. Users can generate a 3D model using a prompt, eliminating the need to search through numerous 3D libraries.

## The Problem Statement

The task at hand is to create a triangle mesh to quad mesh dataset that's suitable for machine learning training. The meshes should be converted from triangles to quads, have captions, contain a maximum of 1k quads, and include at least 100 objects, should be 100_000 objects.

Note that triangulating a quad mesh is not the same task.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

We propose using remeshing tools convert triangle meshes to quad meshes.

The first dataset will focus on items an avatar would wear. This includes clothing, accessories, and other wearable items.

### Annotations on 8 views

- caption
- type annotation
- material annotation

## The Benefits

This proposal simplifies the process of creating 3D models. It allows users to quickly receive a 3D model that fits their needs.

## The Downsides

The proposal may require significant computational resources. Additionally, there may be some loss of detail during the conversion process.

## The Road Not Taken

An alternative approach would involve manually converting each quad mesh to a triangle mesh and adding captions. However, this method would be time-consuming and not feasible for large datasets.

## The Infrequent Use Case

The proposal may not benefit users who only need a small number of 3D models or those with very specific requirements.

## In Core and Done by Us

The V-Sekai development team will be responsible for creating and converting the meshes.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai
- Fire

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - The GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [objaverse_annotations](https://github.com/google-deepmind/objaverse_annotations)
4. [V-Sekai.blue-tin-fox-models](https://github.com/V-Sekai/V-Sekai.blue-tin-fox-models)
5. [https://github.com/maria-korosteleva/garment-pattern-generator]
6. [https://cmp.felk.cvut.cz/t-less/index.html]

AI assistant Aria assisted with this article.
