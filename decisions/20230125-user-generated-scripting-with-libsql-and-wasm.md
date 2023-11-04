# Proposed: Provide user generated scripting with libsql and wasm

### Metadata

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

### Context and Problem Statement

We want to have user scripting for interactivity for objects, pets and npcs.

### Describe the proposed option and how it helps to overcome the problem or limitation

We implement the wasm scripts using libsql and a wasm runtime to be determined.

We had a previous implementation called WASGO. Possible names for the new one is WASGOQuery and WASGO.

Advantages:

1. WAMR wasn't well liked because it's written in c/c++ and because it's not widely used.
2. WASMTIME is widely used and used for commercial / financial applications

Disadvantages:

1. WASMTIME rust is hard to deploy
2. WAMR is hard to use.

Open Questions:

Does it require determinism for clustering?

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

We ONLY support floating point, integers, strings and byte arrays.

- [ ] Compile libsqlite
- [ ] Add a wasm engine
- [ ] Typed:
- [ ] Save a UDF of the notification function of \_notification as a string of arbitrary length
- [ ] returns a row

![image](attachments/214701442-92179b40-a869-4290-a328-c2ad4c56264a.png)

### Positive Consequences

We can user script our worlds.

### Negative Consequences

We cannot get other features in.

### Option graveyard

- Option: The status quo. <!-- List the proposed options no longer open for consideration. -->
- Rejection Reason: This solves nothing. <!-- List the reasons for the rejection: (the bad traits) -->

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Knowing what to do is hard.

### Is there a reason why this should be core and done by us?

Scriptability is a core feature.

### References

- [V-Sekai](https://v-sekai.org/)
- [libsql bindgen](https://bindgen.libsql.org/)
- [wasm udfs in sqlite](https://blog.chiselstrike.com/webassembly-functions-for-your-sqlite-compatible-database-7e1ad95a2aa7)
