# Proposed: Port RENIK to Many Bone IK for better quality

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

## Context and Problem Statement

Renik is a character controller and many bone ik is an ik solver. We have not merged them.

The quality is low for the FABRIK solver.

## Describe the proposed option and how it helps to overcome the problem or limitation

We wish to merge many bone ik and renik to improve quality.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Replace renik's usage of FABRIK with many bone ik.

## Positive Consequences <!-- improvement of quality attribute satisfaction, follow-up decisions required -->

1. Better animation quality

## Negative Consequences <!-- compromising quality attribute, follow-up decisions required -->

## Option graveyard:

- Option: The status quo. <!-- List the proposed options no longer open for consideration. -->
- Rejection Reason: This solves nothing. <!-- List the reasons for the rejection: (the bad traits) -->

## If this enhancement will not be used often, can it be worked around with a few lines of script?

IK is hard and not a few lines of code.

## Is there a reason why this should be core and done by us?

We know how to do it.

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
