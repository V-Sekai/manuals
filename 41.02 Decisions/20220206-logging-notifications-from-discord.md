# Proposed: Log change notifications using DiscordChatExporter

- Status: proposed <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

## Context and Problem Statement

We use discord to log changes. At any moment, Discord can disappear.

## Describe the proposed option and how it helps to overcome the problem or limitation

Use DiscordChatExporter to export our change notifications.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. generate a bot key
1. enter key
1. select channels to write to
1. export while being careful to be in utc.

## Positive Consequences <!-- optional -->

- Logs can be created for notificiations.

## Negative Consequences <!-- optional -->

- Need to avoid Discord selfbots

## Option graveyard: <!-- same as above -->

- Option: Current status.
- Rejection Reason: Discord servers can be arbitrarily lost.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a trivial amount of coding to log into Discord.

## Is there a reason why this should be core and done by us?

We are the ones designing and using Discord.

## References <!-- optional and numbers of links can vary -->

- [DiscordChatExporter](https://github.com/Tyrrrz/DiscordChatExporter) <!-- example: Refined by [xxx](yyyymmdd-xxx.md) -->

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
