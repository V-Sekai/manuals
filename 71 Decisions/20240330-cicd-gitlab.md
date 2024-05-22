# Proposed: CI/CD Setup with Docker and Other Platforms

## Context

The V-Sekai project is focused on enhancing the Godot Engine by introducing social VR capabilities. To ensure a seamless development process across various environments, we need a robust CI/CD setup. This setup should cater to the diverse platforms our developers and contributors use, including Linux, macOS, Windows, Docker, and Kubernetes clusters.

## Problem Statement

Our current CI/CD setup does not efficiently cover all operating systems and environments our developers use. This leads to inconsistent build and test results across different platforms. This inconsistency hinders our ability to rapidly develop and deploy features for the V-Sekai project.

## Proposed Solution

To address this, we propose registering GitLab Runners for Linux, macOS, Windows, Docker, and Kubernetes. Each runner will be configured to handle builds and tests specific to its platform. Here's a simplified view of how each runner would be set up:

For Linux, macOS, and Windows Runners:

1. Install GitLab Runner on the respective OS.
2. Use the `gitlab-runner register` command with the platform-specific registration token.
3. Configure the runner to use an executor appropriate for the OS (e.g., shell for Linux/macOS, PowerShell for Windows).

For Docker Runner:

1. Install Docker on the host machine.
2. Pull the GitLab Runner Docker image.
3. Run the GitLab Runner container with the Docker executor.

For Kubernetes Runner:

1. Deploy the GitLab Runner Helm chart to the Kubernetes cluster.
2. Configure the runner to use the Kubernetes executor.
3. Use a registration token from the GitLab instance to link the Kubernetes runner.

## Benefits

- **Consistency Across Platforms**: Ensures builds and tests are consistent across all supported platforms.
- **Increased Development Speed**: Faster feedback loops for developers working on different platforms.
- **Scalability**: Kubernetes runners can dynamically scale to handle increased loads, improving CI/CD pipeline performance.

## Downsides

- **Maintenance Overhead**: Requires initial setup and ongoing maintenance of runners across multiple platforms.
- **Complexity**: Adds complexity to the CI/CD setup, especially managing different executors and environments.

## Alternatives Not Chosen

- Relying solely on cloud-based CI/CD services. While simpler, this would not provide the level of control and customization needed for our specific development needs.

## Infrequent Use Case

- Handling builds or tests that require very specific environment configurations not commonly used by the development team. These cases might still need bespoke solutions outside the standard CI/CD pipeline.

## In Core and Done by Us

This initiative is core to our mission of enhancing the Godot Engine with social VR capabilities. It will be executed by the V-Sekai development team, ensuring alignment with our project's goals and technical standards.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine

Assisted by Aria, your AI assistant.
