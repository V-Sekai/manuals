# Proposed: "Sunny Park" Test Case for 3D Tile Sync

## Objective

This test case uses selected database technology to evaluate the efficiency and accuracy of syncing 3D tiles between Blender and Godot. The test will involve basic CRUD operations on a set of 3D tiles representing a park.

## Components

- **3D Tiles**: Grass, Pathway, Bench, Tree, Pond
- **Tools**: Blender (creation/editing), Godot Engine (scene assembly), Database (syncing)

## Steps

1. **Create (Blender)**: Design 5 3D park tiles and store their data in the database.
2. **Read (Godot)**: Import tiles from the database into Godot and assemble “Sunny Park.”
3. **Update (Blender)**: Modify a tile (e.g., bench color), update the database, and check the update in Godot.
4. **Delete (Blender)**: Remove a tile (e.g., pond), delete it from the database, and confirm removal in Godot.

## Evaluation Criteria

- **Synchronization Accuracy**: Ensure Blender changes are accurately reflected in Godot.
- **Performance**: Measure time for sync operations.
- **Ease of Use**: Assess the complexity of sync steps.
- **Error Handling**: Check the system’s response to errors like missing data.

Tiling will be done by brickworks schema. See also lawnjelly’s spergler algorithm and libgodot.

# Proposal

## Context

The context of this proposal is the need for efficient and accurate synchronization of 3D tiles between Blender and Godot Engine.

## Problem Statement

The problem is determining whether sqlite-fdb, multi raft or cockroachdb would be faster for Blender to Godot engine 3D tiles sync.

## Benefits

The benefits of this proposal include improved performance, ease of use, and error handling in the synchronization process.

## Downsides

Potential downsides may include increased complexity and potential for errors during synchronization.

## Road Not Taken

Alternatives not considered include other database technologies that could potentially be used for synchronization.

## Infrequent Use Case

This proposal may not apply to projects that do not require frequent synchronization of 3D tiles between Blender and Godot Engine.

## In Core and Done by Us

The V-Sekai development team will implement this proposal.

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

AI assistant Aria assisted with this article.
