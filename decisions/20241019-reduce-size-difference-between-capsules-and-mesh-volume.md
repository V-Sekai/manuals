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

### Implementation Using GDScript

```gdscript
# SPDX-FileCopyrightText: 2024 K. S. Ernest "iFire" Lee <ernest.lee@chibifire.com>
# SPDX-License-Identifier: MIT

extends Node

class Node:
    var id: int
    var flow: float = 0.0
    var target_size: float = 0.0  # Ideal size for the capsule around this node

    func _init(id: int, target_size: float):
        self.id = id
        self.target_size = target_size

class Edge:
    var u: Node
    var v: Node
    var cost_function: Callable

    func _init(u: Node, v: Node, cost_function: Callable):
        self.u = u
        self.v = v
        self.cost_function = cost_function

class BiMDF:
    var nodes: Dictionary = {}
    var edges: Array = []

    func add_node(target_size: float) -> Node:
        var new_node = Node(nodes.size(), target_size)
        nodes[new_node.id] = new_node
        return new_node

    func add_edge(u: Node, v: Node, cost_function: Callable) -> Edge:
        var new_edge = Edge(u, v, cost_function)
        edges.append(new_edge)
        return new_edge

    func solve() -> Dictionary:
        # Placeholder for Bi-MDF algorithm implementation
        # Return a sample output structure for demonstration
        return {"cost": 0, "solution": {}}

# Cost Function Definitions
func quad_deviation(flow: float, target: float) -> float:
    return pow(flow - target, 2)  # Quadratic cost based on deviation

# Main function to set up and run the Bi-MDF problem
func _ready():
    var bimdf = BiMDF.new()

    # Setup: Two bones with ideal capsule sizes
    var bone1 = bimdf.add_node(3.0)  # Target size for capsule around bone1
    var bone2 = bimdf.add_node(2.0)  # Target size for capsule around bone2

    # Setup: Rectangle vertices (8 vertices for this example)
    var vertex1 = bimdf.add_node(1.0)  # Target size for this vertex
    var vertex2 = bimdf.add_node(1.0)  # Target size for this vertex
    var vertex3 = bimdf.add_node(1.0)  # Target size for this vertex
    var vertex4 = bimdf.add_node(1.0)  # Target size for this vertex
    var vertex5 = bimdf.add_node(1.0)  # Target size for this vertex
    var vertex6 = bimdf.add_node(1.0)  # Target size for this vertex
    var vertex7 = bimdf.add_node(1.0)  # Target size for this vertex
    var vertex8 = bimdf.add_node(1.0)  # Target size for this vertex

    # Skin weights (example): Assuming each vertex is influenced by the two bones
    var weights = {
        vertex1: [0.5, 0.5],  # Vertex 1 influenced equally by bone1 and bone2
        vertex2: [0.7, 0.3],  # More influence from bone1
        vertex3: [0.9, 0.1],  # Mostly bone1
        vertex4: [0.6, 0.4],  # Somewhat balanced
        vertex5: [0.4, 0.6],  # More influence from bone2
        vertex6: [0.2, 0.8],  # Mostly bone2
        vertex7: [0.3, 0.7],  # More influence from bone2
        vertex8: [0.5, 0.5]   # Equally influenced
    }

    # Connect bones to vertices based on skin weights
    for vertex in weights.keys():
        var weight1 = weights[vertex][0]
        var weight2 = weights[vertex][1]
        bimdf.add_edge(bone1, vertex, func(flow: float) -> float: return quad_deviation(flow, vertex.target_size * weight1))
        bimdf.add_edge(bone2, vertex, func(flow: float) -> float: return quad_deviation(flow, vertex.target_size * weight2))

    # Solve the Bi-MDF problem
    var result = bimdf.solve()
    print("Total cost: ", result.cost)

    for edge in bimdf.edges:
        print("Flow on edge: ", edge.u.flow + edge.v.flow)  # Placeholder for flow values
```

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
