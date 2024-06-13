# Proposed: Training Mesh Transformer for 3D Avatar Creation

## The Context

We are working with mesh transformer large language models.

## The Problem Statement

The goal is to train the mesh transformer to create 3D avatar characters. The challenge lies in managing the complexity of the model and the computational resources required for training.

## Proposal

Our approach involves using quad support for the avatars, which allows us to cut the avatar into smaller objects as part of the body. This method is more manageable and efficient than trying to train the model on larger body parts or the entire avatar.

However, it's important to note that we cannot use triangles and quads at the same time. Also, having a context length of 32k or more will require a bigger model, which might not be feasible unless we have a substantial GPU budget for computation.

For our training data, we aim to keep the triangle count below 5k triangles. We also need to consider the shape of the training data and the type of quad data we need to provide.

In terms of numbers, we're looking at around 1500 triangles, which would result in 6k to 9k tokens. If these triangles are converted to quads and there is a reduction, we could aim for around MAX 8k tokens. In this case, 1 triangle equals 6 tokens, and 1 quad equals 8 tokens.

This means that 8,000 tokens would equate to 1,000 quads.

## The Benefits

- Training the mesh transformer on smaller body parts will make it more manageable and efficient.
- Using quads instead of triangles could potentially reduce the complexity of the model.

## The Downsides

- The process requires a significant amount of GPU compute power, which could be expensive.
- The model might not be able to handle large context lengths effectively.

## The Road Not Taken

- We could have chosen to train the model on larger body parts or the entire avatar, but this would require significantly more computational resources.

## The Infrequent Use Case

- This approach may not be suitable for avatars with complex structures or high polygon counts.

## In Core and Done by Us

- The training of the mesh transformer will be done by us, using our acquired resources and expertise.

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
