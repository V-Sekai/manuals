### Client-Side Game Updater with Server-Side Endpoint

#### Metadata

- **Status:** Proposed
- **Deciders:** V-Sekai Team
- **Tags:** V-Sekai, client-side, updater, backend, SAAS

#### Backdrop

The intent is to create a client-side game updater system that interfaces with a server-side endpoint to facilitate consistent and automated game updates.

#### Challenge

To build a robust client-side updater mechanism that seamlessly interacts with the server to download and install game patches without manual user intervention.

#### Strategy

Our approach involves creating an updater system on the client side while using a backend API to manage updates:

1. **Client-Side Updater Service:**

   - Implement an updater within the client's environment capable of checking for new updates.
   - Utilize a robust version control system for the client-side updater.
   - Isolate dependencies and configuration, ensuring no conflict with the game's operational dependencies.
   - Separate the configuration management to not be hardcoded within the updater's codebase.

2. **Server-Side Update Endpoint:**

   - Deploy a server-side service using Elixir to handle update requests from the client-side updater.
   - Structure the endpoint to authenticate clients and authorize update actions securely.
   - Design the update service to provide update packages, changelogs, and status reports back to clients.

3. **Integration of GUI Launcher with Backend:**

   - Develop a graphical user interface (GUI) launcher on the client side that communicates with the server-side update endpoint.
   - Define clear communication protocols for the GUI launcher to retrieve update information and execute update operations.

4. **Deployment and Database Management:**

   - Employ server-side SQLite for efficient database management of version metadata and update logs.
   - Design the service to run efficient, stateless processes that scale with the user base.
   - Ensure consistency across development, staging, and production environments by using containerization and continuous integration strategies.

5. **Game Setup Efforts:**
   - Develop a basic visual setup with V-Sekai branding.

#### Upside

This strategy allows streamlined distribution of updates directly to users while keeping the complexity away from end-users, enabling a frictionless gaming experience.

#### Downside

Diverse technologies between client and server can introduce challenges; however, careful design and planning can mitigate potential issues.

#### Road Not Taken

Options like direct game patching or standalone updaters have been ruled out in favor of a more integrated solution that simplifies the user experience.

#### Infrequent Use Case

Designed to account for scenarios where users may need to trigger updates manually due to network restrictions or other constraints.

#### Core and Done by Us?

Absolutely. The core development and maintenance of both the client-side updater and the server-side endpoint will be managed in-house by the V-Sekai team.

#### Further Reading

- [**V-Sekai GitHub**](https://github.com/v-sekai) - Our repository showcasing VR experiences and developments with Godot Engine.
- [**V-Sekai Game Repo**](https://github.com/v-sekai/v-sekai-game) - This repository hosts our open-source, community-centric VR game source code.
- [**Desync**](https://github.com/folbricht/desync) - A tool being evaluated for its content synchronization capabilities as a possible fallback.

This comprehensive design plan delineates a cohesive structure for a client-server architecture aimed at delivering seamless game updates and a high-quality user experience.
