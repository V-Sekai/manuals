# Proposed: Wasm in V-Sekai Proposal

## Metadata

- Status: proposed
- Deciders: V-Sekai, fire
- Tags: V-Sekai

## Context and Problem Statement

V-Sekai aims to provide a high-performance platform for virtual worlds and avatar-based social games. The current implementation relies on GDScript or C++ native modules, which may not offer the desired performance, user agency, complex calculations, graphics rendering, and algorithm execution.

## Proposed Solution

V-Sekai utilizes WebAssembly (Wasm) to enhance performance, offering an alternative to GDScript.

### Ownership

- Core modules: Owned by V-Sekai
- Custom modules: Owned by users

### Security

User-uploaded Wasm modules undergo a two-step process for safety and unauthorized access prevention:

1. **Validation**: Ensure module structure and integrity adhere to security standards.
2. **Sandboxing**: Confine modules in a secure environment, restricting system resource access and mitigating potential harm.

### Functionality

Wasm modules facilitate advanced functions in virtual worlds and avatar-based social games, such as:

- Efficient character animations
- Interactive environments
- Real-time multiplayer networking
- Immersive gameplay experiences

## Implementation

The proposed solution uses WebAssembly (Wasm) to enhance performance and functionality in V-Sekai through User-Generated Content (UGC) Wasm modules. These modules are attached to an existing base node as a script, enabling them to provide property data and behavior for nodes in the virtual world or game.

Here's a concise explanation of the implementation:

1. **User uploads a Wasm module**: Custom Wasm modules with desired functionality are uploaded to V-Sekai.
2. **Attach Wasm module to a node**: The Wasm module is attached to a node as a script, providing advanced functionality for the node.
5. **Implement behavior within the Variant dictionary**: Node behavior is defined within script variable, enabling Wasm modules to provide both property data and behavior.
6. **Utilize Godot's set_script property**: Using Godot's `set_script` property, Wasm modules are attached to nodes and objects, simplifying dependency handling.
7. **Properties after the set script**: Adding properties directly onto the node after the script = property is set

This approach ensures graceful handling of missing resources while offering advanced functionality through user-uploaded Wasm modules.

## Positive Consequences

- Improved performance for complex calculations, graphics rendering, and algorithm execution
- Greater user control over scripts and customization
- Enhanced functionality for virtual worlds and avatar-based social games

## Negative Consequences

- Potential security risks with user-uploaded Wasm modules
- Increased complexity in implementation and maintenance
- Ensuring a wasm module has no defects is difficult with or without source code.

## Option graveyard

1. **Optimizing GDScript**: Improving the performance of GDScript was considered, but it would not provide the same level of performance boost as WebAssembly.
2. **Using a different scripting language**: Alternative scripting languages like Lua or Python were considered, but they also do not offer the desired performance improvements compared to WebAssembly.
3. **Native code integration**: Integrating native code (C++, Rust, etc.) directly into V-Sekai was considered, but it would increase complexity and maintenance efforts. Additionally, it would not provide the same level of security and sandboxing as WebAssembly.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, the enhancement aims to provide a significant performance boost and advanced functionality that cannot be achieved with a few lines of script.

## Is there a reason why this should be core and done by us?

Yes, integrating Wasm into V-Sekai's core ensures optimal performance and seamless integration with existing systems.

## References

- [V-Sekai](https://v-sekai.org/)
- [ashtonmeuser/godot-wasm/issues/43](https://github.com/ashtonmeuser/godot-wasm/issues/43)
- This article was assisted by AI.

## Glossary

Here's a glossary of definitions to help people understand the terms used in the Wasm in V-Sekai proposal:

1. **WebAssembly (Wasm)**: A type of code that is more portable than regular code, making games and virtual worlds work better. Originally made for the web.

2. **GDScript**: A programming language used to make games and apps in the Godot game engine.

3. **C++ native modules**: Pieces of code written in the C++ programming language that can be added to a game or app to make it work better.

4. **V-Sekai**: A platform for creating virtual worlds and avatar-based social games.

5. **Metadata**: Information about something, like who made it and what it's for.

6. **Validation**: Checking if something is correct and follows the rules.

7. **Sandboxing**: Putting something in a safe area where it can't cause harm or access things it shouldn't.

8. **User-Generated Content (UGC)**: Things that people who use a game or app create themselves, like characters, levels, or stories.

9. **MissingNode**: A part of the game or app that needs a script to tell it what to do.

10. **MissingResource**: Something that a game or app needs but doesn't have yet, like an image or sound.

11. **Variant**: A data type in Godot that can store different kinds of information, like numbers, text, or objects. It is used to represent and manipulate data in various ways within the game engine.

12. **Node3D**: A point in a 3D space that helps build a virtual world or game.

13. **Godot**: A free and open-source game engine used to create games and apps.

14. **Lua**: A programming language often used in game development.

15. **Python**: A popular programming language used for many purposes, including game development.

16. **Rust**: A programming language focused on safety and performance, often used for creating fast and reliable software.
