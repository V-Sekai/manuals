# Notify community members and users about activity and updates via a Discord bot

## Context and Problem Statement

We would like a way to notify community members and users about activity and updates.

## Describe the proposed option and how it helps to overcome the problem or limitation

A discord bot would be able to inform users via Discord about updates and changes.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

We would connect to Discord API from Elixir using one of several integration libraries.

We can report information such as server player count by editing a message; or by updating the bot status.

I would also like to poll information such as CI/CD builds and deployments. We could make an API where someone or something can post a message to be displayed in discord using curl or some command, though we would have to make sure this is locked behind a secret key. Unclear.

## Positive Consequences <!-- optional -->

- Grow the community
- Help us manage the project

## Negative Consequences <!-- optional -->

- Maintenence costs of having a service fed

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Yes, it is possible to script querying the itch.io or uro shards API. The goal of this proposal is to make this information more accessible to whose who would not script it.

## Is there a reason why this should be core and done by us?

We need this to grow the community.

## Links <!-- optional -->

- https://discord.com/
