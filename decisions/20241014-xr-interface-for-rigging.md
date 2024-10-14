# Proposed: Editing Character Body Bone Constraints in Immersive Mode

## The Context

V-Sekai is a social VR community.

## The Problem Statement

We aim to develop a prototype interface for editing bone constraints such as position, rotation, twist rotation, and swing rotation on character body bones within an immersive environment.

Interactivity makes a difference, similar to the feeling of presence and being fully engaged with the editor. This greater flow state occurs because you don't have to switch contexts, allowing for continuous interaction and focus.

## Proposal Description

### Interactive Design Concept

The proposed system will allow users to interact directly with avatar bone structures in a 3D space, manipulating constraints through intuitive gestures and tools. This approach aims to enhance user engagement and precision in modifying avatars.

### Implementation Strategy

1. **Visual Representation of Bones**:

   - Each bone will be represented by a dot that becomes visible and enlarges when the user's hand or controller approaches it, facilitating easy selection.

2. **Avoiding Selection Mechanism**:

   - Instead of using a traditional selection mechanism, the system will employ proximity-based interaction. When a user's hand or controller is near a bone, the relevant constraints automatically appear, allowing immediate manipulation without the need for explicit selection. This reduces complexity and enhances flow in the immersive environment.

3. **Constraint Manipulation Tools**:

   - A virtual tool palette will be available to the user, containing different constraint modifiers.
   - Users can grab these tools and attach them to bones to adjust constraints like angles and rotations.

4. **Tool Switcher Interface**:

   - In addition to the tool palette, a tool switcher mechanism will be implemented allowing users to quickly switch between tools without returning to the palette. This could be activated via a gesture or a button press, bringing up a radial or linear menu to select the desired tool.

5. **Intuitive Constraint Adjustment**:

   - For position constraints, a 3D gizmo will appear, allowing users to manipulate the position directly within the VR space.
   - For rotational constraints, a 3D gizmo will appear, allowing users to manipulate the angle directly within the VR space.
   - Twist constraints will be adjusted using a 2d disk arc interface where permissible rotation areas are defined by the user.
   - Swing constraints can be adjusted using a spherical interface where permissible rotation areas are defined by the user.
   - Swing constraints can be adjusted using a 2d orbit map interface where permissible rotation areas are defined by the user.

6. **Feedback and Precision**:

   - Visual and haptic feedback will be provided to ensure users are aware of the changes they are making.
   - Precision tools and snapping features will help in making exact adjustments.

7. **Deselection and Context Switching**:
   - Moving the controller away from the bones or performing a specific gesture will clear the current interaction, allowing for a smooth workflow without accidental adjustments.

### Mock-up Diagram

```plaintext
[User Interface Mock-up]
+------------------------------------------------+
|                                                |
|  [Avatar]                                      |
|    * (Head)                                    |
|    * (Shoulder)                                |
|    * (Elbow) <-- [Interacting]                 |
|    * (Wrist)                                   |
|                                                |
|  [Tool Palette]                                |
|    - Rotate Tool                               |
|    - Swing Tool                                |
|    - Twist Tool                                |
|                                                |
|  [Tool Switcher]                               |
|    - Quick Switch Gesture                      |
|    - Radial Menu for Tool Selection            |
|                                                |
+------------------------------------------------+
```

## Benefits

- **Enhanced User Experience**: Direct manipulation of bones and constraints in VR enhances the intuitiveness and enjoyment of avatar customization.
- **Increased Precision**: Fine control over adjustments leads to more accurate and satisfying results.
- **Seamless Workflow**: Integration of tools and interactions within the VR environment reduces the cognitive load and context switching, fostering a more creative and productive user experience.

## Downsides

- **Complexity in Implementation**: Developing a fully interactive 3D UI with precise control mechanisms can be challenging and time-consuming.
- **Performance Concerns**: High fidelity models and real-time updates in VR may lead to performance issues on lower-end systems.

## The Road Not Taken

- **2D GUI for Constraint Management**: Using a traditional 2D interface for constraint management was considered but rejected due to the lack of immersion and intuitiveness in a VR context.

Scale will be implemented for use matching clothing with the character body.

Constraint weight can be used to adjust the strength of the constraint.

## In Core and Done by Us

This feature is core to the V-Sekai project's mission of enhancing VR interaction and will be developed internally to maintain control over quality and integration.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team
- Fire
- Nova

## Tags

- V-Sekai, interactive presence, unfolding complexity, avatar dots, maximum precision, angle constraints, twist constraint, sphere visualization, constraint palette, tool shadow, localized selection, proprioceptive action, switcher interface, tool palette, deselection method, user flow

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
