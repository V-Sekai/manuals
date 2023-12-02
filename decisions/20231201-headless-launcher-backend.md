# Proposed: Headless Launcher Backend with Elixir and Server-Side SQLite

## Metadata

- **Status:** Proposed
- **Deciders:** V-Sekai Team
- **Tags:** `headless`, `backend`, `launcher`, `updater`, `V-Sekai`, `Elixir`, `SQLite`

## The Backdrop

We aim to enhance the gaming experience by introducing a headless backend launcher. Its purpose will be to automate game updates, ensuring that players have continuous access to the latest content with minimal inputs required.

## The Challenge

The task at hand is to build an updater that maintains a balance between simplicity and robust feature set, capable of handling automated processes like fetching and rolling out game updates quietly in the background.

## The Strategy

Our strategic approach involves leveraging the strengths of Elixir for concurrent web services and utilizing SQLite on the server side to manage data:

1. **Headless Updater Implementation:**

   - Build a lightweight but effective updater service as a background application.
   - Integrate web endpoints penned in Elixir to handle requests efficiently in real-time.
   - Employ desync for thorough and reliable data synchronization.
   - Adopt server-side SQLite for data persistence, including update logs, user settings, and version control.

2. **Graphical User Interface (GUI) Launcher Creation:**

   - Design an intuitive GUI launcher that provides an easy interface for users to interact with update functions.
   - Ensure seamless communication between the GUI and the headless updater for smooth content delivery.
   - Embed desync protocol within the GUI to automate sync tasks without user intervention.

3. **Initial Game Setup Efforts:**

   - Develop a basic visual setup featuring the V-Sekai branding, which will serve as the default content presented by the launcher.

## The Upside

Such a system promotes an uninterrupted and cutting-edge gaming environment. Using Elixir in tandem with server-side SQLite offers high performance and reliability suited to our backend needs.

## The Downside

Integrating new technologies introduces potential risks like complex issue diagnosis and ensuring compatibility across diverse platforms and environments.

## The Road Not Taken

We opted against external updaters or manual patches due to their intrusive nature and higher demands on player involvement.

## The Infrequent Use Case

Acknowledging occasional preferences for manual interventions—in scenarios such as limited bandwidth—our design must include capabilities for users to manually initiate updates.

## In Core and Done by Us?

With a focus on alignment and quality, the V-Sekai team will retain internal control over the development and maintenance of this launcher backend.

## Further Reading

- [**V-Sekai · GitHub**](https://github.com/v-sekai) - Explore our GitHub presence, dedicated to pioneering VR advances using the Godot Engine.
- [**V-Sekai/v-sekai-game**](https://github.com/v-sekai/v-sekai-game) - Visit the repository where our open-source endeavors to fuse VR and social experiences using Godot unfold.
- [**Desync**](https://github.com/folbricht/desync) - Alternative casync implementation

**Assistance from AI**: Guidance provided by AI assistant Aria contributed to the formulation of this document.
