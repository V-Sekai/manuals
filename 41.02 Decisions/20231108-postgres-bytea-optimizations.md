# Proposed: PostgreSQL `bytea` Storage Optimization for V-Sekai's Edge CDN

## Metadata

- Status: Proposed
- Deciders: V-Sekai, Fire
- Tags: V-Sekai, PostgreSQL, Edge Hosting, CDN, `bytea`, TOAST, Optimization

## The Backdrop

V-Sekai maintains an open-source CDN platform and seeks database optimizations for better performance and scalability.

## The Challenge

How can V-Sekai enhance binary data storage and access by leveraging PostgreSQL's `bytea` type with EXTERNAL storage, independent of Neon's bottomless feature?

## The Strategy

Optimize the PostgreSQL database schema for CDN data by setting `bytea` columns to use EXTERNAL storage. This facilitates out-of-line and uncompressed storage of binary data, improving read performance and enabling streaming capabilities.

## The Upside

- Reduced CPU usage by bypassing compression for binary data.
- Efficient access to specific data segments without loading entire objects, beneficial for streaming content.

## The Downside

- Complexity in managing custom TOAST configurations.
- Need for precise database management to ensure performance gains.

## The Road Not Taken

Defaulting to the EXTENDED storage type, which compresses `bytea` data but may not be as efficient for V-Sekai's use case.

## The Infrequent Use Case

Scenarios requiring compressed storage for binary data, where the EXTENDED storage type might be more appropriate.

## In Core and Done by Us?

The PostgreSQL optimization will be implemented by V-Sekai's team as a crucial part of our infrastructure enhancements.

## Further Reading

- [V-Sekai on GitHub](https://github.com/v-sekai/)
- [Binary Data Performance in PostgreSQL - CYBERTEC](https://www.cybertec-postgresql.com/en/binary-data-performance-in-postgresql/)&#8203;`【oaicite:0】`&#8203;

This article was assisted by AI.
