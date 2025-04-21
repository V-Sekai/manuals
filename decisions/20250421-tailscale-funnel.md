# Accepted: Tailscale Funnel (System-Level Service)

## The Context

Exposing virtual machines (VMs) to external networks securely and efficiently is a common requirement in development and production environments. Tailscale Funnel provides a simple and secure way to expose services running on a VM to the internet using Tailscale's mesh VPN and authentication features. By leveraging systemd, we can manage Tailscale Funnel as a system-level service for consistent and reliable operation.

## The Problem Statement

Currently, exposing VMs to external networks often involves complex configurations, such as setting up reverse proxies, managing firewall rules, or configuring NAT. These methods can be error-prone and require significant manual effort. Tailscale Funnel simplifies this process but needs to be integrated as a system-level service for ease of use and reliability.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

We propose creating a systemd service unit file to manage Tailscale Funnel for exposing a specific port (e.g., 8888) on a VM. The service will ensure that Tailscale Funnel starts automatically on boot and restarts on failure. Below is the systemd unit file configuration:

```ini
File: /etc/systemd/system/tailscale-funnel.service
[Unit]
Description=Tailscale Funnel for Port 8888
After=network.target tailscaled.service
Requires=tailscaled.service

[Service]
Type=simple
ExecStart=/usr/bin/tailscale funnel --bg 8888
Restart=on-failure
RestartSec=5s

ExecStartPre=/bin/sleep 5

[Install]
WantedBy=multi-user.target
```

Commands to enable and start the service:

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now tailscale-funnel.service
sudo systemctl status tailscale-funnel.service
```

## The Benefits

- Simplifies the process of exposing VMs to external networks.
- Provides a secure and authenticated connection using Tailscale.
- Ensures reliability with systemd's restart and dependency management features.
- Reduces manual configuration effort for developers and system administrators.

## The Downsides

- Requires Tailscale to be installed and configured on the VM.
- Limited to environments where Tailscale is supported.

## The Road Not Taken

- Using traditional methods like reverse proxies or NAT configurations, which are more complex and less secure.
- Developing a custom solution for exposing VMs, which would require significant effort and maintenance.

## The Infrequent Use Case

- Scenarios where the VM does not have internet access or cannot run Tailscale.
- Environments with strict network policies that do not allow Tailscale connections.

## In Core and Done by Us

This proposal is core to improving the development and deployment workflow for V-Sekai. The implementation will be handled by the V-Sekai development team.

## Status

Status: Accepted <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai Development Team
- fire

## Tags

- Networking, Tailscale, Systemd, VM, Security

## Further Reading

1. [Tailscale Funnel Documentation](https://tailscale.com/kb/1132/tailscale-funnel/)
2. [Systemd Service Unit Documentation](https://www.freedesktop.org/software/systemd/man/systemd.service.html)

---

### Game Development Jargon

1. **Tailscale**: A mesh VPN service that simplifies secure networking between devices.
2. **Systemd**: A system and service manager for Linux operating systems.
3. **Funnel**: A Tailscale feature for exposing local services to the internet securely.
4. **VM (Virtual Machine)**: A software-based emulation of a physical computer.
