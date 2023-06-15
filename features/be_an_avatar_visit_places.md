# Be an avatar and visit places

V-Sekai allows you to import worlds and explore them.

To learn how to import worlds and visit them, please refer to our documentation or reach out via our community channels.

V-Sekai supports VRM avatar files, an open-source standard for sharing portable humanoid avatars across virtual reality platforms.

Users can personalize their avatars in V-Sekai by importing models from Blender or VRoid Hub and using them as their persona within the virtual space. [VRM: Extending glTF for Portable Humanoid Avatars](https://www.khronos.org/assets/uploads/developers/presentations/VRM-Extending-glTF-for-Portable-Humanoid-Avatars_SIGGRAPH-Asia_Nov19.pdf)


```mermaid
gantt
    dateFormat  YYYY-MM-DD
    title       Character Avatar Import

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


## VRM glTF2 Extension Features

- XR avatars built on glTF
- Automatic humanoid rigging
- Interactive hair and clothing
- Twist bones and constraints
- Toon shading with glTF PBR
- Face shapes for speech
- Cross-engine support
- Simplified physics simulation (spring bones)
- Meta-information (author and license)
- Custom facial expressions (morphs)

## Animation Retargeting

- Import as a model or animation library
- Built-in humanoid profile
- Custom profiles (e.g., monsters, animals)
- Compatible with Mixamo and Blender animations
- Blend walk and run animations using blend spaces