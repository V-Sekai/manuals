# Rejected: Blocking direct push to MAIN to avoid build breakage

- Status: rejected <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,lyuma,
- Tags: V-Sekai,

## Context and Problem Statement

Direct push to main cause build breakage.

Note: This has been rejected by Lyuma.

## Describe the proposed option and how it helps to overcome the problem or limitation

We block direct pushes to the main and use pull requests and merges.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Use the GitHub workflow with pull requests.

## Positive Consequences <!-- improvement of quality attribute satisfaction, follow-up decisions required -->

We don't have to wait 2 hours to see if our changes break the build.

## Negative Consequences <!-- compromising quality attribute, follow-up decisions required -->

There are consequences of increased developer merging friction.

## Option graveyard:

- Option: The status quo. <!-- List the proposed options no longer open for consideration. -->
- Rejection Reason: We keep breaking the build. <!-- List the reasons for the rejection: (the bad traits) -->

## If this enhancement will not be used often, can it be worked around with a few lines of script?

This is a dev ops change.

## Is there a reason why this should be core and done by us?

We own the GitHub repositories.

## References

- [V-Sekai](https://v-sekai.org/)
- [Pending head](https://martinfowler.com/bliki/PendingHead.html)
- [Godot Pull request](https://docs.godotengine.org/en/stable/community/contributing/pr_workflow.html)

## License of the contribution

Copyright (c) 2022 K. S. Ernest (iFire) Lee

Copyright (c) 2022 V-Sekai contributors

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
