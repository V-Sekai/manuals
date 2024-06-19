# Proposed: Use embedding search with Godot Engine projects

## Metadata

- Status: proposed
- Deciders: V-Sekai
- Tags: V-Sekai

## The Backdrop

The Godot Engine is a powerful tool for creating games and other interactive content. However, finding specific pieces of code or resources within a large project can be challenging. This is where an embedding search engine like SeaGOAT can come in handy.

## The Challenge

The challenge lies in integrating the SeaGOAT search engine with Godot Engine projects. Specifically, we need to ensure that it can effectively index and search `.tscn`, `.tres`, `.gd`, `.cpp`, `.h`, and `.xml` files, which are commonly used in Godot projects.

## The Strategy

To use SeaGOAT with Godot Engine projects, you'll need to add support for `.tscn`, `.tres`, `.gd`, `.cpp`, `.h`, and `.xml` files. You can do this by modifying the `common.py` file in the SeaGOAT repository. Specifically, you'll want to add these extensions to the `FILE_EXTENSIONS` list:

```python
FILE_EXTENSIONS = [
    # existing extensions...
    ".tscn",
    ".tres",
    ".gd",
    ".cpp",
    ".h",
    ".xml"
]
```

Once you've done this, SeaGOAT should be able to index and search your Godot Engine projects.

## The Upside

By integrating SeaGOAT with your Godot Engine projects, you'll be able to quickly and easily find specific pieces of code or resources. This can greatly speed up your development process and make it easier to manage large projects.

## The Downside

The downside is that this requires modifying the SeaGOAT source code, which may not be ideal if you're not comfortable with Python or if you want to keep your SeaGOAT installation up-to-date with the official repository.

## The Road Not Taken

An alternative approach would be to use a different search engine that already supports `.tscn`, `.tres`, `.gd`, `.cpp`, `.h`, and `.xml` files. However, this may not provide the same level of functionality as SeaGOAT.

## The Infrequent Use Case

This strategy is most useful for large Godot Engine projects where finding specific pieces of code or resources can be challenging. For smaller projects, the built-in search functionality in Godot may be sufficient.

## In Core and Done by Us?

This modification would need to be done by us, as it involves changing the SeaGOAT source code. It's not clear whether this change would be accepted into the core SeaGOAT project.

## Further Reading

- [V-Sekai](https://v-sekai.org/)
- [SeaGOAT](https://github.com/kantord/SeaGOAT)
- This article is assisted by AI.
