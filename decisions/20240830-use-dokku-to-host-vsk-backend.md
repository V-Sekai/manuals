# Proposed: Transition to Dokku from Kubernetes

## The Context

Dokku is an open-source PAAS that serves as a simpler, cost-effective alternative to Heroku.

Our current backend infrastructure utilizes Kubernetes, which has become costly and complex to maintain. This complexity has led to operational paralysis.

## The Problem Statement

Transition our backend services from Kubernetes to Dokku to reduce complexity and maintenance costs.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Implement the following Dokku services as equivalents to our existing Kubernetes services:

1. **PostgreSQL** - Set up a PostgreSQL service in Dokku for database management.
2. **File Object Store** - Implement a storage solution within Dokku for handling file uploads and static assets.
3. **Elixir "Uro" Backend** - Deploy our Elixir-based application on Dokku, ensuring it functions seamlessly as it did on Kubernetes.

## The Benefits

- **Reduced Costs**: Lower operational and maintenance expenses compared to Kubernetes.
- **Simplified Management**: Easier deployment and management processes with Dokku's straightforward platform.
- **Scalability**: Efficient scaling options that meet our needs without the overhead of Kubernetes.

## The Downsides

- **Feature Limitations**: Potential limitations in features compared to the extensive capabilities of Kubernetes.
- **Migration Challenges**: Initial challenges related to migrating services and data from Kubernetes to Dokku.

## The Road Not Taken

- Continuing with Kubernetes despite the high cost and complexity.
- Switching to other PAAS solutions like Heroku or AWS Elastic Beanstalk.

## The Infrequent Use Case

Handling extremely high traffic might require additional configuration and optimization in Dokku, which is more straightforward in Kubernetes.

## In Core and Done by Us

The transition and maintenance of the Dokku infrastructure will be managed internally by our development team.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, bringing social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
