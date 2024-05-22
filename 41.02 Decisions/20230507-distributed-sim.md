# Rejected: Distributed simulation

### Metadata

- Status: rejected <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,networking,

### Context and Problem Statement

Our project involves a distributed simulation system where maintaining strong consistency and efficient workload distribution are important requirements. We are currently facing the challenge of how to handle authority transfer and state updates between simulation servers without incurring high network hop counts and latency.

Someone invited me to a popular VR platform and gave me a 20-minute tour, just enough to learn how to in desktop mode create a world, import an object, and inspector-edit it. So I imported our celebration map, and the map loaded in 20 seconds. I was able to change its transform. I'm still thinking about that experience.

### Describe the proposed option and how it helps to overcome the problem or limitation

We propose to use a metadata system with Khepri instances and Raft consensus algorithm to manage ownership and mastership information for game entity nodes. Homeservers will manage metadata using their own Khepri instances within a Raft cluster, while simulation servers, including player simulation servers, will maintain game entity nodes they have authority over using their own Khepri instances.

Authority transfer will be initiated through the metadata Raft cluster when players interact with game entities governed by different simulation servers. The homeserver Khepri's nested path-to-value structure will be updated based on the ownership and mastership rules set by the Master. State updates will be exchanged between old and new authority simulation servers or synchronized using a separate mechanism during authority transfer.

By monitoring the load on homeservers and simulation servers, we can balance the system and ensure fault tolerance using Raft's mechanisms. As the number of game entity nodes and players grows, adding more homeservers to the metadata Raft cluster and more simulation servers will ensure efficient workload distribution and enhance the overall gaming experience.

We believe that this approach will provide strong consistency guarantees, access control, and scalability while minimizing network hop counts and latency for authority transfer and state updates between simulation servers.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

#### Glossary of terms

1. **Homeserver**: A server responsible for managing metadata, including ownership and mastership information for game entity nodes.
2. **Simulation server**: A server responsible for containing game entity nodes it has authority over, including player simulation servers.
3. **Khepri**: A tree-like replicated on-disk database library for Erlang and Elixir, used for maintaining a nested path-to-value store.
4. **Raft cluster**: A cluster of servers implementing the Raft consensus algorithm to ensure strong consistency and fault tolerance.
5. **Ownership**: The player who has control over a game entity and can change its state.
6. **Mastership**: The authority that can change ownership rules and default ownership settings.
7. **Ask, Deny, Allow**: Rules set by the Master for ownership transfer.

#### Protocols

- Each type of server can only be Khepri members of the same type.
- Each server can only allow be Khepri members of the same logical instance.
- Raft is only active inside of each logical instance.
- Homeserver servers are REST + JSON and the cheap pattern.
- Simulation servers are using the nasty state transfer pattern

#### Simulation server state transfer protocol

| Step | Action                                                                                                                                                                                                             |
| ---- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1    | Player A's simulation server sends a request to the home server to fetch the public key of Player B.                                                                                                               |
| 2    | The home server retrieves Player B's public key from its database and sends it back to Player A's simulation server.                                                                                               |
| 3    | Player A's simulation server uses Player B's public key to encrypt a message or binary data.                                                                                                                       |
| 4    | Player A's simulation server signs the encrypted message or binary data using its own private key.                                                                                                                 |
| 5    | Player A's simulation server sends the encrypted message or binary data along with the digital signature to Player B's simulation server using the membrane_udp_plugin.                                            |
| 6    | Player B's simulation server receives the message and verifies the digital signature using Player A's public key, which it retrieves from the home server.                                                         |
| 7    | If the signature is valid, Player B's simulation server uses its own private key to decrypt the message and obtain the original data sent by Player A's simulation server.                                         |
| 8    | If the message is confidential, Player B's simulation server may want to send a response back to Player A's simulation server using a similar protocol, with Player A's public key retrieved from the home server. |

This table outlines the steps of the communication protocol between Player A and Player B's simulation servers, which involves retrieving public keys from the home server's database, encrypting and signing messages, and verifying digital signatures to ensure the authenticity of the messages. This protocol ensures secure and confidential communication between the two simulation servers, allowing for safe and reliable data exchange.

```elixir
# EC examples
alice_private_jwk = JOSE.JWK.from_pem_file("ec-secp256r1-alice.pem")
alice_public_jwk  = JOSE.JWK.to_public(alice_private_jwk)
bob_private_jwk   = JOSE.JWK.from_pem_file("ec-secp256r1-bob.pem")
bob_public_jwk    = JOSE.JWK.to_public(bob_private_jwk)

## Encrypt and Decrypt (defaults to ECDH-ES with A128GCM)
### Alice sends Bob a secret message using Bob's public key and Alice's private key
alice_to_bob = "For Bob's eyes only."
encrypted = JOSE.JWK.box_encrypt(alice_to_bob, bob_public_jwk, alice_private_jwk)
### Only Bob can decrypt the message using his private key (Alice's public key is embedded in the JWE header)
{^alice_to_bob, _} = JOSE.JWK.box_decrypt(encrypted, bob_private_jwk)
```

#### Building a Scalable Distributed Simulation System with Khepri Instances and Raft Consensus Algorithm

In a distributed simulation system, maintaining separate roles for homeservers and simulation servers and using a metadata system with strong consistency guarantees is crucial. Homeservers are responsible for managing metadata, including ownership and mastership information for game entity nodes, using a Khepri instance within a Raft cluster. Simulation servers, including player simulation servers, maintain game entity nodes they have authority over using their own Khepri instances.

