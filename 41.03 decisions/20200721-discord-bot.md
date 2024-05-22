# Draft: Notify community members and users about activity and updates via a Discord bot

- Status: draft

## Context and Problem Statement

We want a way to notify community members and users about activity and updates.

## Describe the proposed option and how it helps to overcome the problem or limitation

A discord bot would be able to inform users via Discord about updates and changes.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

We would connect to Discord API from Elixir using one of several integration libraries.

We can report #information such as server player count by editing a message; or updating the bot status.

I would also like to poll #information such as CI/CD builds and deployments. We could make an API where someone or something can post a message displayed in Discord using curl or some command, though we would have to make sure this is locked behind a secret key. Unclear.

## Positive Consequences <!-- optional -->

- Grow the community
- Help us manage the project

## Negative Consequences <!-- optional -->

- Maintenence costs of having a service fed

# Other proposal: Integration with Discord via Webhook

## Positive Consequences

- Lower maintenance burden

## Negative Consequences

- No access to commands or statuses. Only capable of posting messages.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Yes, it is possible to script querying the itch.io or Uro shards API. This proposal aims to make this #information more accessible to those who would not script it.

## Is there a reason why this should be core and done by us?

We need this to grow the community.

## Derivative License

Copyright (c) 2020-2021 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
