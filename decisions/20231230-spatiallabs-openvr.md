# Deprecated: Valid configuration of Spatiallabs and Openxr

## Metadata

- **Status:** Deprecated
- **Deciders:** V-Sekai
- **Tags:** V-Sekai, fixed

## The Backdrop

This proposal aims to define a valid configuration of OpenVR and SpatialLabs display.

## The Challenge

The main challenge is to display Unity applications like SteamVR home and others.

## The Strategy

To overcome the challenge, use these exact versions:

1.  `SpatialLabs EC PRO_Acer_1.2.288_Win11x64`
2.  `Acer SteamVR Bridge.Installer.1.00.1001`

## The Upside

By using these specific versions, we can avoid the latest update that causes the screen to be black. This ensures a seamless experience for users.

## The Downside

The downside of this approach is that we are losing out on the latest updates and improvements that come with them.

## The Road Not Taken

An alternative approach could have been to use a different product like the Looking Glass Factory, but they don't support openxr.

## The Infrequent Use Case

Another infrequent use case could be only flat desktop.

## In Core and Done by Us?

I have access to equipment and it's not easy to get access. This means that the implementation and testing of this proposal will be done by us.

## Further Reading

1.  [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2.  [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine.

> AI assistant Aria assisted with this article.
