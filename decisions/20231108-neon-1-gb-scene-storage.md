# Proposed: Utilizing Neon for Edge Hosting with `bytea` for V-Sekai's CDN Data

## Metadata

- Status: Proposed
- Deciders: V-Sekai, Fire
- Tags: V-Sekai, Neon, Postgres, Edge Hosting, `bytea`, Bottomless Storage, CDN

## The Backdrop

V-Sekai manages an extensive array of CDN data for avatars and worlds. There is a need for a storage solution that is both scalable and manageable at the edge.

## The Challenge

How can V-Sekai use Neon's bottomless storage to manage our CDN data for avatars and worlds at the edge, considering the `bytea` data type's 1GB size limitation and in-memory load requirement for read/write operations in PostgreSQL?

## The Strategy

Deploy Neon's storage system at edge locations, using the `bytea` data type within PostgreSQL for binary data. This will utilize TOAST for efficient out-of-line storage while considering the `bytea` limitations within Neon's architecture.

## The Upside

- Edge hosting for reduced latency and improved user experience.
- Neon's bottomless storage for scalable data management.
- PostgreSQL's `bytea` for direct, no-maintenance storage of binary data.

## The Downside

- Constraints of `bytea`'s 1GB size limit for large CDN assets.
- The necessity of loading entire `bytea` data into memory for operations, impacting performance with large data sizes.

## The Road Not Taken

Other data storage solutions that might not provide the edge latency benefits or the straightforward binary data management with `bytea`.

## The Infrequent Use Case

Handling very large binary files that exceed the `bytea` size limit, which would require segmentation or alternative storage approaches.

## In Core and Done by Us?

Yes, the integration of Neon with `bytea` data type storage is proposed as a central infrastructure component, to be developed and maintained by V-Sekai's team.

## Further Reading

- [V-Sekai on GitHub](https://github.com/v-sekai/)
- [Neon's Architecture Details](https://neon.tech/docs/introduction/about)
- [Binary data performance in PostgreSQL - CYBERTEC](https://www.cybertec-postgresql.com/en/binary-data-performance-in-postgresql/)

This article was assisted by AI.
