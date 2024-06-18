# Proposed: Transforming Schedule DAG into a Left-child Right-sibling Binary Tree

## The Context

You have a Directed Acyclic Graph (DAG) for a schedule.

## The Problem Statement

You want to transform the schedule DAG into a Left-child right-sibling binary tree. This transformation will help in finding ways to hasten the critical path.

## Solution Proposal

The original graph was a Directed Acyclic Graph (DAG) where each node could have multiple children. The operations performed on this DAG were aimed at transforming it into a Left-child right-sibling binary tree. Here's a description of the operations:

1. **Identifying the First Child:** For each node in the original DAG, we identified the first child node. This is the left-most child in the original diagram.

2. **Identifying Siblings:** For each first child identified in step 1, we then identified its siblings. These are the nodes that share the same parent as the first child.

3. **Creating Binary Tree:** We created a new binary tree where each node has at most two children: the left child is the first child from the original diagram, and the right child is the next sibling of the left child.

4. **Preserving Order:** The order of the nodes in the binary tree follows the order of the nodes in the original DAG.

The resulting binary tree maintains the directed acyclic property of the original DAG, but now each node has at most two children, making it easier to traverse and manage.

## The Benefits

Transforming the schedule DAG into a Left-child right-sibling binary tree simplifies the structure, making it easier to traverse and manage. It also helps in identifying the critical path more efficiently, which can lead to improved scheduling and better resource allocation.

## The Downsides

The transformation process may require additional computational resources, especially for large DAGs. Also, if the original DAG has nodes with more than two children, some information may be lost in the transformation.

## The Road Not Taken

An alternative approach could have been to keep the original DAG structure and optimize the scheduling algorithm. However, this would not simplify the structure or make it easier to manage.

## The Infrequent Use Case

This proposal may not be beneficial for small DAGs or DAGs where the critical path is easily identifiable without transformation.

## In Core and Done by Us

The proposed transformation process will be implemented by the V-Sekai development team.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team
- Fire

## Tags

- V-Sekai
- DAG
- Binary Tree
- Schedule Optimization

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
