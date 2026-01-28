# Proposed: Evaluate Nutanix Community Edition and Harvester HCI for Development Infrastructure

## The Context

The development team needs to evaluate hypervisor solutions for remote infrastructure management. Two primary options are being considered: Nutanix Community Edition (enterprise-grade with community licensing) and Harvester HCI (fully open-source hyperconverged infrastructure). Both should enable easy administration over the internet while maintaining portability to cloud-native deployments, with support for container deployment and cloud-init for development workflows.

## The Problem Statement

Current infrastructure lacks a standardized hypervisor solution for development and testing environments that balances ease of remote administration with the requirement for portability and open-source alternatives.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Evaluate two hypervisor solutions for development infrastructure:

**Option 1: Nutanix Community Edition**

- Install on bare metal or VMs (up to 4 nodes free)
- Web-based management interface for remote administration
- Built-in container and cloud-init support
- Can run on developer laptops for local testing

**Option 2: Harvester HCI**

- 100% open-source hyperconverged infrastructure solution
- Built on Kubernetes, KubeVirt, and Longhorn
- Modern HCI using enterprise-grade open-source technologies
- Single pane of glass for virtualization and container management

Both options provide:

- Remote administration capabilities over internet
- Container workload support
- Cloud-init integration for automated deployments
- Portability to cloud-native architectures when scaling

Infrastructure Design:

```
Hypervisor Layer (Nutanix/Harvester)
    ↓
Container/Application Layer (K3s, Docker, etc.)
    ↓
Development Applications (V-Sekai, etc.)
```

## The Benefits

- **Easy Remote Administration**: Both solutions provide web-based interfaces for internet-accessible management
- **Container Support**: Native support for containers and cloud-init simplifies deployment workflows
- **Laptop Development**: Both can run on developer laptops or VMs for local testing environments
- **Cost Effective**: Free community/open-source licensing for development use
- **Open Source Options**: Harvester provides fully open-source alternative to Nutanix's hybrid model
- **Cloud Portability**: Applications remain deployable on cloud platforms without hypervisor dependencies
- **Modern Architecture**: Built on proven open-source technologies (Linux, KVM, Kubernetes)

## The Downsides

**Nutanix Community Edition:**

- Not fully open source (built on proprietary enterprise software)
- Vendor dependency concerns for enterprise software
- Limited to 4 nodes in Community Edition
- Potential future licensing changes

**Harvester HCI:**

- Newer project compared to established enterprise solutions
- May have fewer third-party integrations than mature platforms
- Requires Kubernetes knowledge for advanced management
- Community support vs enterprise backing

**Both Options:**

- Learning curve for hypervisor management
- Resource overhead compared to container-only solutions

## The Road Not Taken

- **Proxmox Only**: While viable, it lacks the integrated HCI features and container management capabilities of both Nutanix and Harvester
- **Cloud-Only Approach**: Would sacrifice local development environments and easy remote administration capabilities
- **Custom Hypervisor Solution**: Would require significant development effort for features already available in mature open-source solutions
- **Single Vendor Lock-in**: Choosing only proprietary solutions without open-source alternatives

## The Infrequent Use Case

- **Large-Scale Production**: When infrastructure exceeds 4 nodes or requires enterprise support beyond Community Edition
- **Air-Gapped Environments**: Where internet-based administration tools cannot be used
- **Minimal Resource Scenarios**: Where hypervisor overhead is unacceptable for resource-constrained deployments

## In Core and Done by Us

Infrastructure tooling decisions are core to development workflow efficiency. The development team will handle evaluation, documentation, and implementation of both primary and fallback hypervisor solutions.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai Development Team
- iFire
- GPot

## Tags

- Infrastructure, Hypervisor, HCI, Nutanix, Harvester, Development, Containers, Cloud-Native, Open-Source

## Further Reading

1. [Nutanix Community Edition](https://www.nutanix.com/products/community-edition)
2. [Nutanix Community Edition Documentation](https://portal.nutanix.com/page/documents/details?targetId=Community-Edition-Comparison:Community-Edition-Comparison)
3. [Harvester HCI - Open-source hyperconverged infrastructure](https://harvesterhci.io/)
4. [SUSE Harvester GitHub](https://github.com/harvester/harvester)
5. [Nutanix Ansible Collection](https://github.com/nutanix/nutanix.ansible)

---

### Infrastructure Jargon

1. **Hypervisor**: Software that creates and manages virtual machines, allowing multiple operating systems to run on a single physical machine.
2. **HCI (Hyper-Converged Infrastructure)**: Integrates compute, storage, and networking into a single, software-defined platform.
3. **Cloud-Init**: Multi-distribution package that handles early initialization of cloud instances, supporting configuration of hosts immediately after instantiation.
4. **Bare Metal**: Running software directly on physical hardware without virtualization layer.

AI assistant Aria assisted with this article.
