# Wasm in V-Sekai Proposal

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

Using `MissingNode` in this design is essential because it provides a placeholder for nodes that are not yet available or implemented in the `godot-wasm` environment. This can be particularly useful when working with WebAssembly in Godot Engine, where certain features or nodes might not be supported or fully implemented.

There are several reasons why using `MissingNode` is beneficial:

1. **Graceful degradation**: When a node type is not supported or not yet implemented in the `godot-wasm` environment, using `MissingNode` allows the application to continue running without crashing or encountering errors. It acts as a fallback mechanism, ensuring that the rest of the application can still function even if some nodes are missing.

2. **Simplified implementation**: By using `MissingNode`, you can focus on implementing only the dependencies required for handling missing nodes, rather than implementing all possible node types. This reduces the complexity of your `godot-wasm` implementation and makes it easier to manage.

3. **Easier debugging**: When a `MissingNode` is encountered, it can provide information about the missing node type, making it easier to identify and fix issues related to unsupported or unimplemented nodes.

4. **Future-proofing**: As new nodes are added to the Godot engine or support for existing nodes is improved in the `godot-wasm` environment, you can easily replace `MissingNode` instances with the actual nodes once they become available. This ensures that your application remains compatible with future updates and improvements to the Godot engine.

In summary, using `MissingNode` in your design is essential to handle missing or not yet available nodes gracefully, simplify the `godot-wasm` implementation, make debugging easier, and ensure compatibility with future updates to the Godot engine.

The UGC (User-Generated Content) WASM modules, uploaded by users for universal access, are attached to a `MissingNode` as a script, providing property data and behavior. The clever implementation involves `MissingResource` for resources and a dictionary of `Variant` for node properties. Behavior is within the dictionary in this design. Utilizing Godot's standard `set_script` property, WASM Godot only needs to implement dependencies for `MissingNode` and `MissingResource`, excluding components like `Node3D`.

## Positive Consequences

- Improved performance for complex calculations, graphics rendering, and algorithm execution
- Greater user control over scripts and customization
- Enhanced functionality for virtual worlds and avatar-based social games

## Negative Consequences

- Potential security risks with user-uploaded Wasm modules
- Increased complexity in implementation and maintenance

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

1. **WebAssembly (Wasm)**: A type of code that runs faster than regular code, making games and virtual worlds work better.

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
