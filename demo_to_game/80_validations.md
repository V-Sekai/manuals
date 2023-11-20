# Godot Scene

1. Reconstructs a virtual tree from a flat array of nodes to prevent node paths from breaking out of the scene.
2. Strips resources like gdscripts in the packed scene using a whitelist.
3. Handles different scenes differently based on their context:
   - Avatar or maps
   - Applies different whitelists
   - Allows 2D nodes only if they're part of another viewport.

#### Mesh Vertex Attributes

1. **Validate Mesh Vertices Have Edges**: Ensure that each vertex in the mesh is connected to at least one edge.
2. **Validate Mesh Has Overlapping UVs**: Check if any UV coordinates in the mesh overlap.
3. **Validate Mesh Single UV Set**: Confirm that the mesh only has one set of UV coordinates.
4. **Validate Mesh Has UVs**: Verify that the mesh has UV coordinates.
5. **Validate Mesh No Co-Planar Faces**: Ensure that there are no faces in the mesh that lie on the same plane.
6. **Validate Mesh Ngons**: Check for the presence of polygons with more than four sides in the mesh.
7. **Validate Mesh Non-Manifold**: Confirm that the mesh does not have any non-manifold geometry.
8. **Validate Mesh No Negative Scale**: Ensure that the scale of the mesh is not negative.
9. **Validate Mesh Edge Length Non Zero**: Verify that all edges in the mesh have a length greater than zero.
10. **Validate Mesh Normals Unlocked**: Check that the normals of the mesh are not locked and can be modified.
11. **Validate Mesh UV Set Map 1**: Confirm that the first UV set map of the mesh is correctly configured.
12. **Validate if Mesh is Triangulated**: Ensure that the mesh is composed entirely of triangular faces.

#### Material

13. **Validate Color Sets**: Check that the color sets used in the material are valid.
14. **Validate Model's default uv set exists**: Confirm that the model has a default UV set.

#### General

15. **Validate Model Name**: Ensure that the model has a valid name.
16. **Validate Model Content**: Check that the content of the model is valid.
17. **Validate Node3D Naming Suffix**: Confirm that the naming suffix for Node3D is correct.
18. **Validate No Node3D Transforms**: Check that there are no null or empty Node3D transforms in the model.
19. **Validate No Unknown Nodes**: Confirm that there are no unknown nodes in the model.
20. **Validate Node No Ghosting**: Verify that there is no ghosting effect on any node.
21. **Validate Shape Default Names**: Ensure that the default names for shapes are valid.
22. **Validate Shape Render Stats**: Check the render statistics for each shape.
23. **Validate Shape Zero**: Confirm that the zero position for each shape is correctly set.
24. **Validate Transform Zero**: Ensure that the zero position for each transform is correctly set.
25. **Validate Unique Names**: Verify that all names in the model are unique.

#### Animations

28. **Validate No Animation**: Check that there are no animations in the model.
29. **Ensure no keyframes on nodes in the Instance**: Confirm that there are no keyframes on any nodes in the instance.

### Output

1. Output Godot Scene

Before the game client/server architecture is sound, we need to be able to push an asset to a service with sanitization and validation. This service will separate the colliders and other elements. Then, the game server pulls those colliders in.
