# Proposed: Networking with 100000 Entities and Ownership (Revision 2)

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai, Networking

## Context and Problem Statement

In short, replication of state while permitting object ownership to transfer, at scale.

## Describe the proposed option and how it helps to overcome the problem or limitation

If we go with a model in which objects have one of three policies:

1. Deny
2. Ask Master
3. Allow always (synchronous replication)

We want to ensure various guarantees in each case.

1. There is no problem
2. We will delay sync by 1 round trip, so there is no problem because everything is synchronized against the master.
3. We will follow a "last-write wins" strategy from the perspective of the relay server responsible for mastership.

Other relays only need to know which server owns each object (and possibly the ownership / mastership table), and where each entity is.

Having this constraint permits us to use a model where we do not need consistent and transactional global information about object ownership,
which allows the system to be simpler.

Idea of separation of presence queries (who is here, reliably, tricky to figure out who of 100000 clients is relevant?) from realtime networking sync,
which can flow directly from relay to relay, degrading over distance.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

None yet. We may try prototyping this type of system in multiple ways.

## Positive Consequences <!-- improvement of quality attribute satisfaction, follow-up decisions required -->

This keeps low latency but reduces the needed bandwidth to sync 100,000 entites.

Napkin math:

    50 bytes per frame per object * 100,000 objects = 5MB per frame.
    5MB/frame * 20 fps = 100MB = 1Gbps
    If we send updates of all obejcts to all objects, that requires 100Tb/s

    > yea 100k users at once is impossible any way you put it. I think a realistic goal is 1k, as like, our max goal

    Right, so you would need to not send updates for far away objects

    Only send 1000 closest objects: 1Tb/s

    + Send faraway objects at 2Hz: 100Gb/s

    + Heavy delta compression: 10Gb/s

    This is for all players

    Thie means, in a hypothetical universe where distant objects only need position sync, a server with 10Gb/s NIC could theoretically run 100,000 concurrent users, if optimizzed!

    Also, therefore, per player bandwidth **of distant objects** would be 100Kbit/s of downstream data, which is pretty small.

    Again I haven't accounted for IK synchronization, or for additional nearby objects, so it could be higher here.
    Nearby objects is a smaller problem and easier to solve, and belongs in a separate proposal.

## Negative Consequences <!-- compromising quality attribute, follow-up decisions required -->

We may be overcomplicating a problem that doesn't need to be solved yet. Pure interest management may be sufficient, and we do not currently have this many users.

## Option graveyard:

## If this enhancement will not be used often, can it be worked around with a few lines of script?

## Is there a reason why this should be core and done by us?

## References

Source:

Discord VC with Malek and iFire

Discord channel forum-v-sekai "Networking with librg" thread: https://discord.com/channels/471446618156040210/1031379649776848900/1032401929587929208

## License of the contribution

Copyright (c) 2022 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
