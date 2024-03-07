## Proposal: Implement Ra in V-Sekai

### Context

V-Sekai, a VR social network, needs reliable state machines for data persistence. Current system may struggle with data consistency and failure recovery.

### Problem

User experience can be disrupted due to potential data inconsistencies and loss, leading to issues like lost interactions and inconsistent virtual states.

### Solution

Implement Ra, a Raft implementation by Team RabbitMQ, in any Erlang or Elixir project. Ra enables persistent, fault-tolerant, replicated state machines.

### Benefits

- **Fault Tolerance**: Ra ensures data consistency via leader election and log replication.
- **Efficiency**: Supports log compaction and snapshot installation.
- **Scalability**: Suitable for large-scale applications like V-Sekai.

### Downsides

- **Learning Curve**: Developers need to learn Ra and the Raft consensus algorithm.
- **Dependency**: Ra could increase project complexity.

### Alternatives

Other solutions like CRDTs were considered but have major shortcomings.

### Infrequent Use Case

In small distributed systems with rare failures, Ra's benefits may not be fully realized.

### Implementation

The V-Sekai team will implement Ra.

### Status

Proposed

### Decision Makers

- V-Sekai development team

### Tags

- V-Sekai
- Ra
- Erlang
- Elixir
- Distributed Systems

### Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)

Assisted by Aria, an AI assistant.
