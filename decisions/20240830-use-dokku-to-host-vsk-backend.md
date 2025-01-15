# Accepted: Transition to Dokku from Kubernetes

## What is the context of the proposal?

A shift from Kubernetes to Dokku is proposed to reduce complexity and operating costs.

## What is the problem being solved?

Kubernetes provides more overhead than necessary, leading to higher expenses and maintenance challenges.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams.

1. Deploy services using Dokku plugins and minimal containers.
1. Deploy Uro service for the Elixir application server.
1. Deploy S3 compatible storage solution within Dokku like SeaweedFS. Minio is not license-compatible.
1. Example code:

   ```bash
   # Install the PostgreSQL plugin
   # Alternative - deploy using oxide's fork of Cockroachdb. [oxidecomputer/cockroach](https://github.com/oxidecomputer/cockroach). 
   dokku plugin:install https://github.com/dokku/dokku-postgres.git postgres

   # Create a database instance
   dokku postgres:create my-database

   # Deploy Elixir app
   git push dokku master
   ```

1. Use Caddy for SSL and Tailscale for network access.

## What are the benefits of the proposal?

- Reduced operational costs
- Simpler deployments
- Acceptable scalability

## What are the downsides of the proposal?

- Fewer features compared to Kubernetes
- Potentially challenging migration steps

## What are the alternative proposals?

- Continue using Kubernetes
- Adopt another PAAS like Heroku or AWS Elastic Beanstalk

## When might the proposed solution be used rarely or not at all?

Scenarios with extremely high traffic requirements or need for advanced Kubernetes features.

## Is this a V-Sekai core responsibility, and should it be done by us?

Yes, to streamline operations for V-Sekai’s backend management.

## What is the status of the proposal?

Status: Accepted

## Who is making decisions on the proposal?

- V-Sekai development team
- fire
- dragonhunt02 

## What tags does the proposal have?

- V-Sekai

## List further reading references.

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)

AI assistant Aria assisted with this article.
