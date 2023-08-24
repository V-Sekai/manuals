# V-Sekai: Your Avatar, Your World

V-Sekai is a unique platform that allows you to import and explore various worlds. While we're still working on our documentation, we welcome contributions and encourage users to reach out to us through our community channels for any questions or assistance.

## Embrace Your Virtual Self with VRM Avatars in V-Sekai

One of the key features of V-Sekai is its support for VRM avatar files. VRM is an open-source standard designed to enable the sharing of portable humanoid avatars across different virtual reality platforms.

As a user, you can personalize your avatars in V-Sekai by importing models from Blender or VRoid Hub. These models then become your virtual persona within the space. For more information on VRM, please refer to [VRM: Extending glTF for Portable Humanoid Avatars](https://www.khronos.org/assets/uploads/developers/presentations/VRM-Extending-glTF-for-Portable-Humanoid-Avatars_SIGGRAPH-Asia_Nov19.pdf).

The VRM glTF2 extension plays a crucial role in V-Sekai, introducing a host of exciting features. It enables the creation of XR avatars built on glTF, providing an immersive experience for users. The extension also supports automatic humanoid rigging, making it easier to create and control character models.

Interactive hair and clothing add a touch of realism to the avatars, while twist bones and constraints provide more flexibility in movement and posing. Toon shading with glTF PBR gives the avatars a distinctive visual style, and face shapes for speech allow for more expressive communication within the virtual space.

Cross-engine support ensures that the VRM glTF2 extension can be used across different platforms, enhancing its versatility. The extension also simplifies physics simulation through spring bones, resulting in more natural and fluid movements. Meta-information such as author and license details can be included, and custom facial expressions or morphs can be created for a personalized touch.

Animation retargeting is another feature that enhances the user experience in V-Sekai. This feature allows you to import models or animation libraries, use the built-in humanoid profile, or even create custom profiles for unique characters like monsters or animals. It offers compatibility with Mixamo and Blender animations, allowing users to incorporate a wide range of movements into their avatars. Furthermore, walk and run animations can be blended using blend spaces, creating seamless transitions between different types of movement.

## Journey of Character Avatar Import Development

Here's a timeline that illustrates the development process of character avatar import:

```mermaid
gantt
    dateFormat  YYYY-MM-DD
    title       Character Avatar Import Development

    section Tasks
    Implement FBX for glTF in Godot Engine :a1, 2018-12-01, 2022-04-30
    Godot 4.0 development                      :a5, 2019-03-01, 2023-03-31
    Debug and fix glTF import in Godot Engine :a2, 2019-07-01, 2019-08-12
    Blender fixed glTF import in May 2020      :a3, 2020-05-01, 2020-05-31
    Implement Godot Engine glTF export        :a4, 2021-01-04, 2021-01-04
    Reduz removed REST transform influence from skeleton bones :a10, 2021-10-13, 2021-10-13
    Reduz removed animation 3D transform track, replaced by loc/rot/scale tracks :a11, 2021-10-13, 2021-10-13
    Reduz implemented animation compression   :a8, 2021-10-25, 2021-10-25
    iFire added Blender import                 :a7, 2021-11-11, 2021-11-11
    Reduz implemented Animation Libraries     :a6, 2022-04-11, 2022-04-11
    iFire shepherded Add AnimationTree Advanced Expressions :a9, 2022-05-19, 2022-05-19
```