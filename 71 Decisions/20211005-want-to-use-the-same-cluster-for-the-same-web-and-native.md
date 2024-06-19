# Proposed: Want to use the same cluster for the same web and native.

### Context and Problem Statement

Want to use the same cluster for the same web and native.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

By using webrtc only, we are able to reuse the same servers.

An alternative of a webserver that has both webrtc and enet is also possible.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

Suppose the server cluster sets up the infrastructure. In that case, it feels like WebRTC may jump past firewalls easier, and there's existing turn-ice stuff.

My colleague noted that you could have one Godot engine server provide a proxy to another Godot server. The design was similar to cell phone vs cell phone tower vs tower to tower distribution of messages. It wasn't clear that was possible, but he found something. Any thoughts about that?

### Problems

WebRTC is much more complex to set up, so I don't think it is a good alternative for ENet for indies.

WebRTC needs infrastructure; ENet does not.

Dependency problems between ScriptInstance and PacketPeer. What do you mean?

The script_language.h includes packet_peer.h, so PacketPeer cannot use GDVIRTUAL because that needs script_language.h

#### Questions

How do modern games different games have different bandwidth minimums?

Cents per hour to host how many players?

Hole-punching for pure peer-to-peer games.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

This is compiled into the project and is work to change.

### Positive Consequences

_No response_

### Negative Consequences

_No response_

### Is there a reason why this should be core and done by us?

Networking is part of the project and can't be changed by mods.

### References

_No response_

### Derivative License

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
