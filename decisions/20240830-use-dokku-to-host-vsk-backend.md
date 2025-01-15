# Draft: Transition to Dokku from Kubernetes Proposal

## Overview

This proposal outlines the transition of our backend services from Kubernetes to Dokku, aiming to reduce complexity and maintenance costs.

## Context

Dokku is a minimalistic, open-source PAAS that provides a cost-effective alternative to Heroku. Our current use of Kubernetes has become prohibitively complex and expensive.

## Problem Statement

We aim to migrate our backend services from Kubernetes to Dokku to simplify operations and reduce expenses.

## Implementation Details

### Services Migration

- **Cockroachdb**: Deploy using oxide's fork of Cockroachdb. [oxidecomputer/cockroach](https://github.com/oxidecomputer/cockroach). Deploy using the [Dokku PostgreSQL plugin](https://github.com/dokku/dokku-postgres) if cockroachdb isn't possible.
- **File Object Store**: Implement an S3 compatible storage solution within Dokku. Research suggests SeaweedFS is the only option. Minio is not license-compatible.
- **Elixir "Uro" Backend**: Ensure seamless deployment and operation of our Elixir application on Dokku.
- **Caddy**: Set up Caddy as a web server and reverse proxy for secure HTTP and SSL management.
- **Backups**: Implement an S3 compatible backup storage solution.

### Code Example

```bash
# Install Dokku plugins
dokku plugin:install https://github.com/dokku/dokku-postgres.git postgres

# Create PostgreSQL service
dokku postgres:create my-database

# Deploy Elixir application
git push dokku master
```

## Benefits

- **Cost Efficiency**: Significant reduction in operational and maintenance costs.
- **Simplicity**: Streamlined management and deployment processes.
- **Scalability**: Adequate scaling capabilities without Kubernetes' overhead.
- **Security**: Enhanced security features with automatic SSL through Caddy.

## Potential Downsides

- **Feature Limitations**: Dokku may not support all Kubernetes features.
- **Migration Challenges**: Initial hurdles in transferring services and data.

## Alternatives Considered

- Persisting with Kubernetes despite its drawbacks.
- Adopting other PAAS solutions like Heroku or AWS Elastic Beanstalk.

## Special Considerations

Handling very high traffic levels might require additional Dokku configurations, which are inherently simpler in Kubernetes.

## Project Management

Our development team will manage the transition internally.

## Current Status

**Status**: Proposed

## Decision Makers

- V-Sekai development team

## Tags

- `V-Sekai`

## Further Information

1. [V-Sekai GitHub](https://github.com/v-sekai) - Explore more about V-Sekai's initiatives on social VR.
2. [V-Sekai Game Repository](https://github.com/v-sekai/v-sekai-game) - Official repository for the V-Sekai game project.

_Assisted by AI assistant Aria._
