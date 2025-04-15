# Draft: Add build notifications

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

## References <!-- optional -->

- <https://docs.gocd.org/current/configuration/dev_notifications.html>
- <https://github.com/gocd-contrib/notification-skeleton-plugin>

## Derivative License

Copyright (c) 2020-2021 V-Sekai contributors.

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
