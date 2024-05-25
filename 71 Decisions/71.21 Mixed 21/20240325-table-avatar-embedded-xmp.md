# Proposed: for 3d Asset Schema Design and Database Backend Selection

## Context

The current project involves creating a schema for storing VRM license data, GLTF 3d assets, and other metadata. The data will be stored in a `public.cbf_avatar` table with fields such as `created_at`, `gltf_embedded`, `id`, and `xmp`.

## Problem Statement

The main challenge is deciding on the appropriate database backend and determining whether storing large files in a relational database is a good practice.

## Proposed Solution

```sql
CREATE TABLE public.cbf_avatar (
    created_at timestamptz DEFAULT now() NOT NULL,
    gltf_embedded jsonb DEFAULT '{}'::jsonb NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    xmp jsonb DEFAULT '{}'::jsonb NOT NULL,
    CONSTRAINT cbf_avatar_pkey PRIMARY KEY (id)
);
```

The proposed solution involves using either Supabase PostgreSQL or FoundationDB with SQLite as the database backend. The `gltf_embedded` field will store GLTF 3d asset data as JSON binary, while the `xmp` field will store VRM license data and other metadata.

## Benefits

- The use of JSON binary allows for efficient storage and retrieval of GLTF 3d assets.
- The chosen database backends are robust and reliable, ensuring data integrity and consistency.

## Downsides

- Storing large files in a relational database could potentially lead to disk thrashing and other performance issues.
- Fields in databases generally have a size limit, which could pose problems if the data exceeds this limit.

## The Road Not Taken

An alternative approach would be to store the large files in a separate file system and only keep references to these files in the database. However, this might complicate the data management process.

## Infrequent Use Case

This schema design and database backend selection may not be suitable for applications that require extremely high performance or have strict limitations on data size.

## In Core and Done by Us

The schema design and database backend selection will be implemented by the V-Sekai development team.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine
3. [Postgres Storing Large Text](https://blog.rustprooflabs.com/2020/07/postgres-storing-large-text) - A 2020 article suggesting that larger file storage in a relational database is okay.

This proposal was assisted by Aria, an AI assistant.
