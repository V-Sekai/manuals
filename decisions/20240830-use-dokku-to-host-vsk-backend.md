# Proposed: Transition to Dokku from Kubernetes Proposal

## Overview

This proposal outlines the transition of our backend services from Kubernetes to Dokku, aiming to reduce complexity and maintenance costs.

## Context

Dokku is a minimalistic, open-source PAAS that provides a cost-effective alternative to Heroku. Our current use of Kubernetes has become prohibitively complex and expensive.

## Problem Statement

We aim to migrate our backend services from Kubernetes to Dokku to simplify operations and reduce expenses.

## Implementation Details

### Services Migration

- **PostgreSQL**: Deploy using the [Dokku PostgreSQL plugin](https://github.com/dokku/dokku-postgres).
- **File Object Store**: Implement an S3 compatible storage solution within Dokku.
- **Elixir "Uro" Backend**: Ensure seamless deployment and operation of our Elixir application on Dokku.
- **Caddy**: Set up Caddy as a web server and reverse proxy for secure HTTP and SSL management.
- **RabbitMQ**: Integrate RabbitMQ for robust messaging and queuing capabilities.
- **Backups**: Implement an S3 compatible backup storage solution.
- **Telemetry**: Use OpenTelemetry for monitoring and tracing by integrating it with Signoz as outlined in [this guide](https://signoz.io/blog/opentelemetry-apm/).

### Code Example

```bash
# Install Dokku plugins
dokku plugin:install https://github.com/dokku/dokku-postgres.git postgres
dokku plugin:install https://github.com/dokku/dokku-rabbitmq.git rabbitmq

# Create PostgreSQL service
dokku postgres:create my-database

# Create RabbitMQ service
dokku rabbitmq:create my-messaging-service

# Deploy Elixir application
git push dokku master

# Setup OpenTelemetry
# Follow the specific instructions from the Signoz guide
```

## Benefits

- **Cost Efficiency**: Significant reduction in operational and maintenance costs.
- **Simplicity**: Streamlined management and deployment processes.
- **Scalability**: Adequate scaling capabilities without Kubernetes' overhead.
- **Security**: Enhanced security features with automatic SSL through Caddy.
- **Reliability**: Dependable inter-service communication with RabbitMQ.

## Potential Downsides

- **Feature Limitations**: Dokku may not support all Kubernetes features.
- **Migration Challenges**: Initial hurdles in transferring services and data.

## Alternatives Considered

- Persisting with Kubernetes despite its drawbacks.
- Adopting other PAAS solutions like Heroku or AWS Elastic Beanstalk.

## Special Considerations

Handling very high traffic levels might require additional Dokku configurations, which are inherently simpler in Kubernetes.

## Project Management

The transition will be managed internally by our development team.

## Current Status

**Status**: Proposed

## Decision Makers

- V-Sekai development team

## Tags

- `V-Sekai`

## Further Information

1. [V-Sekai GitHub](https://github.com/v-sekai) - Explore more about V-Sekai's initiatives on social VR.
2. [V-Sekai Game Repository](https://github.com/v-sekai/v-sekai-game) - Official repository for the V-Sekai game project.
3. [TigrisData](https://www.tigrisdata.com/docs/pricing/)

_Assisted by AI assistant Aria._
