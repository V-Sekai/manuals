# Replicate sync 100'000 entities using godot engine, mvsqlite and foundation db

- Status: proposed
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,sync,view replication,

## Context and Problem Statement

Develop a performant and robust (correctly and with liveness) network entity sync in V-Sekai.

There are 100'000 networked entities in a city and we go from position a to position b in a loop in a vehicle with one or more cabins.

## Describe the proposed option and how it helps to overcome the problem or limitation

 We can track the entity's visibility and have a packed byte array per frame.
 
## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

We assume we're using Godot Engine 4 with float is doubles.


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

![image](https://user-images.githubusercontent.com/32321/196743240-092dba67-98e7-4a92-937c-48dd26284d4f.png)


Neither the godot-mvsqlite servers talk to each other. Only the fdb instances with mvstore talk to each other.

## Positive Consequences <!-- optional -->

- The code is using foundationdb's share nothing architecture.

## Negative Consequences <!-- optional -->

- Worried that latency will be above 20 milliseconds. It was shown in the graphs. May be a bug in mvsqlite with sequential key contention.

## Option graveyard: <!-- same as above -->

- Option: Current V-Sekai replication
- Rejection Reason: Can't link servers

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Entity replication is not trivial.

## Is there a reason why this should be core and done by us?

We're doing the networking layer.

## References <!-- optional and numbers of links can vary -->

- [fault-tolerance](https://apple.github.io/foundationdb/fault-tolerance.html)

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
