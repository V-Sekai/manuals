# Proposed: RISCV Binaries as Shared Libraries

## The Context

In the current development landscape, there is a growing need for more efficient and flexible ways to handle gdextension binaries. This proposal was inspired by a conversation between Fire and ホロ on June 27, 2024.

## The Problem Statement

Traditionally we have to compile gdextension for like 5-10 platform variants which is inefficient.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Fire proposed an idea where many gdextension modules can be compiled as RISCV binaries.

Functioning like shared libraries via librisc emulation both as an intepreter or a register machine. 

This could potentially allow wrapping up the entire gdextension API.

Here's an example of how function calls into the guest VM could work:

```c
// See further reading section.
// Host:
int ret = machine.vmcall("test", 111, 222, "333");
printf("test returned %d\n", ret);

// Guest:
extern "C" __attribute__((used, retain))
int test(int a, int b, const char* c) {
	return a + b;
}
```

This approach would make arbitrary function calls into the VM guest possible. The functions must be C ABI, and if you use the string name, the function must be in the symbol table.

This can also be a future approach into compiling gdscript bytecode as more performant code via string templating the bytecode as c and compiling it, but that is reserved for future work.

## The Benefits

- Increased efficiency and flexibility in handling RISCV binaries.
- Potential to wrap the entire gdextension API.
- More convenient and capable of doing things that can't be done in gdscript.

## The Downsides

- Requires significant changes to the existing system.
- May introduce new complexities and potential security risks.

## The Road Not Taken

- Exploring other methods of improving flexibility of loading binaries - like wasm.
- Holo has given me an implementation of riscv processors in godot engine via zig language.

## The Infrequent Use Case

- This proposal may not be beneficial for small-scale projects or those that do not require high levels of efficiency and flexibility in handling RISCV binaries.

## In Core and Done by Us

- This proposal will be implemented by the V-Sekai development team, with potential contributions from the wider open-source community.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [libriscv VM Call Documentation](https://github.com/fwsGonzo/libriscv/blob/master/docs/VMCALL.md) - Detailed documentation on making function calls into the VM guest.
4. [https://c9x.me/compile/]
5. [https://github.com/Vahera/godot-orchestrator]

AI assistant Aria assisted with this article.
