# Proposed: Hyperv windows Harvester Test

## The Context

Currently, we are operating a Kubernetes cluster in a Linux environment. However, the need to test our applications in a Windows environment has been identified. This is where Hyper-V Windows Harvester becomes relevant.

## The Problem Statement

Our existing testing environment does not cater to Windows-based applications. We require a solution that enables us to test these applications in a Windows environment without the necessity of setting up an entirely new cluster.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

We can utilize Hyper-V to establish a Harvester HCI virtual machine (VM) on our current Windows desktop. Here's a basic outline of the steps involved:

1. Install Hyper-V on the Windows desktop.
2. Create a new VM using Hyper-V.
3. Install Harvester HCI on the new VM.
4. Configure the Harvester HCI VM for our testing needs.
5. Run tests on the Harvester HCI VM.

## The Benefits

- Enables us to test Windows-based applications without the need for a separate Windows server.
- Conserves resources by leveraging our existing infrastructure.
- Enhances our testing coverage and improves the quality of our software.

## The Downsides

- Requires additional configuration and maintenance.
- Potential performance issues due to running a VM on top of the Windows desktop.

## The Road Not Taken

We could have opted to set up a separate Windows server for testing. However, this would necessitate significant resources and may not be cost-effective.

## The Infrequent Use Case

This setup might not be ideal if we need to run high-performance applications that demand all the resources of a dedicated server.

## In Core and Done by Us

The implementation of this proposal will be carried out by our internal development team.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine

AI assistant Aria assisted with this article.
