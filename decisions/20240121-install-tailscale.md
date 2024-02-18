# Proposal: Installing Tailscale on Linux Fedora 39

## Metadata

- **Status:** Proposed
- **Deciders:** V-Sekai
- **Tags:** V-Sekai

## Context

In the current digital age, secure and efficient networking is a necessity. Tailscale provides a secure network connection between devices, regardless of location. This proposal aims to guide the installation of Tailscale on Linux Fedora 39.

## Problem

The challenge lies in setting up Tailscale on Linux Fedora 39. The process involves adding the Tailscale repository, installing the software, enabling the service, and connecting to the Tailscale network.

## Solution

Here's a concise step-by-step guide:

```bash
# Add the Tailscale repository
sudo dnf config-manager --add-repo https://pkgs.tailscale.com/stable/rhel/8/tailscale.repo

# Install Tailscale
sudo dnf install tailscale -y

# Enable and start the service
sudo systemctl enable --now tailscaled

# Connect to your Tailscale network and authenticate in your browser
sudo tailscale up

# Find your Tailscale IPv4 address
tailscale ip -4

# Disable key expiry
```

## Pros

1.  Secure: Tailscale uses end-to-end encryption for all traffic.
2.  Easy to set up: The process is straightforward and can be done quickly.
3.  Scalable: Tailscale can handle connections between a large number of devices.

## Cons

1.  Requires internet access: Tailscale requires an active internet connection to establish the network.
2.  Compatibility issues: There may be compatibility issues with certain applications or systems.

## Alternatives Considered

1.  OpenVPN: A well-established VPN solution, but it requires more complex setup and maintenance.
2.  WireGuard: Another VPN solution that is simpler and faster but less mature.

## Rare Use Case

This solution is particularly useful for remote teams who need to access shared resources securely, or for individuals who want to connect their devices in a private network.

## In-House Development?

In-house development of a similar solution would require significant resources and expertise in networking and security. It is more cost-effective and efficient to use an existing solution like Tailscale.

## References

1.  [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2.  [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine.

_This proposal was assisted by Aria, the AI assistant._
