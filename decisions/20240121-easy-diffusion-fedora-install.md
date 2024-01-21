# Proposed: Easy Diffusion AI Setup on Linux Systems

## Metadata

- **Status**: Proposed
- **Deciders**: Development Team
- **Tags**: `AI`, `Easy Diffusion`, `Linux`

## Backdrop

The goal is to streamline the installation process of Easy Diffusion for creating AI-generated images on Linux systems.

## Challenge

The challenge lies in ensuring a simple and repeatable setup process for installing and configuring Easy Diffusion on various Linux distributions.

## Strategy

- Assess compatibility between Easy Diffusion and popular Linux distributions.
- Identify dependencies and prerequisites required for Easy Diffusion.
- Develop a script or instructions for a hassle-free setup experience.
- Conduct test installations across different environments.

First, download the latest release of Easy Diffusion for Linux. Then create a dedicated user for running Easy Diffusion and establish a standard location for the tool, like `/opt/easy_diffusion`.

```bash
# As root or using sudo
dnf install curl bzip2 -y
useradd --system --create-home --home-dir /opt/easy_diffusion easy_diffusion_user
mkdir -p /opt/easy_diffusion
curl -L https://github.com/cmdr2/stable-diffusion-ui/releases/latest/download/Easy-Diffusion-Linux.zip -o /opt/easy_diffusion/Easy-Diffusion-Linux.zip
unzip /opt/easy_diffusion/Easy-Diffusion-Linux.zip -d /opt/easy_diffusion/
chown -R easy_diffusion_user: /opt/easy_diffusion
chmod +x /opt/easy_diffusion/easy-diffusion/start.sh
```

A systemd service configuration is used to manage the Easy Diffusion process:

```bash
sudo bash -c 'cat > /etc/systemd/system/easy-diffusion.service <<EOF
[Unit]
Description=Easy Diffusion AI Image Generation Tool
After=network.target

[Service]
User=easy_diffusion_user
WorkingDirectory=/opt/easy_diffusion/easy-diffusion
ExecStart=/bin/bash /opt/easy_diffusion/easy-diffusion/start.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF'
```

Enable and start the service as follows:

```bash
sudo systemctl daemon-reload
sudo systemctl enable easy-diffusion.service
sudo systemctl start easy-diffusion.service
```

Check the status to confirm correct operation:

```bash
sudo systemctl status easy-diffusion.service
```

To view detailed logs, use:

```bash
journalctl -u easy-diffusion.service
```

## Upside

- Automates the setup process, minimizing user intervention.
- Offers consistency across different installations.
- Simplifies management with systemd integration.

## Downside

- Requires thorough testing to ensure broad compatibility.
- Systemd is not universally adopted among all Linux distributions.
- Additional effort is needed to maintain the service file and update paths as necessary when new versions are released.

## Further Reading

1. [**Download** for Linux](https://github.com/cmdr2/stable-diffusion-ui/releases/latest/download/Easy-Diffusion-Linux.zip): Official source code and documentation.

_Aria, an AI assistant, provided support in formulating this proposal._
