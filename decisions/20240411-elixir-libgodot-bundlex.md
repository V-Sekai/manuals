# Proposed: Use Bundlex for Binding GDExtension to Elixir for Libgodot to Implement a Distributed Simulation

## Context

The V-Sekai development team is striving to enhance the simulation experience in our VR game. We aim to create a more immersive and interactive environment for our players.

## Problem Statement

We can bind GDExtension to a C-like language for libgodot to implement a distributed simulation.

## Proposed Solution

Instead of godot-zig, we propose using **Bundlex**, a multi-platform tool for compiling C and C++ code along with Elixir projects. This will allow us to leverage the power of Elixir's concurrency and fault-tolerance features, which are ideal for creating distributed simulations.

```elixir
defmodule MyProject do
  use Bundlex.Project

  def project() do
    [
      app: :my_project,
      compilers: [:bundlex],
      deps: deps()
    ]
  end

  defp deps do
    [
      {:bundlex, "~> 0.2"}
    ]
  end
end
```

## Benefits

- Enhanced simulation performance due to Elixir's efficient handling of concurrent processes.
- Improved fault tolerance, as Elixir's supervisor trees can automatically recover from errors.
- Increased developer productivity, as Elixir's syntax is concise and expressive.

## Downsides

- Requires learning a new programming language (Elixir), which may increase the development time initially.
- Potential compatibility issues between Elixir and existing parts of the system.

## Alternatives Considered

We considered using other languages like Rust or Go, but they did not offer the same level of concurrency and fault-tolerance features as Elixir.

## Infrequent Use Case

This proposal may not be suitable for smaller projects that do not require complex distributed simulations.

## Implementation

The V-Sekai development team will implement this proposal.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [Bundlex](https://hex.pm/packages/bundlex)

Assisted by Aria.
