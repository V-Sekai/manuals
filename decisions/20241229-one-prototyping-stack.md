# Draft: Single-Stack Prototyping Approach for V-Sekai

## The Context

Rapid prototyping is essential for validating ideas and iterating within the V-Sekai development ecosystem. To efficiently assess designs, we need a streamlined prototyping process. This proposal recommends a single-stack approach centered around the Godot Engine, augmented by Elixir and Phoenix for cloud functionalities.

## The Problem Statement

Using different technology stacks for prototyping introduces complexities. For example, imagine developers working on a virtual reality social platform. One team might use a game engine like Unity for the frontend, while another uses Node.js and Express.js for the backend API.

A single-stack solution will foster consistency and streamline workflows, ultimately leading to faster development cycles and improved productivity.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

This proposal envisions a prototyping ecosystem where Godot is the foundation, integrated with Elixir and Phoenix:

```bash
mix igniter.new --with phx.new --install ash,ash_postgres,ash_phoenix,ash_authentication,ash_authentication_phoenix,ash_admin
mix ash_authentication.add_strategy magic_link
mix ash.codegen initial
mix ecto.create
mix ash.setup
```

This setup provides a foundation for rapid prototyping by automating the configuration of common components like user authentication and database integration.

This approach allows developers to focus on Godot while incorporating Elixir and Phoenix for cloud needs within a consistent environment.

```mermaid
graph LR
    A[Godot Game Engine] --> B(GDScript Scripting Language);
    A --> C(V-Sekai Integration);
    A --> D{Web Export Functionality};
    D -- For web-based tools --> E[User Interface];
    A -.-> F[Elixir/Phoenix Backend Framework];
    F --> G(PostgreSQL Database);
    F --> H{Authentication Service};
    H -- Magic Link Strategy --> A;
    H -- OAuth 2.0 --> J{OAuth Providers};
    J -- GitHub Authentication Service --> A;
    J -- Google Authentication Service --> A;
    J -- Discord Authentication Service --> A;
    H -- Passkey Authentication Strategy --> A;
    F -- For communication with Godot --> A;
    K[Caddy Web Server/Reverse Proxy] --> F; 
```

## The Benefits

- **Flexibility:** Godot, Elixir, and Phoenix provide tools for prototyping diverse applications, from games and VR/AR experiences to web-based tools with cloud functionalities.
- **Consistency:** Centering on Godot promotes consistency in code style and development practices, facilitating knowledge sharing and reducing onboarding time for new developers.
- **Efficiency:** This approach streamlines development, reducing the overhead of managing multiple technologies and leading to faster prototyping cycles.
- **Developer Empowerment:** A unified toolset empowers developers to explore new possibilities and contribute more effectively to the project.

## Addressing Potential Concerns

A single-stack approach might raise concerns about limitations in using specialized tools. This proposal allows for exceptions when functionalities beyond the capabilities of Godot, Elixir, and Phoenix are required, ensuring flexibility for unique project needs.

## The Road Not Taken

Alternative approaches, such as a multi-stack approach or relying solely on Godot without cloud capabilities, were considered less efficient and less aligned with the goals of streamlining development and fostering consistency.

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

1.  [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2.  [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3.  [Elixir Lang](https://elixir-lang.org/) - Official website for the Elixir programming language.
4.  [Phoenix Framework](https://www.phoenixframework.org/) - Official website for the Phoenix web framework.
5.  [BenBot](https://github.com/benbot) - GitHub profile of BenBot, a contributor to the V-Sekai project.

AI assistant Aria assisted with this article.
