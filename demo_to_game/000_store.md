# Setup Summary

This guide provides a step-by-step process to set up Dokku, configure SeaweedFS for local file storage with S3 compatible services, deploy an Elixir application named 'uro', and start CockroachDB and Godot Engine Server.

# Table of Contents

1. [Hardware Requirements](#hardware-requirements)
2. [Install Dokku](#step-1-install-dokku)
3. [Setup Dokku](#step-2-setup-dokku)
4. [Install and Configure SeaweedFS](#step-3-install-and-configure-seaweedfs)
5. [Deploying the Elixir Application](#step-4-deploying-the-elixir-application)
6. [Starting CockroachDB in Dokku](#step-5-starting-cockroachdb-in-dokku)
7. [Starting Godot Engine Server](#step-6-starting-godot-engine-server)
8. [Exposing the Servers using Tailscale](#exposing-the-servers-using-tailscale)

## Hardware Requirements

The following hardware requirements are recommended for the setup:

- CPU: 2 GHz or faster processor
- Memory: 4 GB RAM
- Storage: SSD with at least 20 GB of available space
- Network: Broadband Internet connection

Please note that a GPU is not required for this setup.

## Step 1: Install Dokku

First, you need to install Dokku. You can do this on a Ubuntu system with the following commands:

```bash
wget https://raw.githubusercontent.com/dokku/dokku/v0.24.10/bootstrap.sh;
sudo DOKKU_TAG=v0.24.10 bash bootstrap.sh
```

## Step 2: Setup Dokku

After installation, you can then proceed to set up Dokku by visiting your server's IP address in your web browser.

## Step 3: Install and Configure SeaweedFS

Next, you need to install SeaweedFS and start the SeaweedFS master and volume servers:

```bash
wget https://github.com/chrislusf/seaweedfs/releases/download/2.59/linux_amd64.tar.gz
tar -zxvf linux_amd64.tar.gz
./weed master
./weed s3
```

This will start the SeaweedFS primary server and the S3 gateway.

## Step 4: Deploying the Elixir Application

Create a new app on Dokku and push your app to Dokku:

```bash
dokku apps:create uro
git remote add dokku dokku@your-server-ip:uro
git push dokku master
```

## Step 5: Starting CockroachDB in Dokku

To start CockroachDB in Dokku, install the Dokku docker-options plugin, set the Docker options for your app, pull the CockroachDB Docker image, and start CockroachDB:

```bash
sudo dokku plugin:install https://github.com/dokku/dokku-docker-options.git docker-options
dokku docker-options:add uro deploy "-p 26257:26257"
dokku docker-options:add uro deploy "-p 8080:8080"
docker pull cockroachdb/cockroach:v20.2.8
docker run -d --name=cockroachdb -p 26257:26257 -p 8080:8080 cockroachdb/cockroach:v20.2.8 start --insecure
```

## Step 6: Starting Godot Engine Server

Starting a Godot engine server involves pulling the Godot Docker image, setting the Docker options for your app, and creating the server:

```bash
# The version is for reference and is not the correct Godot Engine image tag.
docker pull godotengine/godot:4.2.0
dokku docker-options:add uro deploy "-p 47989:47989"
dokku docker-options:add uro deploy "-p 6007:6007"
docker run -d --name=godot-server -p 47989:47989 -p 6007:6007 godotengine/godot:4.2.0
```

## Exposing the Servers using Tailscale

Tailscale can be used to securely expose your 'uro' server and game server to the world. Here's how you can do it:

1. Install Tailscale on your server:

```bash
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.gpg | sudo apt-key add -
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.list | sudo tee /etc/apt/sources.list.d/tailscale.list
sudo apt-get update
sudo apt-get install tailscale
```

2. Authenticate Tailscale:

```bash
sudo tailscale up
```

Follow the prompts to authenticate Tailscale with your Tailscale account.

3. Now, your servers should be accessible from any device logged into your Tailscale network. You can check the IP addresses assigned to your servers by Tailscale with the following:

```bash
tailscale ip -4
```

Please note that you'll need to replace `your-server-ip` with the actual IP address of your server. Also, the port numbers used here are just examples. You should use the port numbers that are appropriate for your setup.

## TODO: Generate the certificate with Caddy

Instruct how to generate certificates with Caddy.