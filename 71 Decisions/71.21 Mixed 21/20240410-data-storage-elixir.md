# Proposed: Implementing Elixir Data Models for Memory, Local, Bulk, and Global Storage

## Context

The goal is to effectively manage large volumes of 3D model data and game entity replication reliably and efficiently.

## Problem Statement

The current system faces challenges handling large amounts of 3D model data and managing game entity replication. This leads to performance issues and potential data loss.

## Proposed Solution

The solution involves several steps to ensure data consistency and durability:

1. **Content Delivery Network (CDN)**: We will create a CDN similar to a static sftp file store for efficient content delivery.

2. **Etso for Erlang Term Storage (ETS)**: Etso will be configured to manage temporary, in-memory data structures with Ecto schemas in Elixir applications. This is ideal for quick data manipulation and caching.

3. **Raft/Ra for Distributed Consensus**: Raft/Ra will be deployed to ensure distributed consensus across system nodes, which is crucial for coordinated state changes and maintaining data consistency.

4. **CockroachDB for Persistent Storage**: CockroachDB will store critical, structured data that requires ACID transactions and global accessibility. This ensures the durability of our data.

5. **Data Flow Management**: Protocols will be established to move temporary data from Etso/ETS to the CDN for bulk storage. For structured data persistence, we will use CockroachDB.

6. **Consistency Management**: Raft/Ra will manage write operations across the CDN and CockroachDB to ensure consistency and fault tolerance.

### Configure Etso for ETS

```elixir
defmodule MyApp.Cache do
  use Etso.Schema
  @primary_key {:id, :binary_id, autogenerate: true}
  field :key, :string
  field :value, :any
end
```

### Deploy Raft/Ra for Consensus

Raft/Ra will be implemented to ensure distributed consensus across system nodes.

### Utilize CockroachDB for Persistent Storage

CockroachDB will store critical, structured data that requires ACID transactions and global accessibility.

### Data Flow Management with Membrane Framework

The Membrane Framework will establish Data flow protocols to move temporary data from Etso/ETS to the CDN for bulk storage and CockroachDB for structured data persistence.

### Ensure Consistency

Raft/Ra will manage write operations across the CDN and CockroachDB, ensuring consistency and fault tolerance.

## Benefits

- Efficient storage of bulk 3D model data
- Effective management of game entity replication
- Improved system performance
- Reduced risk of data loss

## Downsides

- Requires significant development effort
- Potential for increased system complexity

## Alternatives Considered

Traditional databases or file systems were considered but rejected due to their limitations in handling large volumes of 3D model data and managing game entity replication.

## Infrequent Use Case

This proposal may not be suitable for smaller projects that do not require the storage of large volumes of 3D model data or managing game entity replication.

## Implementation

The V-Sekai development team will implement this proposal.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team, "Bioblaze Payne", "fire"

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

Assisted by Aria.
