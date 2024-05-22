# Accepted: For Godot Engine changes use a decision flowchart

- Status: accepted <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,lyuma,
- Tags: V-Sekai,

## Context and Problem Statement

We have conflicts on how to merge Godot. We need to organize our strategies.

## Describe the proposed option and how it helps to overcome the problem or limitation

We will write a decision flow chart on what to do.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Is it upstreamable?

If upstreamable, commit to your own godot fork, and submit a Godot PR.

Then, add this commit into the .gitassembly

If not upstreamable, and intended as a V-Sekai specific feature, make the commit in the V-Sekai godot fork, don't submit a godot PR, and add to the .gitassembly.

If two upstreamable commits conflict, that is a godot problem because it implies the upstream open PRs would be broken if they both merged. There are two options:

First, if the resolution to this merge conflict is itself something which must be upstreamed, a new PR should be opened or communication needs to happen between the PR maintainers.

Temporarily, a new V-Sekai branch could be created which resolves this conflict while waiting for the upstream Godot maintainers to resolve the build issues.

Workflow for updating merge script.

1. Make a local commit to merge-script-master
2. Run the merge script
3. If successful, push (might happen automatically)

## Positive Consequences <!-- optional -->

- Easier to remember solutions.

## Negative Consequences <!-- optional -->

- Loss of flexbility.

## Option graveyard: <!-- same as above -->

- Option: Do adhoc decisions.
- Rejection Reason: Not a better strategy.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

This is a workflow design.

## Is there a reason why this should be core and done by us?

Only we care about our own policies.

## References <!-- optional and numbers of links can vary -->

## Derivative License

Copyright (c) 2021 V-Sekai contributors.

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
