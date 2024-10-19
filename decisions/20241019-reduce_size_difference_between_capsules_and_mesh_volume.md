### Proposed: Reduce Size Difference Between Capsules and Mesh Volume

## Context

Accurately fit capsules around bones in skinned skeleton meshes. The example provided involves a rectangle skinned by two bones, with each vertex influenced by up to 8 weights.

## Problem Statement

The goal is to minimize the size discrepancies between the capsules surrounding the bones and the actual volume defined by the skin mesh. This will be approached using the Minimum Deviation Flow problem in bidirected graphs (Bi-MDF).

## Approach to Minimize Capsule Size Errors

### Step 1: Representation of the Skeleton and Skin Mesh

- **Skeleton**: Represent each bone as a node in a graph.
- **Skin Mesh**: Each vertex of the mesh is also a node. Connect a bone to a vertex with an edge if the vertex is influenced by that bone, based on skin weights.

### Step 2: Define the Objective

- The objective is to minimize the size differences between the capsules (nodes) and the volume of the skin mesh. This is quantified using a cost function that measures the deviation from ideal capsule sizes.

## Implementation Using GDScript

```gdscript
# SPDX-FileCopyrightText: 2023 Your Name <your.email@example.com>
# SPDX-License-Identifier: MIT

extends Node

class Node:
    var id: int
    var flow: float = 0.0
    var target_size: float = 0.0  # The ideal size for this node (capsule)

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
        # Ideally, it should return {"cost": total_cost, "solution": flow_values}
        return {"cost": 0, "solution": {}}

# Cost Function Definitions
func quad_deviation(flow: float, target: float) -> float:
    return pow(flow - target, 2)  # Quadratic cost based on deviation

# Main function to set up and run the Bi-MDF problem
func _ready():
    var bimdf = BiMDF.new()

    # Example of setting up the skeleton (nodes)
    var bone1 = bimdf.add_node(4.0)  # Example target size for bone1 capsule
    var bone2 = bimdf.add_node(2.5)  # Example target size for bone2 capsule
    var bone3 = bimdf.add_node(3.0)  # Example target size for bone3 capsule

    # Skin Mesh vertices (example)
    var vertex1 = bimdf.add_node(1.0)  # Target size for this vertex
    var vertex2 = bimdf.add_node(0.5)  # Target size for this vertex
    var vertex3 = bimdf.add_node(0.75) # Target size for this vertex

    # Connect bones to vertices based on skin weights
    bimdf.add_edge(bone1, vertex1, func(flow: float) -> float: return quad_deviation(flow, vertex1.target_size))
    bimdf.add_edge(bone1, vertex2, func(flow: float) -> float: return quad_deviation(flow, vertex2.target_size))
    bimdf.add_edge(bone2, vertex2, func(flow: float) -> float: return quad_deviation(flow, vertex2.target_size))
    bimdf.add_edge(bone2, vertex3, func(flow: float) -> float: return quad_deviation(flow, vertex3.target_size))
    bimdf.add_edge(bone3, vertex3, func(flow: float) -> float: return quad_deviation(flow, vertex3.target_size))

    # Solve the Bi-MDF problem
    var result = bimdf.solve()
    print("Total cost: ", result.cost)

    for edge in bimdf.edges:
        print("Flow on edge: ", edge.u.flow + edge.v.flow)  # Placeholder for flow values
```

### Key Components

- **Nodes**: Represent bones and vertices with target sizes.
- **Edges**: Connect bones to vertices with a cost function based on weight influence and deviation.
- **Bi-MDF Algorithm**: Solves the optimization problem to minimize total cost.

## Benefits

- **Accuracy**: Improves the fit of capsules to the actual mesh, enhancing animation quality.
- **Efficiency**: Reduces computational overhead by focusing on significant discrepancies.

## Downsides

- **Complexity**: Implementing and tuning the Bi-MDF algorithm can be complex.
- **Dependency**: Relies heavily on accurate weight assignments and initial conditions.

## Further Steps

- **Algorithm Implementation**: Complete the `solve` method with the actual Bi-MDF logic.
- **Testing and Validation**: Ensure the model works across various scenarios and meshes.
- **Integration**: Seamlessly integrate this solution into existing animation pipelines.

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai GitHub](https://github.com/v-sekai)
2. [V-Sekai Game Repository](https://github.com/v-sekai/v-sekai-game)

This proposal was assisted by AI assistant Aria.
