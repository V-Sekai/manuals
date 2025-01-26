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
      "joystick_raise_concern"
      "joystick_delete",
    ]
  },
  "decay_system": {
    "enabled": true,
    "decay_threshold_days": 30,
    "repair_action": "upvote"
  }
}
```

Scene entity adds & delete with the overlay also requires 20250126-primitive-outline and 20250126-multiplayer-sync-between-godot-instance.

## What are the benefits of the proposal?

• Streamlined object placement and removal  
• Improved collaboration with overlay-based metadata  
• Potential for interactive previews and user scoring

## What are the downsides of the proposal?

• Added complexity for new contributors  
• Requires careful UI design to avoid clutter  
• Potential performance overhead for large scenes

## What are the alternative proposals?

• Rely on standard Godot editor workflows  
• Use no overlay, only default selection tools  
• Integrate separate third-party VR creation plugins

## When might the proposed solution be used rarely or not at all?

• Simple scenes without collaboration or complex user interactions  
• Non-VR projects where overlay-based interaction is unnecessary

## Is this a V-Sekai core responsibility, and should it be done by us?

Yes. It aligns with social VR features and fosters community-driven content creation and sharing.

## What is the status of the proposal?

Status: Proposed

## Who is making decisions on the proposal?

- V-Sekai development team
- Lyuma
- Astral Druid
- Fire

## What tags does the proposal have?

- V-Sekai

## List further reading references.

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)
