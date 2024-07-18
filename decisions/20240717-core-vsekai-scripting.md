# Proposal: Core V-Sekai Scripting with Wasm

## The Context

The V-Sekai project aims to enhance the Godot Engine with social VR functionality. Currently, the project uses a forked version of the Godot Engine, which complicates development and maintenance due to frequent updates from the main Godot repository.

## The Problem Statement

The V-Sekai team faces challenges with maintaining a forked version of the Godot Engine. Some team members prefer using the stock Godot Engine to avoid long compilation times and complex build processes. Additionally, there is a need for faster and more secure scripting capabilities than what GDScript offers.

## Proposed Solution

If we move all core scripts to Wasm, we'll need to make only one GDExtension, and then it will never change. So it will be one build that we can all share. We will only need to update when we want a new update from the main Godot Engine repository.

It might be hard, but encapsulating complex types is a bridge we're going to have to cross no matter what.

MMMaellon originally thought the reason why we want to move to Wasm is because the team doesn't want to edit the C++ code. Perfectly matching the old API sounds really, really hard. But if we're allowed to take shortcuts and figure out workarounds, MMMaellon thinks making a Wasm layer that allows us to do enough is doable. As long as the bar isn't that it has to be an exact perfect replica of the old API.

We propose separating the core scripts into WebAssembly (Wasm) modules. This approach allows us to use the stock Godot Engine while leveraging the performance benefits of Wasm.

The core scripts will be loaded as Wasm modules, and a single GDExtension will handle the integration between Godot and the Wasm runtime.

### How It Works

1. **Core Scripts in Wasm**: Move all core scripts to Wasm modules. These scripts will handle essential functionalities like security checks and editor tools.
2. **GDExtension for Wasm Integration**: Develop a GDExtension that loads and executes the Wasm modules. This extension will act as a bridge between Godot and the Wasm runtime.
3. **Single Binary Distribution**: By using Wasm, we can distribute a single binary executable that includes the GDExtension and Wasm modules, simplifying the deployment process.

## The Benefits

- **Performance**: Wasm provides near-native performance, making it faster than GDScript.
- **Security**: Wasm's sandboxed environment enhances security by isolating the execution of scripts.
- **Maintainability**: Using the stock Godot Engine reduces the burden of maintaining a forked version and simplifies updates.
- **Flexibility**: Developers can write core scripts in languages that compile to Wasm, such as C++ or Rust.

## The Downsides

- **Complexity**: Developing and integrating Wasm modules adds complexity to the project.
- **Learning Curve**: Team members may need to learn new technologies and tools related to Wasm.

## The Road Not Taken

- **Sticking with Forked Godot**: Continuing to use a forked version of Godot would require ongoing maintenance and could deter contributors.
- **Using Only GDExtension**: While GDExtension provides native performance, it requires code signing and can be cumbersome to manage across multiple modules.

## The Infrequent Use Case

In scenarios where the performance and security benefits of Wasm are not critical, simpler scripting solutions like GDScript or native GDExtensions might suffice.

## In Core and Done by Us

This proposal involves significant changes to the core architecture of the V-Sekai project. The development team will be responsible for implementing and maintaining the Wasm integration and GDExtension.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team
- Fire
- MMMaellon

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