Authority transfer is initiated through the metadata Raft cluster when players interact with game entities governed by different simulation servers. The homeserver Khepri's nested path-to-value structure is updated based on the ownership and mastership rules set by the Master. State updates are exchanged between old and new authority simulation servers or synchronized using a separate mechanism during authority transfer.

Monitoring the load on homeservers and simulation servers allows for balancing the system and ensuring fault tolerance using Raft's mechanisms. As the number of game entity nodes and players grows, adding more homeservers to the metadata Raft cluster and more simulation servers ensures efficient workload distribution and enhances the overall gaming experience.

## Distributed simulation architecture

Case 1: Authority transfer from Player A to Player B on a different home server

| Step | Description                                                                                   | Hop Count |
| ---- | --------------------------------------------------------------------------------------------- | --------- |
| 1    | Player A's simulation server sends a request to its homeserver (1 hop).                       | 1         |
| 2    | Player A's homeserver sends an authority request to Player B's homeserver (H hops).           | H         |
| 3    | Player B's homeserver sends a response to Player A's homeserver (H hops).                     | H         |
| 4    | Player A's homeserver sends an authority response to Player A's simulation server (1 hop).    | 1         |
| 5    | Player A's simulation server sends an acknowledgment to Player B's simulation server (1 hop). | 1         |

Sending an acknowledgment from Player A's homeserver to Player A's simulation server may not be necessary, as the authority request can be sent directly to Player B's homeserver without waiting for confirmation.

Total hops: 3 + 2 \* H

Case 2: Authority transfer if Player A's and Player B's homeservers are exactly the same

| Step | Description                                                                                   | Hop Count |
| ---- | --------------------------------------------------------------------------------------------- | --------- |
| 1    | Player A's simulation server sends a request to its homeserver (1 hop).                       | 1         |
| 2    | Player A's homeserver sends a response directly to Player B's simulation server (1 hop).      | 1         |
| 3    | Player B's simulation server sends an acknowledgment to Player A's simulation server (1 hop). | 1         |

Total hops: 3

In this optimized process, we have removed sending an acknowledgment from Player A's homeserver to Player A's simulation server. This acknowledgment may not be necessary, as the response can be sent directly to Player B's simulation server without waiting for confirmation. By removing this step, we reduce the total hop count by 1, potentially improving the efficiency of the authority transfer process when both players are on the same home server.

Case 3: Direct communication between Player A and Player B's simulation servers on the same home server.

| Step | Description                                                                                                                                                         | Hop Count |
| ---- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------- |
| 1    | Player A's simulation server sends an update directly to Player B's simulation server using a hand-optimized binary layout and an asynchronous communication model. | 1         |
| 2    | Player B's simulation server sends an acknowledgment to Player A's simulation server using credit-based flow control or another asynchronous technique.             | 1         |

In this modified version of Case 3, both the update and acknowledgment steps employ the high-performance communication system's features. This includes using hand-optimized binary layouts for data transfer and asynchronous communication techniques to minimize latency and maximize throughput. The total hop count remains the same at 2 hops.

### Positive Consequences

- Strong consistency guarantees
- Access control over Khepri instances
- Scalability
- Minimized network hop counts and latency for authority transfer and state updates

### Negative Consequences

1. **Complexity**: The proposed system involves multiple components, such as homeservers, simulation servers, Khepri instances, and Raft clusters. Managing and maintaining these components can be complex and may require significant development effort.

2. **Performance**: The use of Raft consensus algorithm ensures strong consistency but may introduce performance overhead due to the need for communication between nodes in the cluster. This could impact the overall performance of the distributed simulation system.

3. **Scalability**: While the proposal aims to provide scalability, it is not clear how well the system will scale as the number of game entity nodes and players grows. Adding more homeservers and simulation servers might help, but there could still be bottlenecks or limitations that need to be addressed.

4. **Security**: The proposed state transfer protocol relies on public key cryptography for secure communication between simulation servers. However, the security of the system depends on proper key management and protection against potential attacks, such as man-in-the-middle attacks or replay attacks.

5. **Fault tolerance**: Although the Raft consensus algorithm provides fault tolerance, the system's resilience to failures (e.g., server crashes, network issues) needs to be carefully considered and tested to ensure smooth operation under various conditions.

6. **Synchronization**: The proposal mentions that state updates are exchanged between old and new authority simulation servers or synchronized using a separate mechanism during authority transfer. However, it does not provide details on how this synchronization process works, which could be a critical aspect of the system's functionality.

7. **Load balancing**: Monitoring the load on homeservers and simulation servers is essential for balancing the system. However, the proposal does not provide specific details on how load balancing will be achieved or what metrics will be used to determine when to add or remove servers from the system.

### Option graveyard

We considered using a client-server model for the distributed simulation system but found that it would not provide the strong consistency guarantees and access control we require, and it would also be more difficult to scale as the number of game entity nodes and players grows.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

This is not a few lines of script.

### Is there a reason why this should be core and done by us?

I am exploring alternatives for the current implementation of the client-server model.

### References

- V-Sekai: https://v-sekai.org/
- Khepri documentation: https://github.com/rabbitmq/khepri
- Raft consensus algorithm: https://raft.github.io/
- Networked Physics in Virtual Reality: https://gafferongames.com/post/networked_physics_in_virtual_reality/
- Chapter 7 - Advanced Architecture using ZeroMQ: https://zguide.zeromq.org/docs/chapter7/
