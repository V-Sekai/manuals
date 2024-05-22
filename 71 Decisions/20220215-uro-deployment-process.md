# Proposed: To deploy backend services like Uro safely use a defined process

- Status: proposed <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

## Context and Problem Statement

We need a process for deploying Uro and other backend services safely

## Describe the proposed option and how it helps to overcome the problem or limitation

Commit code to uro sandbox branch

    - GoCD job creates uro-sandbox docker image
    - docker image is auto deployed to sandbox

PR merges code to uro main branch

    - GoCD job creates uro docker image
    - docker image is auto deployed to staging (A/B)
    - manual interface to swap staging and live branch

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Not done yet.
Probably relies on a custom Elixir service in Kubernetes using Role-Based Access Control, so it can automatically change services:

https://kubernetes.io/docs/reference/access-authn-authz/rbac/

## Positive Consequences <!-- optional -->

- [e.g., improvement of quality attribute satisfaction, follow-up decisions required, …]

## Negative Consequences <!-- optional -->

- [e.g., compromising quality attribute, follow-up decisions required, …]

[this section can be repeated for each option if more than one option is open for consideration]

## Option graveyard: <!-- same as above -->

- Option: <!-- [List the proposed options no longer open for consideration.] -->
- Rejection Reason: <!-- [List the reasons for the rejection: (the Bad traits)] -->

## If this enhancement will not be used often, can it be worked around with a few lines of script?

[If this enhancement will not be used often, can it be worked around with a few lines of script?]

## Is there a reason why this should be core and done by us?

[Is there a reason why this should be core and done by us?]

## References <!-- optional and numbers of links can vary -->

- [Link type](link to decision) <!-- example: Refined by [xxx](yyyymmdd-xxx.md) -->

## Derivative License

Copyright (c) 2022 V-Sekai contributors.

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
