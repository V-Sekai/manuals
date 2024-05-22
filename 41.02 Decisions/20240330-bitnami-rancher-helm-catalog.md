# Proposed: Installing Helm Chart from a Git Repository using Rancher

## Context

Rancher is an open-source platform for managing Kubernetes at scale. It provides a user-friendly interface for deploying, scaling and managing applications on top of Kubernetes.

## Problem Statement

You want to install a Helm chart from a specific location, in this case, a Git repository: `https://charts.bitnami.com/bitnami`, using Rancher.

## Solution

Rancher does not directly support installing Helm charts from a Git repository. However, you can add the Git repository as a catalog in Rancher, and then use Rancher's UI to deploy the chart.

Here's how you can do it:

1. Navigate to the Rancher UI.
2. Go to Global -> Catalogs.
3. Click on "Add Catalog", fill in the details:
   - Name: Give your catalog a name.
   - URL: Enter the URL of your Git repository (`https://charts.bitnami.com/bitnami`).
   - Branch: Specify the branch to use (usually `master` or `main`).
4. Click on "Create".
5. Now, you can navigate to your project, click on "Apps" -> "Launch", and you should see your newly added catalog. You can select the chart you want to install and follow the prompts.

## Benefits

This method allows you to manage and deploy Helm charts directly from the Rancher UI, providing a more user-friendly way to handle deployments.

## Downsides

The main downside is that this method requires manual setup in the Rancher UI, which might not be ideal for automated workflows.

## The Road Not Taken

An alternative approach would be to clone the Git repository locally, package the chart into a .tgz file, and upload it directly to Rancher.

## Infrequent Use Case

This approach is particularly useful when you want to manage your Helm charts and deployments through a user-friendly interface, rather than dealing with command-line tools.

## In Core and Done by Us

This solution is based on the core functionality provided by Rancher and does not require any additional tools or services.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine.
3. [bitnami/charts](https://github.com/bitnami/charts/tree/main)

This article was assisted by Aria, your AI assistant.
