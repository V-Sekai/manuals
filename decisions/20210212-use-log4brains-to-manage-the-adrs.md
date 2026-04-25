# Superseded: Use Log4brains to manage the ADRs

- Status: superseded
- Date: 2021-02-11
- Tags: dev-tools, doc, 20210212-use-log4brains-to-manage-the-adrs

## Context and Problem Statement

We want to record architectural decisions made in this project.
Which tool(s) should we use to manage these records?

## Considered Options

[@log4brains_2024]: "Log4brains." : architecture knowledge base (command-line + static site generator) <https://github.com/thomvaill/log4brains>
[@adr_tools_2024]: "ADR Tools." : command-line to create ADRs <https://github.com/npryce/adr-tools>
[@adr_tools_python_2024]: "ADR Tools Python." : command-line to create ADRs <https://bitbucket.org/tinkerer_/adr-tools-python/src/master/>
[@adrviewer_2024]: "adr-viewer." : static site generator <https://github.com/mrwilson/adr-viewer>
[@adrlog_2024]: "adr-log." : command-line to create a TOC of ADRs <https://adr.github.io/adr-log/>

## Decision Outcome

Chosen option: "Log4brains", because it includes the features of all the other tools, and even more.

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
