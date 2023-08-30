# Automation for Overcoming V-Sekai Limitations in World Generation

## Metadata

- **Status**: Proposed
- **Deciders**: V-Sekai, Fire
- **Tags**: V-Sekai

## The Backdrop

The current challenge faced is the inability to generate a hundred worlds in game development due to performance limitations. A solution involving automation is required to achieve this goal.

## The Challenge

The goal is to generate a hundred worlds in game development using generative techniques. However, the scalability and performance constraints of manual creation make this a significant challenge.

## The Strategy

To overcome these limitations, the proposed strategy involves creating a sidekick application using Elixir that executes Godot Engine commands as a mesh processor. This sidekick will automate various tasks involved in world generation. The sidekick will utilize JSON utilities and tabular formats like SQLite for data processing. Tasks that can be automated include improving 3D mesh, converting glTF files, uploading VRM to the CDN, generating collision hulls, placing objects in a scene, generating images using procedural math, and generating terrain.

## The Upside

By implementing this strategy, several benefits can be achieved:

- Automation enables the generation of a hundred worlds in game development, which would not be feasible with manual creation.
- Utilizing a sidekick application written in Elixir improves efficiency, saving time and effort.
- Integration with external libraries and tools expands the capabilities of V-Sekai, providing users with more options and flexibility.

## The Downside

There are some downsides to consider:

- Developing the sidekick application and integrating it with Godot Engine may require significant development effort.
- Comprehensive documentation is necessary to guide users on how to effectively use and combine these automated processes.
- Regular updates and maintenance will be required to ensure compatibility with future versions of V-Sekai, Elixir, and Godot Engine.

## The Road Not Taken

An alternative approach could involve developing new features within V-Sekai directly to address scalability and performance limitations. However, this may require significant resources and time, whereas automation using a sidekick application can be implemented relatively quickly.

## The Infrequent Use Case

Experienced users familiar with generative techniques and similar tools may not heavily rely on documentation for basic tasks. However, comprehensive documentation will still benefit them when it comes to advanced scenarios and novel features.

## In Core and Done by Us?

The implementation of this strategy falls within the core capabilities of V-Sekai and can be done internally. Collaboration between developers, technical writers, and user experience designers will be essential to ensure successful integration.

## Further Reading

- [V-Sekai](https://v-sekai.org/)
- This article is assisted by AI
