## Prototype 0: Push an Asset to a Service

This prototype involves pushing an asset to a service with sanitization and validation. The service will separate the Node3D, colliders, and skeletons. Then, the game server pulls those elements in.

### Input

The input for this prototype is either a Godot text scene or a Godot binary scene.

### Data Structures

There are two primary data structures used in this prototype:

- An Elixir structure representing a Godot Scene.
- An Elixir structure that represents the list of validations for 3D modeling and animation.

#### Godot Scene

The Godot Scene does the following:

1. Reconstructs a virtual tree from a flat array of nodes to prevent node paths from breaking out of the scene.
2. Strips resources like gdscripts in the packed scene using an allowlist.

#### Node3D Validations

The Node3D Validations include:

1. **Validate Node3D Naming Suffix**: This confirms that the naming suffix for Node3D is correct.
2. **Validate Unique Names**: This verifies that all names in the Node3D are unique.

#### Colliders Validations

The Colliders Validations include:

1. **Validate Collider Shape**: This ensures each collider has a valid shape assigned.
2. **Validate Collider Position**: This checks that each collider's position is within the expected range.
3. **Validate Collider Size**: This confirms that each collider's size is within the desired range.

#### Skeleton Validations

The Skeleton Validations include:

1. **Validate Skeleton Bones**: This ensures that each bone in the skeleton is connected to at least one other bone.
2. **Validate Skeleton Bind Pose**: This checks that the bind pose of the skeleton is correctly defined.
3. **Validate Skeleton Weight Painting**: This confirms that the weight painting of the skeleton is perfectly done.

### Output

The output for this prototype is a Godot Scene.
