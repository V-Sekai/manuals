# Draft: Single-Stack Prototyping Approach

## The Context

Rapid prototyping is essential for validating ideas and iterating quickly within the V-Sekai development ecosystem. This proposal suggests a single-stack approach to enhance flexibility and streamline the prototyping process, leveraging Godot Engine's versatility and extending its capabilities with Elixir and Phoenix for cloud functionalities.

## The Problem Statement

Utilizing multiple technology stacks for prototypes can introduce complexities and inefficiencies. A single-stack approach can foster consistency, knowledge sharing, and a more streamlined development experience. However, Godot Engine alone may not encompass all necessary functionalities, particularly for cloud-based services.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

This proposal recommends adopting a single-stack approach centered around Godot, while strategically integrating Elixir and Phoenix to address specific needs:

- **Godot:** Leverage Godot's versatility for game-related prototypes, VR/AR experiences, and foundational web-based applications. Utilize Godot's primary scripting language, GDScript, and existing integration with V-Sekai. Explore Godot's web export capabilities and relevant libraries for web-based prototyping.

- **Elixir + Phoenix:** Integrate Elixir and Phoenix to provide robust backend support and cloud functionalities. To streamline Elixir-based prototyping, utilize the following setup:

  1.  **Project Setup:** Utilize the following Elixir commands to generate a Phoenix project with Ash and pre-configured user authentication:

      ```bash
      mix igniter.new --with phx.new --install ash,ash_postgres,ash_phoenix,ash_authentication,ash_authentication_phoenix,ash_admin
      mix ash_authentication.add_strategy magic_link
      mix ash.codegen initial
      mix ecto.create
      mix ash.setup
      ```

  2.  **Rapid Iteration:** Develop core features using Phoenix's LiveView for real-time, interactive user interfaces.

This approach allows developers to focus on a primary toolset (Godot) while seamlessly incorporating complementary technologies (Elixir and Phoenix) to address specific needs and maintain a cohesive development experience.

## The Benefits

- Enhanced Flexibility: Godot provides a versatile foundation for various prototypes, while Elixir and Phoenix extend its capabilities for cloud functionalities.
- Improved Consistency: Centering on Godot as the primary stack promotes consistency and knowledge sharing among developers.
- Reduced Complexity: This approach streamlines development by focusing on a primary toolset with strategic integrations, minimizing the overhead of managing disparate technologies.
- Comprehensive Solution: The combination of Godot, Elixir, and Phoenix provides a comprehensive solution for prototyping diverse applications, from games and VR/AR experiences to web-based tools with robust cloud functionalities.

## The Downsides

- Learning Curve: Developers may need to invest time in mastering Godot, Elixir, and Phoenix to effectively utilize this integrated approach.
- Integration Challenges: Ensuring seamless integration between Godot and Elixir/Phoenix may require careful planning and development effort.

## The Road Not Taken

Alternative approaches, such as adopting a multi-stack approach with disparate technologies or relying solely on Godot without cloud capabilities, were considered but deemed less efficient and less aligned with the goals of streamlining, consistency, and comprehensive functionality.

## The Infrequent Use Case

In situations where highly specialized technologies are required for specific functionalities beyond the capabilities of Godot, Elixir, and Phoenix, exceptions to the single-stack approach can be considered on a per-project basis.

## In Core and Done by Us

This proposal aligns with our core values of efficiency, consistency, and developer empowerment. It will be implemented by the V-Sekai development team.

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
6.  [hexdocs.pm/webauthn_components](https://hexdocs.pm/webauthn_components/readme.html)

AI assistant Aria assisted with this article.
