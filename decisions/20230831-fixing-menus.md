# Accepted: Fix menus in-game

## Metadata

- Status: accepted
- Deciders: V-Sekai
- Tags: V-Sekai

## The Backdrop

## The Challenge

The menus in-game are unable to capture events from the VR controllers.

## The Strategy

Debug the `on_pointer_pressed` function as it is not working correctly due to an issue with `Transform3D.xform_inv`. The current implementation mimics mouse input, but it fails to translate global positions correctly. Review the `global_to_viewport` function and ensure it returns the correct value for `local_at`.

## The Upside

Fixing the menus will enable players to interact with them using VR controllers, enhancing the user experience.

## The Downside

Fixing the menus may require significant code changes, introducing potential bugs or conflicts that need proper testing to ensure stability.

## The Road Not Taken

Exploring alternative input systems specifically designed for VR controllers could be considered, but it may involve rewriting a large portion of the menu code and potentially introducing new dependencies.

## The Infrequent Use Case

This fix targets players using VR controllers to interact with the menus. Players without VR controllers will not be affected.

## In Core and Done by Us?

Yes, this issue falls within our core development responsibilities, and we will take ownership of fixing the menus.

## Further Reading

- [V-Sekai](https://v-sekai.org/)
- This article is assisted by AI.
