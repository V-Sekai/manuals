# Proposed: Evaluate AYON pipeline platform on hosted cloud services

## Metadata

- Status: Proposed
- Deciders: V-Sekai
- Tags: V-Sekai

## The Backdrop

### AYON

AYON is an open-source pipeline platform designed for creative studios, particularly those involved in animation and visual effects (VFX). It provides a robust and scalable solution for managing and executing creative projects. AYON's source code is publicly accessible, allowing for community-driven development and customization. It is geared towards creative studios, particularly those working in animation and VFX. Evolved from OpenPype, it has been used since 2018 in various production environments. Supported and funded by the creative industry, AYON also offers comprehensive documentation for users, including guides for administrators and developers.

### Hosted Cloud Services

Hosted cloud services provide a flexible and scalable infrastructure solution that can be tailored to meet the specific needs of an organization. They offer a range of services including compute power, storage, and networking capabilities, as well as advanced services such as machine learning and data analytics. These services are typically provided on a pay-as-you-go basis, making them a cost-effective option for many organizations.

## The Challenge

Evaluate AYON on hosted cloud services for a game development studio.

## The Strategy

Deploy AYON using a single Docker image with hosted cloud services for Redis and PostgreSQL.

### Revised Deployment Plan for AYON on DigitalOcean

1. **Use a Single Docker Image**: Instead of multiple containers, use one Docker image for the AYON server. This image can be pulled from Docker Hub and configured to connect with external Redis and PostgreSQL services.

2. **Hosted Cloud Redis and PostgreSQL**:

   - **Cloud Redis**: Use DigitalOcean's Managed Redis service for caching and real-time data processing.
   - **Cloud PostgreSQL**: Utilize DigitalOcean's Managed PostgreSQL for your database needs.
   - **Health Check**: http://localhost:5000/api/info
   - **Configure Environment Variables**: Set environment variables in your Docker configuration to connect to the Managed Redis and PostgreSQL instances.

3. **Deploy on DigitalOcean**: Use DigitalOcean's App Platform or a Droplet to deploy your Docker image. Configure it to connect to the Managed Redis and PostgreSQL services.

For more detailed guidance on using DigitalOcean's Managed Redis and PostgreSQL, and for best practices in Docker image deployment on DigitalOcean, a search on DigitalOcean's documentation and resources would be beneficial.

#### Configure AYON for a Game Development Studio

Next, we will configure AYON according to the needs of a typical game development studio. This includes setting up workflows for creating assets and assemblages in Blender, and importing them into the Godot Engine.

### Integrate Google Drive with the AYON homesite

In this step, we will integrate Google Drive with the AYON homesite. This will allow us to store all our files and data directly into Google Drive from the AYON homesite.

### Run Tests

We will then run a series of tests to assess the performance, reliability, and usability of AYON on hosted cloud services. These tests will simulate tasks a 3D game studio would typically perform, such as creating and modifying assets in Blender, and importing these assets into the Godot Engine.

### Document Findings and Provide Recommendations

Finally, we will document our findings from the tests and provide recommendations based on the evaluation results. This will help us understand how well AYON performs on hosted cloud services, and whether it is a suitable solution for game development studios using the Godot Engine.

## The Upside

Implementing AYON on hosted cloud services could potentially streamline the workflow of game development studios, making project management more efficient and effective.

## The Downside

There may be compatibility issues between AYON and hosted cloud services that could affect performance or functionality. Additionally, there may be a learning curve for teams unfamiliar with AYON.

## The Road Not Taken

Alternative solutions such as proprietary pipeline platforms were considered. However, the open-source nature of AYON provides more flexibility and customization options.

## The Infrequent Use Case

In cases where the studio is working on multiple platforms or using a variety of software, additional configuration and testing may be required to ensure AYON works seamlessly across all environments.

## In Core and Done by Us?

This evaluation aligns with our core competencies in evaluating and implementing technology solutions. As such, it should be executed by our team.

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine
3. [AYON Docker](https://github.com/ynput/ayon-docker)

This article was assisted by AI assistant Aria.
