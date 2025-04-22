# Accepted: Jupyter Notebook (System-Level Service)

## The Context

Running Jupyter Notebook as a system-level service ensures that it is always available and can be managed consistently using systemd. This is particularly useful for development environments where Jupyter Notebook is frequently used for data analysis, machine learning, or other tasks.

## The Problem Statement

Manually starting Jupyter Notebook every time it is needed can be tedious and error-prone. Additionally, without a system-level service, there is no built-in mechanism to automatically restart the notebook server in case of failure or after a system reboot.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install jupyterlab
```

We propose creating a systemd service unit file to manage Jupyter Notebook. The service will ensure that the notebook server starts automatically on boot, restarts on failure, and runs under a specified user account. Below is the systemd unit file configuration:

```ini
File: /etc/systemd/system/jupyter-notebook.service
[Unit]
Description=Jupyter Notebook Service
After=network.target tailscale-funnel.service

[Service]
User=<username>
ExecStart=/home/linuxbrew/.linuxbrew/bin/jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser #  --ServerApp.token='<password>'
WorkingDirectory=/home/<username>/Documents/vsk-docker-python-notebook
Restart=always
RestartSec=3
Environment=PYTHONUNBUFFERED=1
Environment="PATH=/home/<username>/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

[Install]
WantedBy=multi-user.target
```

Commands to enable and start the service:

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now jupyter-notebook.service
sudo systemctl status jupyter-notebook.service
```

## The Benefits

- Automates the startup and management of Jupyter Notebook.
- Ensures the notebook server is always available after system reboots.
- Provides a consistent and reliable way to manage the notebook server using systemd.

## The Downsides

- Requires systemd, which is not available on all operating systems.
- The service must be configured with a specific user and working directory, which may require additional setup.

## The Road Not Taken

- Manually starting Jupyter Notebook each time it is needed.
- Using alternative tools or scripts to manage the notebook server, which may lack the robustness of systemd.

## The Infrequent Use Case

- Scenarios where Jupyter Notebook is only needed occasionally and does not justify running as a persistent service.
- Environments where systemd is not available or supported.

## In Core and Done by Us

This proposal is core to improving the development workflow for V-Sekai. The implementation will be handled by the V-Sekai development team.

## Status

Status: Accepted <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai Development Team
- fire

## Tags

- Jupyter, Systemd, Automation, Development, Linux

## Further Reading

1. [Jupyter Notebook Documentation](https://jupyter.org/documentation)
2. [Systemd Service Unit Documentation](https://www.freedesktop.org/software/systemd/man/systemd.service.html)

---

### Game Development Jargon

1. **Jupyter Notebook**: An open-source web application that allows you to create and share documents that contain live code, equations, visualizations, and narrative text.
2. **Systemd**: A system and service manager for Linux operating systems.
