# Proposed: Reduce Size Difference Between Capsules and Mesh Volume

## The Context

Accurately fit capsules around bones in skinned skeleton meshes. The example provided involves a rectangle skinned by two bones, with each vertex influenced by up to 8 weights.

## The Problem Statement

The goal is to minimize the size discrepancies between the capsules surrounding the bones and the actual volume defined by the skin mesh. This will be approached using the Minimum Deviation Flow problem in bidirected graphs (Bi-MDF).

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

### Step 1: Representation of the Skeleton and Skin Mesh

- **Skeleton**: Represent each bone as a node in a graph.
- **Skin Mesh**: Each vertex of the mesh is also a node. Connect a bone to a vertex with an edge if the vertex is influenced by that bone, based on skin weights.

### Step 2: Define the Objective

- The objective is to minimize the size differences between the capsules (nodes) and the volume of the skin mesh. This is quantified using a cost function that measures the deviation from ideal capsule sizes.

### Implementation

I have no idea.

## The Benefits

- **Accuracy**: Improves the fit of capsules to the actual mesh, enhancing animation quality.
- **Efficiency**: Reduces computational overhead by focusing on significant discrepancies.

## The Downsides

- **Complexity**: Implementing and tuning the Bi-MDF algorithm can be complex.
- **Dependency**: Relies heavily on accurate weight assignments and initial conditions.

## The Road Not Taken

- Alternative methods such as direct geometric fitting or machine learning approaches were considered but not pursued due to their complexity and computational requirements.

## The Infrequent Use Case

- Handling cases where bones have minimal influence on any vertices, which might lead to underutilized algorithms and resources.

## In Core and Done by Us

- The development and integration of this feature are handled internally by the V-Sekai development team, ensuring it aligns with the core functionalities of the Godot Engine used for VR.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [cgg-bern/libSatsuma](https://github.com/cgg-bern/libSatsuma) Exact and approximate solvers for minimum-cost-flow problems in bi-directed graphs.

AI assistant Aria assisted with this article.
