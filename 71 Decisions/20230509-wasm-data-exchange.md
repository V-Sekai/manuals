# Draft: Exchange data between Godot Engine and WASM using handles

## Metadata

- Status: draft <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai, fire, lyuma, ashtonmeuser
- Tags: V-Sekai, ChatGPT-4

## Context and Problem Statement

V-Sekai faces a limitation in sending complex data types between the Godot Engine and WebAssembly (WASM) modules. Simple Variant types can be marshaled or copied onto the stack, but arrays, dictionaries, and Object types require a more efficient approach.

## Proposed Solution

Implement a handle-based approach for managing complex data types. Allocate handles, possibly reference counted, allowing the WASM guest to pass integers around to all the Godot APIs. This will enable efficient communication between the host side and the WASM guest.

## Implementation

1. Design a handle-based system for managing complex data types.
2. Implement reference counting for allocated handles.
3. Add Godot APIs to accept integer handles instead of direct object references.
4. Test the new implementation with various data types and scenarios.

## Positive Consequences

- Efficient communication between the host side and the WASM guest.
- Improved performance when dealing with complex data types.
- Simplified API usage for developers.

## Negative Consequences

- Additional complexity in the implementation.
- Potential overhead due to reference counting.

## Option graveyard

N/A

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement addresses a core limitation and requires changes to the underlying system.

## Is there a reason why this should be core and done by us?

Yes, this enhancement improves the efficiency and usability of the V-Sekai platform, making it more attractive to developers and users.

## References

- [V-Sekai](https://v-sekai.org/)
- [Godot Engine StreamPeer](https://docs.godotengine.org/en/stable/classes/class_streampeer.html)
- [Godot Engine Wasm](https://github.com/ashtonmeuser/godot-wasm)
- [Godot Engine WasGo](https://github.com/V-Sekai/wasgo)
