# Proposed: Configuring GoCD Agents in V-Sekai

## Metadata

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai
- Tags: V-Sekai

## The Backdrop

V-Sekai is a platform that requires regular configuration of GoCD agents. This process can be time-consuming and prone to errors if not done correctly.

## The Challenge

The challenge is to configure the GoCD agents after a restart of the host machine. This involves accessing the GoCD server, navigating to the Agents page, enabling new agents, configuring agent resources, assigning environments, and saving changes.

## The Strategy

The strategy is to follow a step-by-step guide to ensure that all the necessary configurations are made correctly. This includes:

1. Accessing the GoCD Server
2. Navigating to the Agents Page
3. Enabling New Agents
4. Configuring Agent Resources
5. Assigning Environments
6. Saving Changes

## The Upside

By following this guide, users can ensure that their GoCD agents are configured correctly and ready to run jobs. This can save time and reduce the risk of errors.

## The Downside

The downside is that this process needs to be repeated every time the host machine is restarted. However, this is a necessary step to ensure that the GoCD agents function correctly.

## The Road Not Taken

An alternative approach could be to automate this process using scripts or other automation tools. However, this would require additional technical expertise and may not be feasible for all users.

## The Infrequent Use Case

In some cases, users may need to configure additional settings or use different resources and environments. These cases will require additional steps and may not be covered by this guide.

## In Core and Done by Us?

Yes, this guide was created by us and is part of our core documentation.

## Further Reading

- [V-Sekai](https://v-sekai.org/)
- This article is assisted by AI.

## Example configuration

| Agent Type                       | Resources     | Environments           |
| -------------------------------- | ------------- | ---------------------- |
| gocd-agent-59dbf9989-vp4d66      | linux, mingw5 | development, itch-fire |
| gocd-agent-dind-96575468d4-s29l2 | dind          | development, itch-fire |
| gocd-agent-59dbf9989-cczqj       | linux, mingw5 | development, itch-fire |
| gocd-agent-59dbf9989-p6vs5       | linux, mingw5 | development, itch-fire |
| gocd-agent-59dbf9989-t4ckd       | linux, mingw5 | development, itch-fire |
| gocd-agent-dind-96575468d4-b6gq9 | dind          | development, itch-fire |

Please note that the actual resources and environments will vary based on your specific setup.
