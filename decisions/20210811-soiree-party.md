# Proposed: Soiree party mode

### Context and Problem Statement

V-Sekai aspires to be an open source 3d virtual world platform that has VR and desktop modes.

We want to make it easy to deploy V-Sekai in Soiree mode.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

We package V-Sekai in Soiree Party mode, so it is easier to test the system.

A Soiree is a party or gathering, typically in a private house, for conversation or music.

#### Risks

Sandstorm network access APIs may not work for the use case.

In most cases, things that run over plain HTTP requests should be able to work, but other network protocols tend to be nontrivial.

Sandstorm at current would neither support WebRTC or UDP traffic through the Powerbox, but it is uncertain what is needed to add it.

Risk to migrate the Sandstorm ecosystem to Kubernetes helm system to match the devops status quo. Vargrant is not the status quo.

##### Proxying

Some udp based proxying methods are known

1. https://github.com/yyyar/gobetween for standalone
2. cillium for kubernetes
3. WebRTC ice, stun, turn

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

#### V-Sekai Developers

We package V-Sekai in Soiree party mode.

1. We start a single server of CockroachDB SQL database and not the default 3 server mode.
2. We provide installs of the Godot game engine client and server.
3. We re-arrange our elixir application Uro to work as a Sandstorm.io application.

#### V-Sekai Packages

1. V-Sekai provides a Server Download Package connecting via PowerBox.
2. V-Sekai a Client Download Package connecting via PowerBox.
3. V-Sekai a Uro Download Package connecting via PowerBox.

There is an open question if V-Sekai sandbox design works with powerbox.

#### Player and Hosts

1. Individual hosts of Sandstorm.io can start their own grains of V-Sekai in Soiree mode.
1. Players download the Godot Engine client and play.

#### Hosts

1. Must provide a way to access the Godot Engine server and the Sandstorm server.

### If this enhancement will not be used often, can it be worked around with a few lines of script?

It is not trivial and not a few lines to implement a distributed system for a developer.

### Positive Consequences

Self-hosted is a feature.

We can use Soiree Party mode to test V-Sekai.

### Negative Consequences

Maybe too complicated for the developers.

### Is there a reason why this should be core and done by us?

We are investigating how to implement the Soiree Party mode.

### References

- https://www.cockroachlabs.com/
- https://github.com/V-Sekai/uro
- https://docs.sandstorm.io/en/latest/developing/powerbox/
- https://docs.sandstorm.io/en/latest/vagrant-spk/services/
- https://github.com/sandstorm-io/sandstorm
- https://github.com/mrmetaverse/soiree

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
