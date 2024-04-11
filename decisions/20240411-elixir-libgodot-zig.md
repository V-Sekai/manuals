# Proposal: Binding GDExtension to a C-like Language for Libgodot to Implement a Distributed Simulation

## The Context

The V-Sekai development team is working on enhancing the simulation experience in our VR game. We aim to create a more immersive and interactive environment for our players.

## The Problem Statement

We can bind GDExtension to a C-like language for libgodot to implement a distributed simulation.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

We propose to use godot-zig to bind GDExtension to Elixir. This will allow us to leverage the power of Elixir's concurrency and fault-tolerance features, which are ideal for creating distributed simulations.

## The Benefits

- Enhanced simulation performance due to Elixir's efficient handling of concurrent processes.
- Improved fault tolerance, as Elixir's supervisor trees can automatically recover from errors.
- Increased developer productivity, as Elixir's syntax is concise and expressive.

## The Downsides

- Requires learning a new programming language (Elixir), which may increase the development time initially.
- Potential compatibility issues between Elixir and existing parts of the system.

## The Road Not Taken

We considered using other languages like Rust or Go, but they did not offer the same level of concurrency and fault-tolerance features as Elixir.

## The Infrequent Use Case

This proposal may not be suitable for smaller projects that do not require complex distributed simulations.

## In Core and Done by Us

The V-Sekai development team will implement this proposal.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [godot-zig](https://github.com/godot-zig/godot-zig)
4. [zigler](https://github.com/E-xyza/zigler)

Assisted by Aria.
