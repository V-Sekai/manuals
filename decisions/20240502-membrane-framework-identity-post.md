# Proposed: Process the glTF2 input file and return it as is

## The Context

We are working on a project that involves the use of the Elixir Membrane Framework. Our goal is to process glTF (GL Transmission Format) files, which are standard file formats for 3D scenes and models.

## The Problem Statement

We need to create a job in the Membrane Framework that can take an input glTF file and return it as is. However, we are currently stuck and unable to proceed with this task.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

```elixir
defmodule MyPipeline do
  use Membrane.Pipeline

  @impl true
  def handle_init(_) do
    children = %{
      source: %Membrane.File.Source{location: "input.gltf"},
      sink: Membrane.File.Sink
    }

    links = [
      link(:source)
      |> to(:sink)
    ]

    {{:ok, %ParentSpec{children: children, links: links}}, %{}}
  end
end
```

This is a basic pipeline that reads a file and writes it back out. It's not doing any processing yet, but it's a start.

## The Benefits

Implementing this feature will allow us to process glTF files within our application, opening up new possibilities for 3D model manipulation and visualization.

## The Downsides

The main downside is the complexity involved in understanding and implementing the Membrane Framework. This could potentially slow down development time.

## The Road Not Taken

An alternative approach would have been to use a different framework or language that might be easier to implement but may not offer the same level of control and flexibility as the Membrane Framework.

## The Infrequent Use Case

This feature may not be used frequently if our application does not heavily rely on 3D model manipulation.

## In Core and Done by Us

This feature will be implemented by the V-Sekai development team.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
