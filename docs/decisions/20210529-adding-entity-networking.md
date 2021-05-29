# Adding Entity Networking to Groups

## Context and Problem Statement

For Groups this system aims to solve the following issues:

- **(A)** Need a way to standardize scene spawning.
- **(B)** Need a way to refer to nodes / instances that is consistent across clients (for example "Set parent to ...").
- **(C)** Need a way to synchronize state between clients.
- **(D)** Provides a basic set of standard protocols and interactions.
- **(E)** Provides the basis for a security / privacy model regarding entity communication/permissionws over the network.
- **(F)** Provides a security model locally for access between nodes of one entity, and nodes of another entity (assuming a secure scripting framework is implemented).
- **(G)** This also solves the problem of abstracting away implementation details of entities, for example there should be no need to deal with *godot nodes* on an individual basis.
- **(H)** Provide a unified way to create toplevel physics hierarchies isolated from other game logic.

Note: This proposal covers three **Spawn Types**:

- Spawn type **(i)** Entities integrated into a map;
- Spawn type **(ii)** map entities spawned by clients; and
- Spawn type **(iii)** avatar entities/props spawned by clients.)

## Describe the proposed option and how it helps to overcome the problem or limitation

As indicated in point (G), everything documented here relates Scenes and Entites. Aside from the Entity script being attached to the root node of a scene(?), and the scene itself being a node. Additionally, it may be necessary to query a node to find its containing Entity (parent node).
Note: Interaction between nodes *within* a single entity are considered an implementation detail of that entity, and is out of scope of the entity system. Any security model assumes that nodes cannot be transfered, shared or reparented between entities.

Entities are objects known to the server, and with explicit handling for state synchronization.

Some entities may choose to sychronize little state, or position only, or no state at all.
Also, some entities may choose to provide no security or isolation, while others may be private and appear not to even exist to other nodes. For example, a local player menu built upon the Entity System's interaction features, gaining features A, D, F and G.
By building this common framework, it means that systems built as Entities can be trivially synchronized over the network.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

TODO: We may want a way to optimistically spawn an entity client-side to achieve maximal responsiveness and fun.

However, these entities will not yet know their server-side entity ID. Proposals: Reserve portion of ID space; or locally hold onto events/state and flush once ID is known.

### A. Spawning

There will be a global directory of spawnable objects as part of a server connection.
Players and maps can reference scenes by some name to spawn an entity with that name

### B. Consistent References

Entities will have a server-assigned ID.
TODO: What to do if an entity is spawned locally, and an ID is not yet known.

### C. State Synchronization

Entities will define a set of state variables which must be synced.
The network protocol will take care of updating state gradually over time, as well as rate limiting.
Events can be used to provide forced updates.
Guarantees? Exposing metadata about when state was updated?

**Entity properties:**

- State that is synced are properties.
- Some properties are only assignable at spawn time (for example, scene file?)
- Some properties such as transform may require special handling.

Update intervals:  

Entity refreshing / full state synchronization & serialization: 

Delta encoding & ACK protocol:  

When to use reliable events vs. "unreliable" (eventual) state synchronization: Events as a means for state synchronization.

### D. Standard Interaction Protocols

TODO: What classes / bespoke types exist?
Examples: Physics, Physics Pickup; Button; Movable Platform; Vehicle

### E. Network Security Model:

**Concepts:**

**Ownership:**

All entities will be owned by the player which interacts with them, or by the server.  
Entity ownership will be transfered if the current owner leaves.

**Mastership:**

Map entities may largely be mastered by a dedicated server.  

Avatar entities and props will be mastered by the player that spawned them, even if another player owns it.  

(Example: Alice personally spawns a ball avatar prop and throws it to Bob, who catches it. Alice has Mastership; Bob has Ownership.)  
Mastership may be transfered on map exit; or they may be despawned (the player "takes" their props with them.)

Privacy: Entities may reveal very little state to the network. Are there cases where different players may be given different permissions?  

Example: Cooperative game, in which state is shared between some players but not others.  

Example: Team Melee

### F. Inter-entity Isolation

Script-level guarantees that information about other entities is either restricted or absent entirely.  
May require a custom scripting language to fully achieve these guarantees.

### G. Abstraction

Not much to say here. We should see as little as possible built on top of pure Godot Nodes, except as a means for providing the entity's functions.

### H. Physics
Entities will not be allowed to contain physics objects within the node hierarchy. Instead, physics objects must be *attached* to the entity in specific ways.  
Questions: how does this work with PhysicalBone; how are physics objects linked to the entity; what about animations? (scale, rotation, skeleton attachments driving physical bodies?)

### Spawn Type (i). Map builtins

Maps will have entities which might not be spawnable, but will be automatically created and referenced within the parent scene.  
For example, a button/door; or a state "god object"; or physics objects; built-in TV screens.

### Spawn Type (ii). Map spawns

Maps will provide a directory of map-spawnable scene references which can be instantiated in response to events.  
These will usually have specific functions within a particular map.  
Examples: Game-specific weapons; Keys; Buildings constructed

### Spawn Type (iii). Avatar spawns

Playwers may also provide a directory of avatar-spawnable scenes; Additionally a prop database may exist or be negotiated.  
These may include local UIs; weapons; pencils; media players; pets (parrots, mounts); vehicles; flight mechanics (wings?); visual effects.

### Notes about Entity parenting:

NodePath references (../) out of an entity hierarcy must be disalkowed.
Parenting should be implemented carefully: If nodes are literally parented to another entity (e.g. vehicles), NodePath references could expose implementation details from one entity to another entity.

Part of a solution to this is to provide Attachment points as a feature of an Entity, but this needs to be implemented carefully to prevent unusual situations, for example: parent entity/node is destroyed (`queue_free()`) or removed from the scene tree (`remove_child()`); or animation paths referencing a node of the child entity.

## Positive Consequences List <!-- optional -->

## Negative Consequences List <!-- optional -->
  
## Option Graveyard List <!-- optional -->

* Option: 
* Rejection Reason: 

## If this enhancement will not be used often, can it be worked around with a few lines of script?

## Is there a reason why this should be core and done by us?

Yes, this is the foundation of the protocol and the basic set of nodes and behavior upon which content will be created.

## Links <!-- optional -->

Aldridge, David. "I Shot You First: networking the Gameplay of Halo: Reach". GDC 2011. https://www.youtube.com/watch?v=h47zZrqjgLc

Fiedler, Glenn. "Networking for Physics Programmers". GDC 2015. https://www.youtube.com/watch?v=Z9X4lysFr64

Fiedler, Glenn. "Networked Physics in Virtual Reality". 2018-02-22. https://www.gafferongames.com/post/networked_physics_in_virtual_reality/

Rouwe, Jorrit. "Killzone Shadow Fall: Threading the Entity Update on PS4". GDCEU 2014. https://archive.org/details/GDCEU2014Rouwe

Saracen, text and voice discussions on Discord: search Discord for "entity networking" and "networking model"
