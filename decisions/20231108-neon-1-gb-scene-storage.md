# Proposed: Leveraging Neon's Bottomless Storage for V-Sekai's CDN Data

## Metadata

- Status: Proposed
- Deciders: V-Sekai, Fire
- Tags: V-Sekai, Neon, Postgres, Edge Hosting, Bottomless Storage, CDN, S3

## The Backdrop

V-Sekai, which provides CDN services for avatars and worlds, is exploring scalable and cost-efficient storage solutions to handle increasing data demands.

## The Challenge

How can V-Sekai take advantage of Neon's bottomless storage, which flushes PostgreSQL pages to S3 object storage, for our CDN needs?

## The Strategy

Integrate Neon's bottomless storage for V-Sekai's CDN data, which involves PostgreSQL pages being efficiently stored and managed in S3 object storage, allowing for scalability and cost-effectiveness at the edge.

## The Upside

- Scalability with Neon's bottomless feature, moving data seamlessly to S3.
- Cost benefits of using object storage for large amounts of data.
- The potential for better performance at the edge due to reduced local storage needs.

## The Downside

- Dependence on S3's availability and performance characteristics.
- Possible complexity in managing data lifecycle between edge storage and S3.

## The Road Not Taken

Continued reliance on traditional database storage solutions without the advantages of Neon's cloud-native approach.

## The Infrequent Use Case

Edge cases where the immediate availability of large datasets is crucial and may require hybrid storage solutions.

## In Core and Done by Us?

Yes, implementing Neon's bottomless storage as a key part of V-Sekai's backend is proposed, with the plan to manage the integration and maintenance internally.

## Further Reading

- [V-Sekai on GitHub](https://github.com/v-sekai/)
- [Neon's Architecture Details](https://neon.tech/docs/introduction/about)
- [Neon's Storage Explanation](https://neon.tech/docs/concepts/storage)

This article was assisted by AI.
