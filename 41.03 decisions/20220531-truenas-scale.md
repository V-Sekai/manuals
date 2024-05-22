# Rejected: To create a deployment kit use truescale to host gocd agents for cicd.

### Describe the status of the issue.

- [x] proposed
- [x] draft
- [x] rejected
- [ ] accepted
- [ ] deprecated
- [ ] superseded by

### List the deciders of the issue.

V-Sekai,fire,

### Describe the tags of the issue.

V-Sekai,

### Context and Problem Statement

I want to run docker containers in a semi production way.

### Describe the proposed option and how it helps to overcome the problem or limitation

Use truenas scale to host gocd agents for cicd.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Add a new storage node from hosts.

## Truenas Scale

1. install truenas scale
2. install truenas charts
3. Launch docker image
4. image: groupsinfra/gocd-agent-centos-8-groups
5. tag: v20.7.0-groups-0.5.3
6. Add environment variables
7. GO_SERVER_URL="https://ci.v-sekai.cloud/go/"
8. Add host volumes for
9. /go
10. /mnt/homego # On truenas

## GOCD Config

10. ??? Enable the agent
11. ??? Add the environment to the agent
12. ??? Add the agent to the environment.

### Positive Consequences

Can deploy this setup to digital ocean.

### Negative Consequences

_No response_

### Option graveyard

_No response_

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a few lines script.

### Is there a reason why this should be core and done by us?

I know how to do this and I don't want to pay for it.

### References

- [V-Sekai](https://v-sekai.org/)
- [agent_auto_register](https://docs.gocd.org/current/advanced_usage/agent_auto_register.html)

### License of the contribution

Copyright (c) 2022 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
