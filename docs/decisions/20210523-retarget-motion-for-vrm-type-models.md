# Retarget motion for VRM type models [OFFLINE]

## Context and Problem Statement

We need to retarget motion for VRM type models.

This is an offline lengthy process to retarget other motions to VRM type models.

## Describe the proposed option and how it helps to overcome the problem or limitation

Use Blender to retarget t-posed characters.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

- inputs: bvh + t-pose avatar
- output: glb w/retargetted animation

#### Requirements:

- Blender v2.91 or v2.92 (may work with other versions)
- Blender Add-On: [skeletal-motion-retarget-blender](https://github.com/fire/skeletal-motion-retarget-blender)
    - download .zip
    - use Blender Edit => Preferences, Add-ons, Install... that zip
    - check the box for the newly install add-on to activate
- (optional) if using a VRM avatar Blender Add-On: [saturday06/VRM_Addon_for_Blender](https://github.com/saturday06/VRM_Addon_for_Blender/releases/)
    - download .zip
    - use Blender Edit => Preferences, Add-ons, Install... that zip
    - check the box for the newly install add-on to activate

### Conversion Process

- have a rigged, T-Pose humanoid avatar
- start a new scene?
    - Under the Scene Settings property panel, set Frame Rate to 30 fps
    - (or you may want to match your .mp4 frame rate used during capture)
- import your avatar model
    - if using a VRM avatar be sure to use Import VRM (otherwise retargetting may not work!)
- import the generated BVH. In the Animation section, enable the following options
    - [x] Scale FPS
    - [x] Scene Duration
- use Pose Transfer tab (vertical tab part of the "N" options panel?)
    - Source: the imported BVH armature
    - Target: the imported avatar armature
    - Click the Rebuild Bone List
        - manually map over any bones not automatically mapped
        - eg: LeftLowerArm => "Left elbow"
        - note: it's possible to save your mapping to .json and reuse
    - Click Retarget Animation
        - retargeting may take several minutes
- verify retargetting by playing the animation via blender play button
- Export the scene as a .glb (using default settings)

### Common Problems

Q: retargeted animation seems to have legs crossed / backwards
A: this can happen if you import a VRM avatar as a .gltf (re-import using the VRM importer add-on)

Q: legs / arms bend unnaturally 
A: check the armature bone name mappings
  - at most each target bone name should appear once
  - leave BVH joints not present in your avatar blank

### Acknoledgements

**Thanks to humbletim for being the scribe**

**thanks to lyuma for being test pilot flying these steps**

### Positive Consequences <!-- optional -->

- Have a generally robust process of retargeting motions to VRM-type models.

### Negative Consequences <!-- optional -->

- Only VRM
- MMD doesn't work.

## Option graveyard: Adobe Mixamo

List the reasons for the rejection: (the Bad traits)

* Propietary Online Service
* Blackbox technology

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Motion retargeting is not trivial offline or online.

## Is there a reason why this should be core and done by us?

We need motions for our character controller without using an off the shelf black box solution.

## Links <!-- optional -->

- https://www.blender.org/