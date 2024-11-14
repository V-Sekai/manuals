# V-Sekai Changelog - November 2024

- Experimental (🧪): This stage is for features still being tested and may not be stable.
- Feature complete (🎯): This stage is for features with all planned functionality implemented.
- Beta (🚧): This stage is for essentially complete features that may still have bugs.
- General release (🚀): This stage is for features that have been thoroughly tested and are now released.

## [Released]

- 🧪 Prototype a repository for visual anomaly detection with Anomalib. [V-Sekai-fire/godot-visual-anomaly-detection](https://github.com/V-Sekai-fire/godot-visual-anomaly-detection)
- 🚧 [ifiregames.itch.io/godot-motion-matching](https://ifiregames.itch.io/godot-motion-matching)
- 🧪 [V-Sekai/world-editor](https://github.com/V-Sekai/world-editor)
- 🚀 [Ughuuu/gdextension-to-module](https://github.com/Ughuuu/gdextension-to-module)
- 🚀 Walk the Dog is a vector-quantized periodic autoencoder. Walk the Dog is now MIT-licensed open source. It learns a disconnected 1D phase manifold that aligns motion regardless of morphologies while requiring no paired data or any joint correspondence [PeizhuoLi/walk-the-dog](https://github.com/PeizhuoLi/walk-the-dog)
- 🚀 Submitted an update to Godot-VRM version 2.1.0, adding much-needed support for Godot 4.3 SkeletonModifier3D, an import (or runtime) option to adjust the head hiding method, and several bug fixes. It will be released on the asset library when approved, likely next week, but it can be downloaded from GitHub.
  Known issues: Node constraints are still imported incorrectly because they are not adjusted for rotated bones during retargeting. Newer VRM features, such as VRMA animation, still need to be supported.
- 🎯 https://github.com/V-Sekai/world-godot and https://github.com/V-Sekai/world-kit are now the new repository of Godot Engine and the world kit.

## [Unreleased]

### Added

- 🎯 **Godot Lottie** for animated vector graphics is ready to be merged into Godot Master.
- 🎯 **Godot Manifold** for mesh add, mesh subtraction and mesh overlap is ready to be merged in Godot Master.
- 🧪 **Animation Node** was merged in godot motion matching.
  - 🧪 Assist with `Add animation node extension` godot engine patch for animation node gdextensions.
  - 🧪 [Designing Motion Matching as an animation node](https://github.com/GuilhermeGSousa/godot-motion-matching/discussions/52)
- 🧪 **Godot cpp as C++ module**: Dragos shows us a photo of godot-sandbox as a C++ module.
  * 🧪 We made a way to compile all `gdextensions` as a C++ module by extending `GDExtensionLoader.` [Ughuuu/gdextension-to-module](https://github.com/Ughuuu/gdextension-to-module)
- 🧪 Uploaded a new **godot vrm for motion matching web demo**. Now, with debugging gizmos. [View Demo](https://ifiregames.itch.io/godot-motion-matching)
- 🧪 Found research on **transpiling GDScript to Godot Engine C++** with tailcalls as jumps. [Read More](http://www.emulators.com/docs/nx25_nostradamus.htm) | [ACM1](https://dl.acm.org/doi/10.1145/277650.277719) | [ACM2](https://dl.acm.org/doi/10.1145/1869643.1869651) | [Hacker News Discussion](https://news.ycombinator.com/item?id=18052482)
- 🎯 1% runtime improvement with lod rendering in Godot Engine [Rewrite index optimization code for maximum efficiency](https://github.com/godotengine/godot/pull/98801)
- 🧪 [Provide VRM exports with humanizer](https://github.com/NitroxNova/humanizer/issues/36)

### Fixed

- 🚧 Steam audio runs in standalone mode for PC, and nothing technical stops it from running on the Android Quest 3 after the Godot Engine feature enhancement was merged last week. [stechyo/godot-steam-audio](https://github.com/stechyo/godot-steam-audio)
- 🎯 Vulkan pose Movenet estimation demo now runs on IREE.gd. [iree-gd/iree.gd](https://github.com/iree-gd/iree.gd)

### Deprecated

- Not applicable for this month.

### Removed

- Not applicable for this month.

### Security

- **Security Best Practices**:

This project does not adhere to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Previous Releases]

- Not applicable for this month.

