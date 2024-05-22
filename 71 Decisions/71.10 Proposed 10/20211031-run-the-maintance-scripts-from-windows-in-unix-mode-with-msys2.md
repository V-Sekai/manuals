# Proposed: Run the maintenance scripts from Windows in Unix mode with msys2

- Status: proposed <-- draft | rejected | accepted | deprecated | superseded by -->

## Context and Problem Statement

I want to use Unix tools but the experience of Linux is lacking.

## Describe the proposed option and how it helps to overcome the problem or limitation

Use msys2 on Windows to improve this.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

- Install Windows 10 or Windows 11
- Open Powershell.
- `Set-ExecutionPolicy RemoteSigned -scope CurrentUser`
- `iwr -useb get.scoop.sh | iex`
- `scoop install msys`
- `msys2`
- `pacman -S ssh-pageant openssh git python3`
- Copy to ~/.bashrc
- `eval $(/usr/bin/ssh-pageant -r -a "/tmp/.ssh-pageant-$USERNAME")`

## Positive Consequences <!-- optional -->

- [e.g., improvement of quality attribute satisfaction, follow-up decisions required, …]
- […]

## Negative Consequences <!-- optional -->

- I can use the better experience of Windows without the frustration of Linux.

[this section can be repeated for each option if more than one option is open for consideration]

## Option graveyard: <!-- same as above -->

- Option:
<!-- [List the proposed options no longer open for consideration.] -->
- Rejection Reason:
<!-- [List the reasons for the rejection: (the Bad traits)] -->

## If this enhancement will not be used often, can it be worked around with a few lines of script?

This is a quality of life improvement.

## Is there a reason why this should be core and done by us?

I use this.

## References <!-- optional -->

- https://www.msys2.org/
- https://github.com/cuviper/ssh-pageant

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
