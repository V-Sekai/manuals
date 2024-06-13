# Proposed: Dataset Size for Training Mesh Transformer

## The Context

We are working on training a mesh transformer to create 3D avatar characters. The avatars are represented using quads, and we aim to keep the quad count to 1024 or less.

## The Problem Statement

The question at hand is determining the size of the dataset needed for training the model effectively.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

The size of the dataset required for training a model effectively depends on the desired type of outputs from the model. 

- **Generic Outputs**: If the goal is to have the model generate outputs that it has already seen during training, a smaller dataset is sufficient. In this case, a dataset size in the range of 2,000 to 10,000 would be appropriate.

- **Novel Outputs**: On the other hand, if the aim is for the model to generate novel or never-seen-before outputs, a larger dataset is necessary. Here, a dataset size between 10,000 and 100,000 would be more suitable.

## The Benefits

- A smaller dataset is easier to manage and requires less computational resources for training.
- A larger dataset allows the model to generate novel outputs, enhancing its creativity and versatility.

## The Downsides

- A smaller dataset might limit the model's ability to generate novel outputs.
- A larger dataset requires more computational resources for training and may lead to longer training times.

## The Road Not Taken

- We could have chosen to use a fixed dataset size without considering the type of outputs we want from the model.

## The Infrequent Use Case

- This approach may not be suitable if we want the model to generate both generic and novel outputs equally well.

## In Core and Done by Us

- The decision on the dataset size and the training of the mesh transformer will be done by us, using our acquired resources and expertise.

## Status

Status: Proposed 

## Decision Makers

- V-Sekai development team
- iFire 

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.