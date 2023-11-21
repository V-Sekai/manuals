# Networked Physics in Virtual Reality

This article is a detailed account of the author's journey to develop a networked physics sample for Virtual Reality (VR), sponsored by Oculus. The source code developed was published under a permissive open source license, BSD.

## Initial Concept

The initial idea was to create a table where four players could interact with physically simulated cubes. However, after experimenting with Unity and C#, the author found that scaling up the cubes to around a meter cubed made the VR experience more interesting.

## Defining Success Criteria

The success criteria were defined as follows:

1. Players should be able to pick up, throw and catch cubes without latency.
2. Players should be able to stack cubes, and these stacks should be stable and without visible jitter.
3. When cubes thrown by any player interact with the simulation, these interactions should be without latency.

## Choosing a Network Model

Three main network models were considered:

1. Deterministic lockstep
2. Client/server with client-side prediction
3. Distributed simulation with authority scheme

The author chose a distributed simulation model where players take over authority of cubes they interact with. This decision was based on the non-deterministic nature of the Unity physics engine (PhysX) and the need to hide latency.

## Implementing Authority and Ownership

Each cube would have an authority, set to default or to the player that last interacted with it. If another player interacted with an object, authority would switch to that player. Ownership was different - once a cube is owned by a player, no other player could take ownership until that player relinquished ownership.

## Synchronizing Physics

The author proved that state synchronization works with Unity and PhysX by setting up a loopback scene in Unity where cubes fall into a pile in front of the player. The state of each cube was captured and applied to the right side (non-authority) 10 times per-second, keeping the left and right simulations in sync.

## Optimizing Bandwidth

Several techniques were used to optimize bandwidth:

1. Encoding the state for at rest cubes more efficiently.
2. Using lossy techniques such as reducing the precision of the physics state sent over the network.
3. Quantizing the state on both sides.
4. Sending only a subset of cubes in each packet.
5. Implementing delta compression.

## Implementing Interaction with Touch Controllers

The author implemented interaction with the simulation via touch controllers. The position and orientation of the avatar components were captured along with the rest of the physics state, and applied to the avatar components in the remote view.

## Handling Multiple Players

The host player acts as the arbiter, deciding which updates to accept and which to ignore. Two sequence numbers per-cube (authority sequence and ownership sequence) were used to determine if an update should be accepted.

## Conclusion

High quality networked physics with stable stacks of cubes is possible with Unity and PhysX using a distributed simulation network model. This approach is best used for cooperative experiences only, as it does not provide the security of a server-authoritative network model with dedicated servers and client-side prediction.

The source code for the networked physics sample can be downloaded [here](https://github.com/OculusVR/oculus-networked-physics-sample).
