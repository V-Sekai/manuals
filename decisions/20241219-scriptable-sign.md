# Draft: Scriptable Interactive Signs in V-Sekai

## The Context

V-Sekai is a social VR platform designed to foster user interaction and creative expression within a shared virtual world. Effective communication tools and user-generated content are essential to this goal.

## The Problem Statement

Currently, V-Sekai offers limited options for users to leave persistent messages or communicate asynchronously within the environment. This proposal introduces interactive signs as a new, scriptable communication feature, leveraging the existing Godot-sandbox.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

### Sign Creation as Scriptable Objects

- Users will have access to a simplified scripting environment within the Godot-sandbox to create and customize signs.
- They can define the sign's appearance (text, emojis, images), interaction logic (like buttons, animations), and integrate with other game elements.
- Pre-built templates and scripting examples will be provided for less experienced users.

### Sign Placement with In-World Editor

- Users can place and manipulate signs directly in the V-Sekai world using an in-world editor tool, leveraging existing Godot editor functionalities.

### "Like" System Integration with Godot Scripting

- The "like" functionality will be exposed through Godot scripting, allowing users to customize its behavior, create unique animations and sounds, or integrate the "like" count with other game mechanics.

### User Interface Integration with Godot Signals

- Godot's signal system will connect sign interactions with the user interface, enabling dynamic updates of "like" counts and other relevant information in the user's HUD or profile.

## The Benefits

- **Enhanced Communication:** Scriptable signs provide a flexible channel for asynchronous communication, allowing users to leave messages, share thoughts, or provide information in engaging ways.
- **Increased Social Interaction:** The customizable "like" system encourages interaction and feedback between users, fostering a sense of community.
- **Creative Expression and User-Generated Content:** Empowers users to personalize the V-Sekai world and express themselves creatively by designing unique sign experiences.
- **Deeper Integration with V-Sekai:** Leverages existing Godot infrastructure for a more cohesive and extensible implementation.
- **Potential for Community-Driven Development:** Users can share and collaborate on sign scripts, fostering a vibrant ecosystem of user-generated content.

## The Downsides

- **Learning Curve:** May require users to have some familiarity with Godot scripting or be willing to learn. **Mitigation:** Provide comprehensive tutorials and readily available examples.
- **Security and Stability:** Robust security measures are crucial to prevent malicious scripts from affecting the V-Sekai environment. **Mitigation:** Implement a script review process and sandboxing mechanisms.
- **Performance Impact:** Careful optimization of user-created scripts will be essential to maintain overall performance. **Mitigation:** Provide clear guidelines and limitations on script complexity.

## The Road Not Taken

Simple, non-scriptable signs with a fixed set of features were considered. However, leveraging the Godot-sandbox for scriptable signs offers greater flexibility, user empowerment, and potential for community-driven content creation, aligning better with V-Sekai's open-source philosophy.

## In Core and Done by Us

This feature directly supports V-Sekai's core values of social interaction, user-generated content, and community involvement. The V-Sekai development team is best suited to implement this functionality, ensuring seamless integration with the existing platform and maintaining a consistent user experience.

## Status

Status: Draft

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai, Communication, User-Generated Content, Social Interaction, Signs, Godot, Scripting

## Further Reading

1.  [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2.  [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3.  [Godot Engine Documentation](https://docs.godotengine.org/) - Official documentation for the Godot Engine, including scripting and GDScript.

AI assistant Aria assisted with this article.
