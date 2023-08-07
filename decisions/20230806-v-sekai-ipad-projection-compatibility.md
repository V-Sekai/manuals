# V-Sekai Navigation Compatibility with VR

## Metadata

- **Status:** Proposed
- **Deciders:** V-Sekai
- **Tags:** V-Sekai, iPad, Presentation Screen, Compatibility

## The Backdrop

We are developing a VR game that MUST be compatible with a wide range of devices. Our goal is to make our VR game accessible and enjoyable for this vast majority of users.

## The Challenge

The challenge is to ensure the game's user interface and controls work seamlessly across these different display sizes and touch interfaces.

## The Strategy

We considered two options: Virtual joystick for touchscreen devices and Navmesh and 3D navigation points. We chose the "Virtual joystick for touchscreen devices" because it addresses the core issue of ensuring compatibility with iPads and large projector screens, and it is more cost-effective.

## The Upside

- Improved user experience across different devices and screen sizes.
- Increased versatility of the game, making it suitable for various applications.
- Enhanced navigation in 3D spaces.
- More cost-effective solution.

## The Downside

- Potential increase in development time and costs.
- Additional resources for testing on different devices and screens.

## The Road Not Taken

Navmesh and 3D Navigation Points were evaluated but ultimately not selected due to their inability to address the fundamental issue of ensuring compatibility with iPads and large projector screens.

To be able to click on a surface and navigate freely around that surface (where permitted), a navmesh is required to define that surface. Waypoints, while useful, have limitations - they are not well-suited for defining traversable spaces that aren't already defined, such as grids.

One of the performance challenges currently faced by Godot is that any modification triggers a rebuild of the entire navigation map. Consequently, if the navigation map is large and complex, taking a significant amount of time to rebuild, it can lead to performance issues.

## The Infrequent Use Case

While Navmesh and 3D Navigation Points provide an intuitive user interface for navigating 3D spaces, they might not translate well to continuous interaction on touchscreens, which is often expected by users on such devices.

## In Core and Done by Us? 

Yes, the decision to implement a virtual joystick for touchscreen devices was made by us, V-Sekai. This decision is at the core of our strategy to ensure compatibility with iPads and large projector screens while also being cost-effective.

## Further Reading

- [V-Sekai](https://v-sekai.org/)
- This article is assisted by AI.
