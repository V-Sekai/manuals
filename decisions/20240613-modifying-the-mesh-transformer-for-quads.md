# Proposed: Modify the Mesh Transformer for Quads

## The Context

We're working on a project that involves using an autoencoder/transformer for 3D models. The current setup does not have a setting for quads, which is a requirement for our project.

## The Problem Statement

The challenge is to modify the autoencoder/transformer to include a setting for quads and achieve a loss around 0.35.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

1. **Modify the Autoencoder/Transformer**: Update the existing code to include a `quads=True` parameter in the autoencoder/transformer.

2. **Test the Modification**: Run tests to ensure that the modification works as expected and doesn't break existing functionality.

3. **Optimize the Loss**: Adjust the parameters and settings of the autoencoder/transformer to aim for a loss around 0.35 when processing quads.

## The Benefits

- This modification will allow us to process quads in our 3D models.
- Achieving a loss around 0.35 will improve the quality of our model transformations.

## The Downsides

- Modifying the existing code could introduce new bugs or issues.
- It might be challenging to achieve the desired loss.

## The Road Not Taken

An alternative approach could be to convert quads into triangles before processing them with the autoencoder/transformer. However, this might result in loss of information or quality.

## The Infrequent Use Case

This modification might not be necessary if we are dealing with 3D models that do not contain quads.

## In Core and Done by Us

The V-Sekai development team will handle the modification of the autoencoder/transformer and the optimization of the loss.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - The GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this proposal.
