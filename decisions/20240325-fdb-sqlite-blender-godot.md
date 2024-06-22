# Proposed: Synchronizing Blender and FDB-SQLite for Proxy Movement

## Context

Blender is a powerful open-source 3D creation suite that supports the entirety of the 3D pipeline. On the other hand, FDB-SQLite is a SQL layer built on top of the key-value store FoundationDB. The goal is to synchronize these two systems to proxy movement.

## Problem Statement

The challenge is to create a system where movements made in Blender are reflected in the FDB-SQLite database. This would allow for real-time tracking and manipulation of 3D models in a database environment.

## Proposed Solution

We can achieve this by creating an interface between Blender and FDB-SQLite. This interface will listen for changes in Blender and update the corresponding entries in the FDB-SQLite database.

```python
class BlenderFDBInterface:
    def __init__(self, blender, fdb):
        self.blender = blender
        self.fdb = fdb

    def sync(self):
        # Get current state from Blender
        state = self.blender.get_state()

        # Update FDB with current state
        self.fdb.update(state)
```

## Benefits

- Real-time synchronization between Blender and FDB-SQLite.
- Allows for complex queries and manipulations on 3D model data.
- Opens up possibilities for advanced analytics and machine learning applications.

## Downsides

- Requires careful management of database transactions to avoid conflicts.
- Potential performance issues due to constant syncing.

## The Road Not Taken

An alternative approach could be to use a different database system that has built-in support for 3D data. However, this would require migrating all existing data and potentially reworking other parts of the system.

## The Infrequent Use Case

This solution may not be suitable for scenarios where the 3D models are rarely updated, as the constant syncing could be unnecessary overhead.

## In Core and Done by Us

This feature will be developed by our in-house team, ensuring that it fits seamlessly into our existing infrastructure.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine.

_AI assistant Aria assisted with this article._
