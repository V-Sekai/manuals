# Proposed: Elixir Livebook on Fedora 39

## Metadata

- **Status**: Proposed
- **Deciders**: V-Sekai Team
- **Tags**: `Elixir`, `Livebook`, `Fedora 39`

## Backdrop

The initiative is to leverage Elixir NX for data science and numerical computing applications relevant to V-Sekai.

## Challenge

Ensuring a successful installation and configuration of Elixir Livebook on Fedora 39, which will serve as a development platform.

## Strategy

- Evaluate compatibility between Elixir Livebook and Fedora 39.
- Identify all dependencies required for Elixir Livebook.
- Create comprehensive guidelines for the installation process.
- Execute a test run of the install procedure on a Fedora 39 system.

Create a dedicated user for running Livebook and determine an appropriate location for the installation, such as `/opt/livebook`.

```bash
sudo yum groupinstall -y 'Development Tools' 'C Development Tools and Libraries'
sudo dnf install -y \
  autoconf \
  ncurses-devel \
  wxGTK3-devel \
  wxBase3 \
  openssl-devel \
  java-1.8.0-openjdk-devel \
  libiodbc \
  unixODBC-devel.x86_64 \
  erlang-odbc.x86_64 \
  libxslt \
  fop \
  automake \
  readline-devel \
  git \
  gcc \
  unzip \
  curl

# As root or using sudo
useradd --system --create-home --home-dir /opt/livebook livebook
chown -R livebook: /opt/livebook
su - livebook

# Clone the repository as the livebook user
git clone https://github.com/livebook-dev/livebook.git /opt/livebook/app
cd /opt/livebook/app
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
source ~/.bashrc
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf install erlang 26.2.1
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir 1.15.7-otp-26
asdf global elixir 1.15.7-otp-26
erl -version
elixir -v
yes | mix local.hex
```

To insert or overwrite the existing systemd service configuration for Elixir Livebook directly from the shell, you can use the following commands:

First, open your terminal and use `cat` combined with a here-document to overwrite the file with the new configuration:

```bash
sudo cat > /etc/systemd/system/livebook.service <<EOF
[Unit]
Description=Elixir Livebook server
After=network.target

[Service]
User=livebook
WorkingDirectory=/opt/livebook/app
ExecStart=/usr/bin/mix phx.server
Environment=MIX_ENV=prod
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

Make sure that you have the necessary permissions to write to `/etc/systemd/system/`.

After saving the file, reload systemd to apply the changes:

```bash
sudo systemctl daemon-reload
sudo systemctl enable livebook.service
sudo systemctl restart livebook.service
```

Verify that the service is running correctly with:

```bash
sudo systemctl status livebook.service
```

Remember to adjust the path specified in the `ExecStart` directive if required and set any additional environment variables as needed.

## Upside

- Delivers a real-time collaborative tool for Elixir development.
- Aids in verifying Elixir NX’s capabilities through visualization.
- Streamlines the code development cycle with instant feedback.

## Downside

- Allocation of time needed for the seamless functioning of Livebook on Fedora 39.
- Dependencies might add a layer of complexity in ongoing maintenance.
- The initial setup could pose challenges for non-expert users.

## Road Not Taken

Other tools and languages were assessed but did not fulfill V-Sekai's requirements as effectively as Elixir Livebook.

## Infrequent Use Case

Evaluating occasional usage to justify the demand for an efficient installation approach.

## In Core and Done by Us?

Determining if this integration should be centralized within V-Sekai's primary offerings and whether internal resources can achieve this implementation.

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account of V-Sekai's developer community.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - Repository dedicated to V-Sekai's project for merging social VR and metaverse elements with Godot Engine.

_Aria, an AI assistant, contributed to the drafting of this proposal._
