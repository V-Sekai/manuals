# Create a Godot Engine asset store service on elixir and on sqlite.

- Status: accepted <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,

## Context and Problem Statement

Godot Engine lacks an asset store service.

## Describe the proposed option and how it helps to overcome the problem or limitation

Write an elixir service that stores data in a database.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Use elixir.

Use ecto with sqlite.

Provide a phoenix web server.

Works on Windows.

Investigate membrane framework.

Design a schema.

Covert godot asset store api to an openapi schema.

## Positive Consequences <!-- optional -->

- Able to publish v-sekai addons.
- Overlay existing asset library
- Able to in a future feature post process packed scenes exported by V-Selai

## Negative Consequences <!-- optional -->

- [e.g., compromising quality attribute, follow-up decisions required, …]

[this section can be repeated for each option if more than one option is open for consideration]

## Option graveyard: <!-- same as above -->

- Option: Use the existing asset library backend
- Rejection Reason: Does not use a modern tech stack.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Don't need a line of script.

## Is there a reason why this should be core and done by us?

This is a V-Sekai service and I know of an approach.

## References <!-- optional -->

- https://github.com/godotengine/godot-asset-library/blob/master/API.md
- https://godotengine.org/
- https://www.sqlite.org/draft/stricttables.html
- https://github.com/elixir-sqlite/ecto_sqlite3/issues
- https://www.phoenixframework.org/

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
