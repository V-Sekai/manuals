# Proposed: RabbitMQ RA vs SQLite on FoundationDB vs CockroachDB

## Context

We are at a critical juncture in our system design process. The primary question is whether to utilize the RabbitMQ RA system for distributed state machines, implement an SQLite cluster database built on top of FoundationDB, or use CockroachDB.

## Problem Statement

The core issue is identifying which options deliver the fastest and most reliable service. We require a system capable of handling high data volumes, maintaining consistency, and ensuring rapid response times, particularly when transferring 3D scene format tiles from Blender or Godot Engine.

## Proposal

### RabbitMQ RA System

RabbitMQ RA system might be the better choice if speed and low latency are the primary concerns. It's designed for high-throughput scenarios and can handle many messages without significant delays.

### SQLite Cluster Database on FoundationDB

An SQLite cluster database on FoundationDB, while also fast, focuses more on providing ACID transactions and scalability. Therefore, it could be better if the workload involves complex transactions or needs to scale over time.

### CockroachDB

CockroachDB is a cloud-native SQL database for building global, scalable cloud services that survive disasters. It provides ACID transactional consistency and versioned values as first-class features.

## Benefits

- All three systems offer robust solutions for handling large amounts of data.
- RabbitMQ RA system provides a reliable messaging system focusing on processing speed and low latency.
- SQLite cluster database on FoundationDB offers a scalable solution with ACID transactions.
- CockroachDB is a cloud-native SQL database that provides global scalability and disaster recovery.

## Downsides

- RabbitMQ RA system may not be as scalable as the SQLite cluster database on FoundationDB or CockroachDB.
- SQLite cluster database on FoundationDB might have slower response times than the RabbitMQ RA system.
- CockroachDB, while offering strong consistency and scalability, might not be as fast as RabbitMQ RA system for certain workloads.

## Alternatives

We could also consider other databases or messaging systems, but these three options seem the most promising given our specific needs and constraints.

## Infrequent Use Case

In cases where data volume is low, the difference in performance between these three systems may not be significant.

## Implementation

Our development team will decide whether to use any of these systems. We will also handle the implementation and maintenance of the chosen system.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [Efficient_Methods_for_Improving_Scalability_and_Playability_of_Massively_Multiplayer_Online_Game_MMOG](https://pure.bond.edu.au/ws/portalfiles/portal/18275482/Efficient_Methods_for_Improving_Scalability_and_Playability_of_Massively_Multiplayer_Online_Game_MMOG_.pdf)

Aria assisted with this analysis.
