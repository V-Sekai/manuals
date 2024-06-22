# Accepted: To have an alternative CICD use Github Actions.

- Status: accepted <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

## Context and Problem Statement

GitHub actions is free and does not require running your own hardware for CI/CD.
We understand some users may desire to use this route to build our system.

However, we also want our system to be fully self hosted, so as a compromise,
we may wish to offer first-party support for both types of continuous integration.

## Describe the proposed option and how it helps to overcome the problem or limitation

We will offer github actions files in our official Godot fork as well as our V-Sekai project.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

We will generate github actions templates using the same jsonnet we use for GoCD.

## Positive Consequences <!-- optional -->

- The social network of GitHub is more accessible to most people.
- Offers more options for building our infrastructure and ways to get into Godot development, which is good.
- GitHub's donated compute time may free up valuable compute resources for more critical operations.

## Negative Consequences <!-- optional -->

- Maintaining more scripts requires our developer time
- More codepaths means more QA or pieces that can break.

## Option graveyard:

- Option: Keep the status quo, which is using GoCD or building manually on the command line.
- Rejection Reason: Building manually on the command line is slow on Windows and not reproducible;
- Rejection Reason: GoCD is inaccessible to most developers.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

It can.

## Is there a reason why this should be core and done by us?

We want to maintain it to encourage developers and as the publisher of the platform it is our responsibility.

## References <!-- optional and numbers of links can vary -->

- https://jsonnet.org/
- https://docs.github.com/en/billing/managing-billing-for-github-actions/about-billing-for-github-actions

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
