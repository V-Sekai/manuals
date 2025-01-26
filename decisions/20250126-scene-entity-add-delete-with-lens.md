# Proposed: Scene entity add & delete with lens

## What is the context of the proposal?

V-Sekai needs a lens-based system for adding, deleting, and managing scene entities in VR environments. It aims to enhance asset creation workflows, offering improved collaboration and metadata visibility.

## What is the problem being solved?

We need a more intuitive, integrated approach to place, select, remove, and inspect scene objects. Current methods lack interactive feedback, real-time previews, or a user-friendly lens for metadata.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams.

Below is a snippet illustrating scene entity creation, selection, and lens-based metadata:

```
{
    "scene_entities": [
        {
            "asset": "SomeAssetName",
            "placement_method": "raycast_click",
            "outline": {
                "indices": 3
            },
            "metadata": {
                "creator_id": "user123",
                "score": 10,
            }
        },
        {
            "asset": "AnotherAsset",
            "placement_method": "default_location",
            "outline": {
                "indices": 4
            },
            "metadata": {
                "creator_id": "user456",
                "score": 5,
            }
        }
    ],
    "lens_interaction": {
        "show_creator": true,
        "show_score": true,
        "actions": ["upvote", "hide", "save_to_inventory", "raise_concern"],
    },
    "decay_system": {
        "enabled": true,
        "decay_threshold_days": 30,
        "repair_action": "upvote"
    }
}
```

## Multiplayer Sync

Multiplayer sync between different Godot editors is required but is described in a different proposal.

## What are the benefits of the proposal?

• Streamlined object placement and removal  
• Improved collaboration with lens-based metadata  
• Potential for interactive previews and user scoring

## What are the downsides of the proposal?

• Added complexity for new contributors  
• Requires careful UI design to avoid clutter  
• Potential performance overhead for large scenes

## What are the alternative proposals?

• Rely on standard Godot editor workflows  
• Use no lens, only default selection tools  
• Integrate separate third-party VR creation plugins

## When might the proposed solution be used rarely or not at all?

• Simple scenes without collaboration or complex user interactions  
• Non-VR projects where lens-based interaction is unnecessary

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
3. [CESIUM_primitive_outline](https://cesium.com/docs/cesium-primitive-outline) CESIUM_primitive_outline extension indicates to a rendering engine that a list of triangle edges should be outlined. While it does not dictate how the rendering should be done, the fact that all of the lines are actually edges of triangles allows the rendering engine to use a higher quality – and faster – technique for rendering the lines, without needing to deduce the suitability of such a technique at runtime)
