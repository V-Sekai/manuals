# Proposed: Train quad-based Meshgpt within constraints

## The Context

The goal is to train a MeshGPT model for quad-based geometry with limited resources of one day using fixed Nvidia GPU hardware to evaluate its performance.

## The Problem Statement

Describe a workflow for training Meshgpt with quad-based meshes to create a set of LODs (Level of Detail) within the given constraints.

## Proposed Workflow (with Data Selection Section)

1. **Data Preparation**: Collect a diverse dataset of quad-based meshes suitable for generating LODs. This involves cleaning and normalizing the data to ensure consistency and remove inconsistencies or errors. Categorizing the data based on complexity and size allows for targeted training and model performance evaluation across different mesh types. A requirement is to attribute every available source 3d model. Gather a dataset of quad-based meshes representing various objects within the distance range of interest.

2. **Model Architecture Selection**: Choose an appropriate language model architecture to handle geometric data effectively. MeshGPT could be a good starting point due to its success in handling 3D mesh generation tasks.

3. **Batch Processing Technique**: Implement a batch processing technique to optimize the use of GPU resources.

4. **Hyperparameter Tuning**: Fine-tune the hyperparameters, such as learning rate, batch size, and number of layers, to achieve optimal performance within the given time constraint. This may involve experimentation with different values and configurations to find the best setup for the chosen model architecture and dataset.

5. **Training Process**: Train the MeshGPT model using the prepared dataset with the chosen architecture, optimized batch processing technique, and fine-tuned hyperparameters for over one day. This involves monitoring the training process and making necessary adjustments to ensure optimal performance within the given timeframe.

6. **Evaluation**: Evaluate the trained model's performance by generating LODs for a diverse quad-based mesh and comparing them to ground truth data or existing LOD generation methods.

7. **Results Analysis**: Analyze the results obtained from the evaluation stage, focusing on metrics such as accuracy, speed, and resource usage.

## The Benefits

- Efficient utilization of Video RAM in training large language models for mesh generation tasks.
- Ability to train the MeshGPT model within a one-day timeframe.
- Improved LOD generation capabilities for quad-based meshes.

## The Downsides

- Limited flexibility due to the constraint of Video RAM.
- Training large language models can be computationally intensive and require significant processing power, potentially impacting system performance.
- Requires careful hyperparameter tuning for optimal results within the given timeframe.

## The Road Not Taken

- Using less powerful hardware or smaller video RAM would result in longer training times or lower model capacity.
- Opting for a more complex model architecture without optimizations could lead to overfitting and poor performance on the LOD generation task.

## The Infrequent Use Case

In cases where more advanced GPU hardware is available, this workflow may not be necessary as it would allow for larger models or longer training times, potentially resulting in better performance. However, the proposed workflow can be a starting point for those with limited resources or time constraints.

## In Core and Done by Us

- Workflow design specifically tailored to train MeshGPT on quad-based meshes within one day using a fixed sized video RAM.
- Hyperparameter tuning and optimization techniques are implemented to maximize performance under the given constraints.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [Runpod](https://www.runpod.io/)
4. [MeshGPT with Quads](https://github.com/lucidrains/meshgpt-pytorch/issues/54)

AI assistant Aria assisted with this article.
