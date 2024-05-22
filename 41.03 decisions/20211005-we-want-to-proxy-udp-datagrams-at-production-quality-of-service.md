# Proposed: We want to proxy udp datagrams at production quality of service.

### Context and Problem Statement

We want to proxy udp datagrams at production quality of service.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

The ability to proxy V-Sekai game datagrams is an important part of the player experience.

We require that the proxy is able to handle both versions of DTLS inside of WebRTC and also with ENET.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

No idea.

#### WIP

- WireGuard in Cilium allows mesh kubernetes clustering

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Networking and game networking are not a few lines of code. Game networking is game specific and the quality matters.

### Positive Consequences

- Allows greater access to potential users.
- Web browser support requires webrtc.

### Negative Consequences

_No response_

### Is there a reason why this should be core and done by us?

We own game networking.

### References

- https://github.com/yyyar/gobetween
- https://ebpf.io/
- https://cilium.io/
- https://docs.cilium.io/en/stable/gettingstarted/encryption-wireguard/

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
