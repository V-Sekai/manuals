# Proposed: Implementing Neon for Edge Hosting of V-Sekai's CDN Data with bytea Storage

## Metadata

- Status: Proposed
- Deciders: V-Sekai, Fire
- Tags: V-Sekai, Neon, Postgres, Edge Hosting, Bottomless Storage, CDN, bytea

## The Backdrop

V-Sekai, which manages a vast array of CDN data for avatars and worlds, requires a scalable and locally manageable storage solution with low latency.

## The Challenge

Can V-Sekai effectively use Neon's bottomless storage and local hosting to manage our CDN data at the edge, storing binary data as `bytea` in PostgreSQL?

## The Strategy

Implement Neon's bottomless storage system at edge locations, using the `bytea` data type for storing binary data to maximize CDN data performance and manageability. This approach will utilize PostgreSQL's TOAST system for efficient out-of-line storage.

## The Upside

- Enhanced performance with data stored at the edge, reducing latency for end-users.
- The scalability of Neon's bottomless storage, using `bytea` for efficient binary data management.
- The manageability of PostgreSQL's storage system, with no special maintenance for `bytea` data.

## The Downside

- The `bytea` data type comes with a 1GB size limit for each field, which may require consideration for larger CDN assets.
- Full `bytea` data must be loaded into memory for read/write operations, which could impact performance with large binary objects.

## The Road Not Taken

Centralized cloud solutions or other data types that may not offer the edge performance benefits or the straightforward management of `bytea`.

## The Infrequent Use Case

Handling exceptionally large binary data objects that exceed the `bytea` size limit, necessitating alternative storage strategies.

## In Core and Done by Us?

Yes, the implementation of Neon for edge hosting, with `bytea` for data storage, is intended to be a core part of V-Sekai's infrastructure, managed internally.

## Further Reading

- [V-Sekai on GitHub](https://github.com/v-sekai/)
- [Neon's Architecture Details](https://neon.tech/docs/introduction/architecture-overview)
- [What is Neon? - Neon Docs](https://neon.tech/docs/introduction/about)
- [Discussion on Neon's Local Hosting Capabilities](https://community.neon.tech/t/can-neon-be-self-hosted/51)

This article was assisted by AI.
