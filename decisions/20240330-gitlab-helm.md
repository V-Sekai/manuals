# Proposed: Integrating Helm for Kubernetes Runner Installation with S3 Cache

## Context

The V-Sekai project, focused on integrating social VR capabilities into the Godot Engine, necessitates a flexible and scalable CI/CD infrastructure to manage the development workflow across various environments effectively. Given the diversity of platforms our contributors use, including Linux, macOS, Windows, Docker, and Kubernetes, there is a critical need to standardize our CI/CD processes to ensure consistency and efficiency.

## Problem Statement

The current CI/CD setup at V-Sekai lacks a unified approach to deploying and managing runners in Kubernetes clusters, leading to potential inconsistencies in build and test environments. This fragmentation could slow down the development pipeline and impact the project's ability to iterate rapidly on new features.

## Proposed Solution

We propose to enhance our CI/CD pipeline by integrating Helm to streamline the installation and management of GitLab Runners in our Kubernetes clusters. Additionally, we will configure the runners to use S3 (Digital Ocean Spaces) as a cache, improving build times and reducing network traffic. Here's how we plan to implement this solution:

### Step 1: Install Helm

Ensure Helm is installed on your system. Helm will be used to deploy GitLab Runner instances as Helm charts, providing an easy and scalable way to manage runners within Kubernetes clusters.

```shell
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

### Step 2: Add the GitLab Runner Helm Chart

Add the GitLab Runner Helm chart repository to your Helm setup. This repository contains the necessary templates for deploying GitLab Runners in a Kubernetes cluster.

```shell
helm repo add gitlab https://charts.gitlab.io/
helm repo update
```

### Step 3: Customize the GitLab Runner Configuration

Update your `values.yaml` file with the following values to switch to the Ubuntu-based image and configure S3 as a cache:

```yaml
# Specify the Ubuntu image. Remember to set the version. You can also use the `ubuntu` or `latest` tags.
image: gitlab/gitlab-runner:v16.5.0

# Update the security context values to the user ID in the ubuntu image
securityContext:
  fsGroup: 999
  runAsUser: 999

# Configure S3 as a cache
runners:
  config: |
    [[runners]]
      [runners.kubernetes]
        image = "ubuntu:22.04"
      [runners.cache]
        Type = "s3"
        Path = "runner"
        Shared = true
        [runners.cache.s3]
          ServerAddress = "s3.amazonaws.com"
          BucketName = "my_bucket_name"
          BucketLocation = "eu-west-1"
          Insecure = false
          AuthenticationType = "access-key"
  cache:
    secretName: s3access
```

### Step 4: Create an S3 Access Secret

Create an `s3access` Kubernetes secret that contains your access key and secret key:

```shell
kubectl create secret generic s3access --from-literal=accesskey="YourAccessKey" --from-literal=secretkey="YourSecretKey"
```

### Step 5: Install the GitLab Runner using Helm

Deploy the GitLab Runner using Helm with the customized `values.yaml` file.

```shell
helm install gitlab-runner gitlab/gitlab-runner -f values.yaml
```

Ensure to replace `https://gitlab.example.com/` with your GitLab instance URL and `"REGISTRATION_TOKEN"` with your actual registration token.

## Benefits

- **Scalable and Efficient CI/CD**: Leveraging Kubernetes for CI/CD runners allows for dynamic scaling based on the workload, improving resource efficiency.
- **Consistency Across Environments**: Using Helm charts for deployment ensures consistent environments for all CI/CD pipelines, reducing "it works on my machine" issues.
- **Improved Build Times and Reduced Network Traffic**: By using S3 as a cache, build times can be significantly reduced and network traffic minimized.

## Downsides

- **Complexity**: The initial setup and configuration may require a deep understanding of Kubernetes and Helm, posing a learning curve for some team members.
- **Maintenance**: Ongoing maintenance of Helm charts could increase operational overhead.

## Alternatives Not Chosen

- **Manual Runner Installation**: Avoided due to its lack of scalability and increased potential for configuration errors.

## Infrequent Use Case

- **Temporary or One-off CI/CD Tasks**: For tasks that do not justify the overhead of Kubernetes runners, alternative, simpler CI/CD solutions might be temporarily employed.

## In Core and Done by Us

This initiative aligns with our core mission of developing social VR capabilities within the Godot Engine. The V-Sekai development team will lead this project, ensuring it meets our technical standards and project goals.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai, CI/CD, Kubernetes, Helm, S3 Cache

## Further Reading

1. [Helm Documentation](https://helm.sh/docs/)
2. [GitLab Runner Helm Chart](https://charts.gitlab.io/)
3. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
4. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine

Assisted by Aria, your AI assistant.
