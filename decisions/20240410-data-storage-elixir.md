# Proposal: Implementing Elixir Data Models for Memory, Local, Bulk, and Global Storage

## Context

We aim to efficiently and reliably store bulk model data and manage game entity replication.

## Problem Statement

The existing system struggles with storing large volumes of 3D model data and managing game entity replication effectively. This results in performance issues and potential data loss.

## Proposed Solution

### 1. Setup Desync (casync)

We will use Desync as the primary storage for bulk 3D models. Desync is a content-addressable data synchronization tool that uses the CAS chunking from casync but operates on a higher level and works efficiently over HTTP/2.

```bash
go get github.com/folbricht/desync
desync make -s /path/to/store.castr /path/to/input
```

### 2. Configure Etso for ETS

Etso will be used to manage temporary, in-memory data structures with Ecto schemas in Elixir applications. This is ideal for quick data manipulation and caching.

```elixir
defmodule MyApp.Cache do
  use Etso.Schema
  @primary_key {:id, :binary_id, autogenerate: true}
  field :key, :string
  field :value, :any
end
```

### 3. Deploy Raft/Ra for Consensus

We will implement Raft/Ra to ensure distributed consensus across system nodes. This is crucial for coordinated state changes and maintaining data consistency.

### 4. Utilize CockroachDB for Persistent Storage

CockroachDB will store critical, structured data requiring ACID transactions and global accessibility. This ensures data durability.

### 5. Data Flow Management

We will establish data flow protocols to move temporary data from Etso/ETS to Desync for bulk storage and CockroachDB for structured data persistence.

### 6. Ensure Consistency

Raft/Ra will manage write operations across Desync and CockroachDB, ensuring consistency and fault tolerance.

## Benefits

- Efficient storage of bulk 3D model data
- Effective management of game entity replication
- Improved system performance
- Reduced risk of data loss

## Downsides

- Requires significant development effort
- Potential for increased system complexity

## Alternatives Considered

We considered traditional databases or file systems as alternatives, but they were rejected due to their limitations in handling large volumes of 3D model data and managing game entity replication.

## Infrequent Use Case

This proposal may not be suitable for smaller projects that do not require the storage of large volumes of 3D model data or managing game entity replication.

## Implementation

The V-Sekai development team will implement this proposal.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

Assisted by Aria.
