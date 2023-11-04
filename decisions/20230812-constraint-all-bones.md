# Proposed: Constrain the entire Godot Humanoid Skeleton

## Metadata

- **Status:** proposed
- **Deciders:** V-Sekai, fire
- **Tags:** V-Sekai

## The Backdrop

The current Godot humanoid skeleton system lacks proper constraints for all bones, specifically in terms of rotation swing and rotation twist limits. This has led to issues when trying to move parts of the skeleton such as the head or legs towards the torso.

## The Challenge

The challenge lies in implementing these constraints without causing other issues within the system. Some bones are not solved and should not be constrained, adding complexity to the task.

## The Strategy

The strategy is to carefully analyze each bone and determine the appropriate constraints. This will involve a combination of swing rotation and twist rotation constraints, depending on the specific bone.

## The Upside

By implementing these constraints, we can improve the functionality and reliability of the Godot humanoid skeleton system. This will allow for more realistic movements and prevent system errors when moving certain parts of the skeleton.

## The Downside

There may be potential challenges in implementing these constraints, particularly for the unsolved bones. It will require careful testing and adjustment to ensure that the new constraints do not introduce new issues.

## The Road Not Taken

An alternative would be to leave the system as it is, accepting its limitations. However, this would mean missing out on the potential improvements that could be achieved through this proposal.

## The Infrequent Use Case

In some rare cases, the lack of constraints might actually be beneficial, allowing for unusual or exaggerated movements. These cases will need to be considered and potentially addressed separately.

## In Core and Done by Us?

Yes, this change would be implemented in the core system by the V-Sekai team.

## Further Reading

- [V-Sekai](https://v-sekai.org/)
- This article is assisted by AI.