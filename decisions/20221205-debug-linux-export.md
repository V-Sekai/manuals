# Proposed: Debug Linux Export

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

## Context and Problem Statement

It is hard to debug exports on Linux without using Linux as a desktop environment. There is a crash on export.

## Describe the proposed option and how it helps to overcome the problem or limitation

Propose a workflow for debugging linux exports.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Use wsl or a virtual machine.

1. Download the exact version of the editor that crashes on export.
2. Download the game templates.
3. Run the export in a debugger
4. Find the bug.

## Positive Consequences <!-- improvement of quality attribute satisfaction, follow-up decisions required -->

1. We can export again
2. Writing down the workflow makes use be able to reuse processes.

## Negative Consequences <!-- compromising quality attribute, follow-up decisions required -->

We need to download the binaries manually for now.

## Option graveyard:

- Option: The status quo. <!-- List the proposed options no longer open for consideration. -->
- Rejection Reason: This solves nothing. <!-- List the reasons for the rejection: (the bad traits) -->

- Option: Compile the package manually <!-- List the proposed options no longer open for consideration. -->
- Rejection Reason: This solves nothing because it is all manually and undocumented <!-- List the reasons for the rejection: (the bad traits) -->

## If this enhancement will not be used often, can it be worked around with a few lines of script?

This is a workflow document.

## Is there a reason why this should be core and done by us?

We have to build V-Sekai.

## References

- [V-Sekai](https://v-sekai.org/)

## License of the contribution

```
MIT License

Copyright (c) 2018-2022 SaracenOne
Copyright (c) 2019-2022 K. S. Ernest (iFire) Lee (fire)
Copyright (c) 2020-2022 Lyuma
Copyright (c) 2020-2022 MMMaellon
Copyright (c) 2022 V-Sekai Contributors

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
```
