# Accepted: Enhancing Map Uploads

## Metadata

- Status: accepted
- Deciders: V-Sekai, fire, Scipi
- Tags: V-Sekai

## The Backdrop

V-Sekai is facing limitations in its Elixir uro backend when uploading maps, specifically related to the Godot Engine scenes. These limitations are believed to be caused by a restriction in the Waffles library.

## The Challenge

The challenge at hand is to address the arbitrary limitations imposed by the Waffles library on the Godot Engine scenes during map uploads in the Elixir uro backend of V-Sekai.

## The Strategy

To overcome this challenge, we propose patching the Waffles library in collaboration with our new contributor.

## The Upside

By patching the Waffles library, we can effectively remove the limitations on the Godot Engine scenes and improve the functionality of map uploads in V-Sekai.

## The Downside

It is important to consider any potential downsides or risks associated with patching the Waffles library. Further analysis and testing may be required to ensure compatibility and stability.

## The Road Not Taken

Alternative solutions to address the limitations have been explored, but patching the Waffles library appears to be the most viable option.

## The Infrequent Use Case

This limitation impacts the specific use case of map uploads in the Elixir uro backend, and may not affect other functionalities in V-Sekai.

## In Core and Done by Us?

As a core functionality of V-Sekai, addressing the limitations in the Godot Engine scenes during map uploads is a task that should be done by our team.

## Further Reading

- [V-Sekai](https://v-sekai.org/)
- This article is assisted by AI.
- https://github.com/V-Sekai/v-sekai-game/issues/68