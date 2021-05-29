# Add build notifications
## Context and Problem Statement

Add build notifications because we do not know when a build completed in the CI system to test it.

## Decision Drivers <!-- optional -->

- Channels people use

## Considered Options

- Email notifications
- Discord webhook notifications

## Decision Outcome

Chosen option: Discord webhooks

### Positive Consequences <!-- optional -->

- Know when to test
- System stability

### Negative Consequences <!-- optional -->

- Engineering effort

## Pros and Cons of the Options <!-- optional -->

### Email notifications

Use the existing gocd email notifier.

- Good, because email is common
- Bad, not everyone wants to use email

### Discord

Make a gocd Discord notifier

- Good, because everyone is on discord
- Bad, because engineering needs to be done.

## Links <!-- optional -->

- https://docs.gocd.org/current/configuration/dev_notifications.html
- https://github.com/gocd-contrib/notification-skeleton-plugin
