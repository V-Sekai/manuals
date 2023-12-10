# Proposal: Automating Game Testing Process Using Appium 2

## Metadata

- **Status**: Proposed
- **Deciders**: V-Sekai, fire
- **Tags**: V-Sekai

## Context

In the field of game development, it's crucial to provide a seamless user experience across various platforms. This requires the implementation of effective testing methodologies.

## Problem

Our primary challenge is automating the testing process using Appium. A significant part of this strategy involves converting FBX files, which are commonly used formats for 3D models and animations, into GLB format.

## Solution

To set up and use Appium 2 for a client-server configuration, specifically between a Windows client and a Mac OS server, follow these steps:

1. Appium 2 introduces several changes like decoupling individual Appium drivers, introducing Appium plugins, supporting W3C protocol standards, and updates to Appium capabilities【28†source】.
2. On your Mac, install the latest version of Appium server using the command `sudo npm install -g appium@next`. Ensure that Node.js version 12 or higher is installed. To start the Appium server, use the `appium` command and verify the version with `appium -v`.
3. In Appium 2, drivers are installed individually.
4. Use the `appium-doctor` npm package to verify installations. Commands like `appium-doctor --version`, `appium-doctor —-windows`, can be used to check the setup for Android and iOS devices.
5. To list and update Appium drivers, use commands like `appium driver list`, `appium driver list --updates`, and `appium driver update [driverName]`.
6. Appium 2 allows the use of plugins to extend its functionality. Install plugins using `appium plugin install [pluginName]` and use them with the server using `appium --use-plugins=[appiumPlugin]`.
7. DesiredCapabilities in Appium are now renamed as Appium capabilities and should be prefixed with the `appium:` keyword. This is used in Appium Inspector or in the code to launch simulators or real devices.
8. There's an `appium:options` section introduced to capture multiple Appium capabilities. This is used in configuration files like WebdriverIO's `wdio.conf.ts` file.

Ensure that the network and firewall settings on both the Windows (client) and Mac OS (server) machines allow for proper communication between them. Also, keep in mind the specific requirements for the mobile platform you are testing.

## Benefits

The proposed strategy will ensure a high-quality gaming experience by automating the testing process. It will also save time and resources by reducing manual testing efforts.

## Risks

The implementation of this strategy may require substantial resources and could potentially present unforeseen challenges. Additionally, there might be compatibility issues between different versions of Appium and the operating systems.

## Alternatives

We have considered other testing frameworks, but our proposed strategy with Appium offers the best balance between effectiveness and efficiency.

## Limitations

Our strategy might not cover infrequent or edge cases in game development. However, these will be identified and addressed as they arise.

## Ownership

Yes, this strategy is core to our project and will be implemented by our team.

## References

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine

Assisted by Aria, an AI assistant.
