# Provide SSH, Web Proxy, DB and Kubernetes access via installing Teleport into a Kubernetes cluster

## Context and Problem Statement

Provide SSH, Web Proxy, DB and Kubernetes access team-wide with security and with high avaliability.

## Describe the proposed option and how it helps to overcome the problem or limitation

Teleport provides access, security and avaliability.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

[Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams]

To be determined.

## Positive Consequences <!-- optional -->

- More secure
- Can connect from multiple endpoints
- Can connect to multiple clusters
- Force two factor

## Negative Consequences <!-- optional -->

- Single system to fail

## Option graveyard: same as above

**Direct ssh**

This is rejected because it is not a cluster solution.

**Kubernetes auth**

This is a kubernetes specific system.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Kubenetes is massive and then we have a security system combined. This is not a few lines of code.

## Is there a reason why this should be core and done by us?

We can outsource the code but the use of this is still ours.

## Links <!-- optional -->

- https://github.com/gravitational/teleport
