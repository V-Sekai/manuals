# Proposed: for using workloads to emulate the usage patterns

## Context

V-Sekai is a social virtual reality platform. Users interact with each other through avatars in different environments. The main operations include high read operations, moderate to high write operations, and latency sensitivity.

## Problem Statement

To ensure the best performance and user experience, we need to understand how the database system might perform under conditions similar to those experienced by V-Sekai. This includes balancing between high read operations for content delivery and write operations for dynamic user interactions, all while maintaining low latency.

## Proposed Solution

We propose to use the Yahoo! Cloud Serving Benchmark (YCSB) workload to emulate the usage patterns of V-Sekai. This would involve a combination of workloads:

### Workload A

- 50% read and 50% update operations.
- Simulates user interactions within V-Sekai, such as position updates, gestures, or environment interactions.

### Workload B

- 95% read and 5% update operations.
- Represents the frequent fetching of environment and avatar details.

### Customized Workload

- Adjusting the read and write ratios to reflect the real-time, interactive nature of V-Sekai.
- Emphasizing low latency in the benchmarking parameters.

```pseudo
1. Set up YCSB with Workload A and B
2. Customize the read/write ratio based on V-Sekai's usage patterns
3. Emphasize low latency in the benchmarking parameters
4. Run the benchmark and analyze the results
```

## Benefits

- Provides insights into how a database system might perform under V-Sekai-like conditions.
- Helps optimize the balance between read and write operations.
- Ensures low latency for a seamless user experience.

## Downsides

- Requires careful tuning and understanding of YCSB workloads.
- The benchmark results might not perfectly reflect real-world usage due to the synthetic nature of benchmarks.

## The Road Not Taken

An alternative would be to use pre-defined YCSB workloads without customization. However, this might not accurately reflect V-Sekai's specific usage patterns.

## The Infrequent Use Case

In scenarios where the usage patterns are not consistent or predictable, customizing the YCSB workload might not provide accurate insights.

## In Core and Done by Us

The setup and customization of the YCSB benchmark will be done by the V-Sekai development team with support from the community stakeholders.

## Status

Status: Rejected

## Decision Makers

- V-Sekai development team and community stakeholders.

## Tags

- V-Sekai, Performance Benchmarking, Database Optimization

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)

_This proposal was assisted by Aria, an AI assistant._
