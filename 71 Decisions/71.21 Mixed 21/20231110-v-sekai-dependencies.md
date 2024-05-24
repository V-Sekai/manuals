# Accepted: V-Sekai dependencies

## Metadata

- Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->
- Deciders: V-Sekai
- Tags: V-Sekai

## The Backdrop

V-Sekai is a rapidly evolving platform with a diverse set of requirements. As the platform grows, so does the need for robust and scalable technologies to support its development.

## The Challenge

The challenge lies in selecting and integrating the right technologies that can cater to V-Sekai's unique needs while ensuring scalability, performance, and reliability.

## The Strategy

### Elixir

Elixir is a dynamic, functional language designed for building scalable and maintainable applications. It leverages the Erlang VM, known for running low-latency, distributed and fault-tolerant systems.

```elixir
defmodule Hello do
 def world do
   IO.puts("Hello, World!")
 end
end
```

### CockroachDB

CockroachDB is a cloud-native SQL database for building global, scalable cloud services that survive disasters. It's a distributed SQL database built on a transactional and strongly-consistent key-value store.

```sql
CREATE DATABASE bank;
USE bank;
CREATE TABLE accounts (id INT PRIMARY KEY, balance DECIMAL);
INSERT INTO accounts VALUES (1, 1000.50);
```

### Proposed: SeaweedFS

SeaweedFS is a simple and highly scalable distributed file system. It focuses on two objectives: storing billions of files, and serving them fast! SeaweedFS implements an object store with O(1) disk seek and an optional Filer with POSIX interface.

```bash
weed master
weed volume -dir="/tmp/1" -mserver="localhost:9333" -port=8080
curl -F file=@/path/to/file http://localhost:9333/dir/assign
```

Each of these technologies has its own use cases and can be used in combination depending on the requirements of your project.

## The Upside

The proposed strategy allows for a scalable, robust, and efficient system that can handle V-Sekai's growing needs. It also provides a solid foundation for future development and expansion.

## The Downside

The downside is the potential complexity of managing multiple technologies and ensuring they work seamlessly together. However, with proper documentation and best practices, this can be mitigated.

## The Road Not Taken

Other technologies could have been considered, but the chosen ones provide the best balance between performance, scalability, and reliability for V-Sekai's specific needs.

## The Infrequent Use Case

While the proposed technologies are well-suited for most use cases, there may be infrequent scenarios where additional solutions might be needed. These should be evaluated on a case-by-case basis.

## In Core and Done by Us?

The integration and management of these technologies will be handled by the V-Sekai team, ensuring that they align with our core values and objectives.

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine

This article was assisted by AI.
