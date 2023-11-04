# Rejected: V-Sekai Database Solution for 50,000 Concurrent Online Users

## Metadata

- Status: rejected
- Deciders: V-Sekai, fire
- Tags: V-Sekai, llm summarization

## Context and Problem Statement

V-Sekai is currently facing a decision on which database solution to use for their project that can handle the load of 50,000 concurrent online users. The options being considered are [PostgreSQL](https://www.postgresql.org/), [CockroachDB](https://www.cockroachlabs.com/), [SQLite on FoundationDB](https://forums.foundationdb.org/t/mvsqlite-distributed-mvcc-sqlite-that-runs-on-foundationdb/3493), or [YugabyteDB](https://docs.yugabyte.com/stable/api/ysql/datatypes/). Each option has its own set of advantages and disadvantages, and the team needs to determine which one best fits their requirements.

## Proposed Solution

Based on the discussion, it seems that YugabyteDB might be a suitable choice for V-Sekai's needs. It offers a single-node setup with the potential for growth, supports a wide range of data types, and provides externally consistent transaction levels. Additionally, YugabyteDB appears to be more compatible with the existing schema compared to SQLite.

## Implementation

To implement YugabyteDB as the chosen database solution, the following steps should be taken:

1. Evaluate YugabyteDB's compatibility with the existing schema and identify any necessary adjustments.
2. Set up a single-node YugabyteDB instance for initial development and testing.
3. Migrate existing data from the current database solution to YugabyteDB.
4. Update the application code to work with YugabyteDB.
5. Perform thorough testing to ensure stability and performance meet expectations.

## Positive Consequences

- Single-node setup with the potential for growth
- Compatibility with the existing schema
- Support for a wide range of data types
- Externally consistent transaction levels

## Negative Consequences

- Potential new problems and challenges associated with adopting a new database solution
- Possible learning curve for the team in working with YugabyteDB
- Cannot do online primary key upgrades.

## Option graveyard

1. **PostgreSQL**: While a popular and powerful database solution, it may not offer the desired single-node setup with growth potential.
2. **CockroachDB**: The current implementation has been problematic due to its 3-node distributed configuration in Kubernetes.
3. **SQLite on FoundationDB**: Limited data types and compatibility issues with the existing schema make this option less desirable.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, the choice of database solution is a core aspect of the project and cannot be easily worked around with a script.

## Is there a reason why this should be core and done by us?

Yes, selecting the appropriate database solution is crucial for the success and stability of V-Sekai. It directly impacts the performance, scalability, and maintainability of the platform.

## References

- [V-Sekai](https://v-sekai.org/)
- [YugabyteDB Data Types](https://docs.yugabyte.com/stable/api/ysql/datatypes/)
- [Cockroach Labs](https://www.cockroachlabs.com/)
- [MVSQLite: Distributed MVCC SQLite that runs on FoundationDB](https://forums.foundationdb.org/t/mvsqlite-distributed-mvcc-sqlite-that-runs-on-foundationdb/3493)
- [PostgreSQL](https://www.postgresql.org/)
