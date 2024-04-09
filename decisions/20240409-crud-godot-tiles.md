# Proposed: "Sunny Park" Test Case for 3D Tile Sync

## Objective

This test case aims to utilize a specific database technology, sqlite-fdb, to assess the efficiency and accuracy of syncing 3D tiles between Blender and Godot. The test will involve basic CRUD operations on a set of 3D tiles representing a park.

## Components

- **3D Tiles**: These include Grass, Pathway, Bench, Tree, Pond.
- **Tools**: The tools used in this process are Blender (for creation/editing), Godot Engine (for scene assembly), and Database (for syncing).

## Steps

1. **Create (Blender)**: Design 5 different 3D park tiles and store their data in the database.
2. **Read (Godot)**: Import the tiles from the database into Godot and assemble the “Sunny Park.”
3. **Update (Blender)**: Modify a tile (e.g., change the color of the bench), update the database, and verify the update in Godot.
4. **Delete (Blender)**: Remove a tile (e.g., pond), delete it from the database, and confirm its removal in Godot.

## Evaluation Criteria

- **Synchronization Accuracy**: Ensure that changes made in Blender are accurately reflected in Godot.
- **Performance**: Measure the time taken for sync operations.
- **Ease of Use**: Evaluate the complexity of the sync steps.
- **Error Handling**: Check how the system responds to errors such as missing data.

# Proposal

## Context

This proposal arises from the need for an efficient and accurate synchronization of 3D tiles between Blender and Godot Engine.

## Problem Statement

The problem is determining whether SQLite-fdb would be faster for syncing 3D tiles from Blender to Godot engine compared to multi raft or cockroachdb.

## Benefits

The benefits of this proposal include improved performance, ease of use, and error handling in the synchronization process.

## Downsides

Potential downsides may include increased complexity and potential for errors during synchronization.

## Road Not Taken

This proposal did not consider other database technologies that could be used for synchronization.

## Infrequent Use Case

This proposal may not apply to projects that do not require frequent synchronization of 3D tiles between Blender and Godot Engine.

## In Core and Done by Us

The V-Sekai development team will be responsible for implementing this proposal.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [Efficient_Methods_for_Improving_Scalability_and_Playability_of_Massively_Multiplayer_Online_Game_MMOG by Prasetya, Kusno](https://pure.bond.edu.au/ws/portalfiles/portal/18275482/Efficient_Methods_for_Improving_Scalability_and_Playability_of_Massively_Multiplayer_Online_Game_MMOG_.pdf)
4. lawnjelly’s spergler algorithm for splitting meshes
5. libgodot.

AI assistant Aria assisted with this article.
