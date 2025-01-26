# Proposed: Scene entity add & delete with overlay

## What is the context of the proposal?

V-Sekai needs an overlay-based system to add, delete, and manage scene entities in VR environments. It aims to enhance asset creation workflows and offer improved collaboration and metadata visibility.

## What is the problem being solved?

We need a more intuitive, integrated approach to placing, selecting, removing, and inspecting scene objects. Current methods lack interactive feedback, real-time previews, or a user-friendly overlay for metadata.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams.

Instead of a lens, we generate an overlay using the primitive outline. The multi tool like Half-Life: Alyx tool’s interface surfaces entity details as a holographic overlay. Contributors can “grip” to add objects, “trigger” to open extended metadata, or “joystick” to vote.

```json
{
  "scene_entities": [
    {
      "asset": "SomeAssetName",
      "placement_method": "raycast_click",
      "metadata": {
        "creator_id": "user123",
        "score": ["user789", "user456"]
      }
    },
    {
      "asset": "AnotherAsset",
      "placement_method": "default_location",
      "metadata": {
        "creator_id": "user456",
        "score": []
      }
    }
  ],
  "overlay_interaction": {
    "show_creator": true,
    "show_score": true,
    "actions": [
      "grip_add",
      "trigger_metadata",
      "joystick_vote",
      "joystick_hide",
      "joystick_save_to_inventory",
      "joystick_raise_concern",
      "joystick_delete"
    ]
  },
  "decay_system": {
    "enabled": true,
    "decay_threshold_days": 30,
    "repair_action": "upvote"
  }
}
```

Scene entity adds & deletes with the overlay also requires 20250126-primitive-outline and 20250126-multiplayer-sync-between-godot-instance.

## What are the benefits of the proposal?

The proposal offers streamlined object placement and removal, improved collaboration through overlay-based metadata, and the potential for interactive previews and user scoring.

## What are the downsides of the proposal?

It introduces added complexity for new contributors, requires careful UI design to avoid clutter, and may result in potential performance overhead for large scenes.

## What are the alternative proposals?

Alternatives include relying on standard Godot editor workflows, using no overlay and only default selection tools, and integrating separate third-party VR creation plugins.

## When might the proposed solution be used rarely or not at all?

• Simple scenes without collaboration or complex user interactions  
• Non-VR projects where overlay-based interaction is unnecessary

## Is this a V-Sekai core responsibility, and should it be done by us?

Yes. It aligns with social VR features and fosters community-driven content creation and sharing.

Nova really wanna see V-Sekai have insanely good UX since the more traditional UX isn't cutting it on any other XR social platform
There are fewer ones with multiplayer buildings like Resonite.

## What is the status of the proposal?

Status: Proposed

## Who is making decisions on the proposal?

- V-Sekai development team
- Lyuma
- Astral Druid
- Fire
- Nova

## What tags does the proposal have?

- V-Sekai

## List further reading references.

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)

## Control Schemes

### Mouse & Keyboard

- **Left-click**: Adds or selects entities.
- **Right-click**: Opens the context menu for metadata access.
- **Keyboard Shortcuts**:
  - **Delete Key**: Removes the selected entity.
  - **M Key**: Toggles metadata visibility.
  - **S Key**: Saves the current state.

### Steam Deck

- **Joystick**: Accesses radial menu for quick actions.
- **Grip Button**: Adds a selected entity.
- **Trigger Button**: Opens extended metadata for the selected entity.
- **A Button**: Deletes the selected entity.
- **B Button**: Saves the current inventory.
- **X Button**: Raises a concern about the entity.
- **Y Button**: Hides the overlay interface.
- **Touchpad Gestures**:
  - **Swipe**: Rotates entities.
  - **Pinch**: Scales entities.

### Quest 3

- **Joystick**: Accesses radial menu for quick actions.
- **Grab Gesture**: Adds or selects entities.
- **Trigger Press**: Opens extended metadata for the selected entity.
- **Grip Press**: Deletes the selected entity.
- **Thumbstick**: Navigates the overlay interface.
- **Side Buttons**:
  - **A Button**: Saves the current inventory.
  - **B Button**: Raises a concern about the entity.
- **Finger Gestures**:
  - **Swipe Up/Down**: Rotates entities.
  - **Pinch Open/Close**: Scales entities.

### Valve Index Controller

- **Joystick**: Accesses radial menu for quick actions.
- **Grab Gesture**: Adds or selects entities.
- **Trigger Press**: Opens extended metadata for the selected entity.
- **Grip Press**: Deletes the selected entity.
- **Thumbstick**: Navigates the overlay interface.
- **Side Buttons**:
  - **A Button**: Saves the current inventory.
  - **B Button**: Raises a concern about the entity.
- **Finger Gestures**:
  - **Swipe Up/Down**: Rotates entities.
  - **Pinch Open/Close**: Scales entities.
