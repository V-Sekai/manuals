# Networked Physics in Virtual Reality: V-Sekai's Chair Edition with Avatar Interaction

This article is a detailed account of the journey to develop a networked physics sample for Virtual Reality (VR), sponsored by Oculus. The source code developed was published under a permissive open source license, BSD. In this edition, we have added the ability for avatars to interact with the chairs, including sitting on them.

## Initial Concept

The initial idea was to create a table where four players could interact with physically simulated **chairs** instead of cubes. After experimenting with Unity and C#, it was found that scaling up the chairs to around a meter cubed made the VR experience more interesting. We also wanted to ensure that the avatars could sit on these chairs, adding another layer of interaction.

## Defining Success Criteria

The success criteria were defined as follows:

1. Players should be able to pick up, throw and catch chairs without latency.
2. Players should be able to stack chairs, and these stacks should be stable and without visible jitter.
3. When chairs thrown by any player interact with the simulation, these interactions should be without latency.
4. Avatars should be able to sit on the chairs.

## Implementing Avatar-Chair Interaction

To allow avatars to sit on the chairs, we implemented a new interaction model. When an avatar approaches a chair, they can choose to "sit" on it. This triggers an animation of the avatar sitting, and the avatar's position is adjusted to match the chair's position. The avatar remains seated until they choose to "stand up", at which point they return to their normal standing position.

## Conclusion

High quality networked physics with stable stacks of chairs is possible with Unity and PhysX using a distributed simulation network model. This approach is best used for cooperative experiences only, as it does not provide the security of a server-authoritative network model with dedicated servers and client-side prediction. With the addition of avatar-chair interaction, we have added another layer of immersion to the VR experience.

The source code for the networked physics sample can be downloaded [here](https://github.com/OculusVR/oculus-networked-physics-sample).

**Note:** This article is based on the work of Glenn Fiedler but has been adapted by V-Sekai to use chairs instead of cubes and to allow avatars to sit on the chairs.
