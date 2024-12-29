# Draft: Single-Stack Prototyping Approach for V-Sekai

## The Context

Rapid prototyping is essential for validating ideas and iterating within the V-Sekai development ecosystem. To efficiently assess designs, we need a streamlined prototyping process. This proposal recommends a single-stack approach centered around the Godot Engine, augmented by Elixir and Phoenix for cloud functionalities.

## The Problem Statement

Using different technology stacks for prototyping introduces complexities. Developers may encounter inconsistent code styles and struggle to share knowledge. Managing various dependencies can also create overhead. This fragmented approach hinders productivity. A single-stack solution will foster consistency and streamline workflows.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

This proposal envisions a prototyping ecosystem where Godot is the foundation, integrated with Elixir and Phoenix:

- **Godot:** This engine will support various prototypes, from VR/AR experiences and games to web applications. Godot's GDScript language and V-Sekai integration enable fast prototyping. Godot's web export capabilities facilitate web-based tools.

- **Elixir + Phoenix:** These technologies extend Godot's capabilities for cloud services, providing:

  1.  **Project Setup:** Developers can generate a Phoenix project with essential features:

      ```bash
      mix igniter.new --with phx.new --install ash,ash_postgres,ash_phoenix,ash_authentication,ash_authentication_phoenix,ash_admin
      mix ash_authentication.add_strategy magic_link
      mix ash.codegen initial
      mix ecto.create
      mix ash.setup
      ```

  2.  **Rapid Iteration with LiveView:** Build real-time, interactive interfaces.

This approach allows developers to focus on Godot while incorporating Elixir and Phoenix for cloud needs within a consistent environment.

## The Benefits

- **Flexibility:** Godot, Elixir, and Phoenix provide a comprehensive toolkit for prototyping diverse applications.
- **Consistency:** Centering on Godot promotes consistency in code style and development practices, facilitating knowledge sharing.
- **Efficiency:** This approach streamlines development, reducing the overhead of managing multiple technologies.
- **Developer Empowerment:** A unified toolset empowers developers to explore new possibilities.

## Addressing Potential Concerns

A single-stack approach might raise concerns about limitations in using specialized tools. This proposal allows for exceptions when functionalities beyond the capabilities of Godot, Elixir, and Phoenix are required.

## The Road Not Taken

Alternative approaches, such as a multi-stack approach or relying solely on Godot without cloud capabilities, were considered less efficient.

## In Core and Done by Us

The V-Sekai development team will implement this single-stack approach.

## Status

Status: Draft

## Decision Makers

- V-Sekai development team
- Fire
- Benbot

## Tags

- V-Sekai
- Prototyping
- Godot
- Elixir
- Phoenix

## Further Reading

1.  [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2.  [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3.  [Elixir Lang](https://elixir-lang.org/) - Official website for the Elixir programming language.
4.  [Phoenix Framework](https://www.phoenixframework.org/) - Official website for the Phoenix web framework.
5.  [BenBot](https://github.com/benbot) - GitHub profile of BenBot, a contributor to the V-Sekai project.

AI assistant Aria assisted with this article.
