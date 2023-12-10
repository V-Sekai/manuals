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

#### Mac OS Server Instructions:

1. **Install Appium Server**: Install the Appium server on the Mac using `sudo npm install -g appium@next`. Make sure Node.js version 12 or higher is installed.
2. **Start Appium Server**: Launch the server using the `appium` command.
3. **Install Necessary Drivers**: For iOS, install drivers with `appium driver install xcuitest`.
4. **Verify Installation**: Check the setup with `appium-doctor` using commands like `appium-doctor --version` and `appium-doctor —-ios`.
5. **Manage Drivers**: Use `appium driver list` and `appium driver update [driverName]`.
6. **Use Plugins**: Install plugins with `appium plugin install [pluginName]` and integrate them using `appium --use-plugins=[appiumPlugin]`.

#### Windows Client Instructions:

1. **Install Appium Client**: On Windows, install the Appium client using Node Package Manager (NPM) with the command `npm install -g appium`.
2. **Configure Client**: Set up your test scripts or Appium client configuration to point to the Appium server running on the Mac. This includes specifying the server's IP address and port number.

Ensure that the network settings and firewall configurations on both the Windows client and the Mac server are compatible for seamless communication.

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
