# Proposed: Adopting Neon's Bottomless Storage with S3-Compatible Object Store for Edge CDN Data Management

## Metadata

- Status: Proposed
- Deciders: V-Sekai, Fire
- Tags: V-Sekai, Neon, Edge Hosting, Bottomless Storage, S3 Compatible, CDN, PostgreSQL, `bytea`

## The Backdrop

V-Sekai operates an open-source platform and is in need of a scalable, high-performance solution for storing and managing CDN data for avatars and worlds at the edge.

## The Challenge

How can V-Sekai effectively use Neon's bottomless storage, which leverages PostgreSQL's capabilities and an S3-compatible object store, for edge-hosted CDN data management?

## The Strategy

Implement an edge computing architecture with Neon's PostgreSQL services, employing the `bytea` data type for binary data storage and Neon's bottomless storage system for flushing PostgreSQL pages to an S3-compatible object store.

## The Upside

- Edge-hosted architecture for optimal performance and data sovereignty.
- S3-compatible storage enables cost-effective scaling and redundancy.
- The use of PostgreSQL's `bytea` accommodates efficient binary data management without special maintenance.

## The Downside

- `bytea` data type has a 1GB size limit and requires loading full data into memory for operations, which might affect performance with large objects.
- Dependence on the reliability of S3-compatible services at the edge.

## The Road Not Taken

Centralized or non-S3-compatible storage solutions that may not provide the latency and scalability benefits of an edge-hosted environment.

## The Infrequent Use Case

Cases where binary data exceeds the `bytea` size limit, necessitating additional strategies for data segmentation or alternative storage methods.

## In Core and Done by Us?

Yes, the edge-hosted Neon infrastructure with an S3-compatible object store is planned to be developed and maintained in-house as a core component of V-Sekai's backend.

## Further Reading

- [V-Sekai on GitHub](https://github.com/v-sekai/)
- [Neon's Architecture and Bottomless Storage Details](https://neon.tech/docs/introduction/about)
- [PostgreSQL `bytea` Performance Considerations](https://www.cybertec-postgresql.com/en/binary-data-performance-in-postgresql/)

This article was assisted by AI.
