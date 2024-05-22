# Rejected: Merge Scene Tool for Godot Editor with FlatBuffer-based JSON Serialization

## Problem: Merging Scenes in Collaborative Projects

In collaborative projects, team members may edit the same scene in different ways. Version control systems (VCS) like Git can help manage these modifications through merging. However, merging scenes (TSCN format) can be challenging due to their complex semantics and potential for corruption.

## Solution: Integrate a Merge Scene Tool in Godot Editor

To prevent scene corruption after merging, the Godot Editor should provide a merge scene window that allows users to merge TSCN files. This tool should:

1. Detect Git merge conflict placeholders (`<<<<<<<`, `=======`, `>>>>>>>`)
2. Reconstruct local and remote scenes
3. Display a merged scene tree with actions to accept or discard changes, or choose between local and remote versions

The merge tool should be intelligent enough to detect node movements, renaming, and other complex scene semantics. It should also allow users to edit the merged scene before saving it.

### FlatBuffer-based JSON Serialization for Merge Tool State

To ensure efficient serialization of the internal state of the merge tool at the start, in between, and at the end, FlatBuffer-based JSON should be used. This will allow for faster processing and better performance while maintaining human-readability.

## Reason for Core Integration

While this feature could be implemented as an add-on, a merge tool is a common feature in modern IDEs and should be fully integrated into the Godot Editor for a seamless user experience.

# Alternative File Formats for Godot Scenes

## Problem: Limited Scene File Format Options

When working on a project related to Godot, such as game development or add-ons, you may encounter limitations with the current scene file formats:

- **escn**: For scenes created by external tools (e.g., importing from Blender)
- **scn**: Binary format, small but not very useful when collaborating on a project
- **tscn**: Textual format, INI/TOML-like syntax, human-readable, and encouraged for use

The TSCN format is proprietary and not widely used, leading to issues such as difficulty editing scenes outside of the Godot Editor and a lack of supporting tools like linters or syntax checkers.

## Solution: Support FlatBuffer-based JSON as an Alternative Human-Readable File Format

To overcome these limitations, it would be beneficial for Godot to support alternative human-readable file formats, such as FlatBuffer-based JSON. FlatBuffers provide a more efficient way to serialize and deserialize data compared to standard JSON while still being human-readable.

This feature should be part of the core engine to ensure official support and seamless integration.

Use the extension `FBJSCN`.
