# Proposed: Replicate sync 100'000 entities using Godot Engine, mvsqlite and Foundationdb

- Status: proposed
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,sync,view replication,

## Context and Problem Statement

See [replicate sync 100'000 entities using a solution](20221019-replicate-sync-100-000-entities.md).

## Describe the proposed option and how it helps to overcome the problem or limitation

I propose we have groups of servers handling entities. Each server is synchronized with mvsqlite.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

We assume we're using Godot Engine 4 with float is doubles.

The servers do not share (independently access) the same memory or storage.

We can track the entity's visibility and have a packed byte array per frame.

Use mvsqlite in STRICT sql mode.

Use the SQLite generated columns option STORED to optimize for reading and VIRTUAL to optimize for writing.

Create ECS style mvsqlite database for streaming and events (movement, health, avatar path and others).

For movement update the table once and only once per frame.

For avatar paths that change batch notify once per frame.

![image](attachments/196743240-092dba67-98e7-4a92-937c-48dd26284d4f.png)

## Positive Consequences <!-- optional -->

- The code is using foundationdb's share nothing architecture.

## Negative Consequences <!-- optional -->

- Worried that latency will be above 20 milliseconds. It was shown in the graphs. May be a bug in mvsqlite with sequential key retries. Does the ownership / mastership of entities change often?

## Option graveyard: <!-- same as above -->

- Option: Current V-Sekai replication
- Rejection Reason: Can't link servers

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Entity replication is not trivial.

## Is there a reason why this should be core and done by us?

We're doing the networking layer.

## References <!-- optional and numbers of links can vary -->

- [fault-tolerance](https://apple.github.io/foundationdb/fault-tolerance.html)
- [godot-sqlite with mvsqlite](https://github.com/V-Sekai/godot-sqlite/tree/mvsqlite)
- [novus core](https://github.com/novuscore/NovusCore)

## Diagram source

```nomnoml
[godot client alice] -> [godot server alpha with mvsqlite |  [godot server alpha with mvsqlite| owns groups entities per tick
  | have a way to track entities
  | create, update and delete entity groups]]
[godot client bob] -> [godot server beta with mvsqlite |  [godot server beta with mvsqlite| owns groups entities per tick
  | have a way to track entities
  | create, update and delete entity groups]]
[godot client carol] -> [godot server gamma with mvsqlite |  [godot server gamma with mvsqlite| owns groups entities per tick
  | have a way to track entities
  | create, update and delete entity groups]]
  [godot server alpha with mvsqlite] - [godot server beta with mvsqlite]
  [godot server alpha with mvsqlite] - [godot server gamma with mvsqlite]
  [godot server beta with mvsqlite] - [godot server gamma with mvsqlite]
```

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
