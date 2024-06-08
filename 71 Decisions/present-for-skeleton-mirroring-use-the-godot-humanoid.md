# Proposal: Use the Humanoid Profile for Character Motion Mirroring

## Context

Daniel Snd was looking for a simple way to mirror right-sided walking keyframes on a character avatar motion.

## Problem Statement

Daniel Snd did not utilize the Godot Engine humanoid profile.

## Solution Description

The solution is to use the Godot Engine humanoid profile.

### Why use the humanoid profile?

In Godot Engine, the animation humanoid profile is essential for managing bone rolls in incoming humanoid skeletons. This is because these skeletons often have arbitrary bone rolls that need to be standardized for consistent animation behavior.

#### Bone Rolls

Bone roll refers to the rotation around the bone's longitudinal axis. In 3D modeling and animation, it's important to correctly set up bone rolls as they determine the axes of rotation for the bones during animation.

#### Godot Humanoid Profile Bone Rule

The SkeletonProfileHumanoid in Godot 4.0 adopts a practical rule for managing bone rolls:

1. The +Y axis should point from the parent joint to the child joint. This is considered as the roll axis.
2. The +X rotation should bend the joints towards the body's inside (almost the direction of muscle contraction).

#### Godot Humanoid Profile Motion Mirroring Correction

If you mirror animations, the bone rolls and names may need to be corrected. This is because the orientation of the bones can get flipped during the mirroring process. The Godot Humanoid Profile applies a Bone Rule to the bone rolls.

#### Godot Humanoid Profile Bone Names

The Godot Humanoid Profile standardizes the bone names consistently, it allows one to reuse animations across different characters. For example, if one has a walking animation for one character and one wants to apply it to another character, having the same bone names will allow one to do this without any additional work.

#### Godot Silhouette Any Pose to T-Pose Conversion

In 3D animation, the T-Pose is a standard pose where the character stands upright with their arms extended straight out to the sides. This pose is often used as the default pose for rigging and animating characters because it provides a clear view of all parts of the character. However, not all models are initially in a T-Pose. If you have a model in any other pose (let's say it’s an A-Pose), you might need to convert it to a T-Pose before you can use it effectively in Godot.

### Why Use the Godot Humanoid Profile?

The engine can ensure that all humanoid animations behave consistently, regardless of the original orientation or roll of the bones in the imported skeleton by following the Bone Rule. This makes it easier to create and manage humanoid animations, especially when working with different humanoids that may have been rigged differently.

## Benefits

Using the Godot Humanoid Profile will allow for consistent behavior across all humanoid animations, making it easier to create and manage these animations. It also allows for reusability of animations across different characters, saving time and effort in animation creation.

## Downsides

There may be a learning curve associated with understanding and implementing the Godot Humanoid Profile. Additionally, this solution assumes that all incoming humanoid skeletons will be compatible with the Godot Humanoid Profile, which may not always be the case.

## The Road Not Taken

An alternative could have been to manually adjust the bone rolls and names for each individual animation. However, this would be a time-consuming process and would not guarantee consistent results across different animations.

## The Infrequent Use Case

This proposal may not be beneficial for non-humanoid animations or for projects that do not require motion mirroring.

## In Core and Done by Us

This proposal involves using an existing feature of the Godot Engine the V-Sekai team implemented in Godot Engine 4.0, so no additional development work would be required from our team.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [Fire](https://github.com/sponsors/fire)

AI assistant Aria assisted with this article.

## Mirroring script

```gdscript
# SPDX-License-Identifier: CC0-1.0
#
# Author: Daniel Snd

@export var left_name:String = "Left"
@export var right_name:String = "Right"

func do_mirror():
    var parenteless_ids :PackedInt32Array = get_parentless_bones()
    for p in get_parentless_bones():
        attempt_mirror_recursive(p)

func attempt_mirror_recursive(bone_id:int):
    for i in get_bone_children(bone_id):
        var bone_name = get_bone_name(i)
        if bone_name.contains(right_name):
            mirror_pose(bone_name)
        elif bone_name.contains(left_name):
            pass
        else:
            mirror_single_bone(i)
        attempt_mirror_recursive(i)

func mirror_single_bone(bone_idx):
    var mirrored_rot = get_bone_pose(bone_idx).basis.get_rotation_quaternion()
    mirrored_rot.x *= -1
    mirrored_rot.w *= -1
    set_bone_pose_rotation(bone_idx, mirrored_rot)

# Function to mirror pose
func mirror_pose(bone_name):
    var bone_idx = find_bone(bone_name)
    if bone_idx == -1:
        print("Bone does not exist in Skeleton")
        return

    var mirrored_bone_idx = find_bone(bone_name.replace(right_name, left_name) if bone_name.contains(right_name) else bone_name.replace(left_name, right_name))
    if mirrored_bone_idx == -1:
        print("Mirrored bone does not exist in Skeleton")
        return

    var tr :Transform3D = get_bone_pose(bone_idx)
    var opposite_tr :Transform3D = get_bone_pose(mirrored_bone_idx)
    var mirrored_rot = tr.basis.get_rotation_quaternion()
    mirrored_rot.x *= -1
    mirrored_rot.w *= -1

    var opposite_mirrored_rot = opposite_tr.basis.get_rotation_quaternion()
    opposite_mirrored_rot.x *= -1
    opposite_mirrored_rot.w *= -1

    set_bone_pose_rotation(mirrored_bone_idx, mirrored_rot)
    set_bone_pose_rotation(bone_idx, opposite_mirrored_rot)
```
