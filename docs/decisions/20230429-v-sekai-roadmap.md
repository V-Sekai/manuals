# V-Sekai Roadmap and Goals 2023-04-20

### Metadata

- Status: proposed
  <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,chatgpt4 summary,

### Context and Problem Statement

What is the V-Sekai Roadmap and Goals?

### Describe the proposed option and how it helps to overcome the problem or limitation

The roadmap presented here is divided into three stages: short-term,
mid-term, and long-term goals. Each stage builds upon the previous one,
gradually expanding the project’s scope and capabilities.

### Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

``` mermaid
graph LR

  subgraph Short Term
    A[Avatar Loading] --&gt; B1[Simple Demo with VRM Avatar]
    A --&gt; B2[VRM &amp; Unity Import - Maintain and Improve]
    A --&gt; B3[Network Code Reconciliation - Godot Network System]
    A --&gt; B4[Jitter in Network Interpolation]
    A --&gt; B5[Implement jitter and playback buffer for Voice]
  end

  subgraph Mid Term
    B4 --&gt; C[Network]
    C --&gt; D1[Entity System &amp; Background Loading]
    C --&gt; D2[Background Loading - Re-evaluate with Multithreaded Scene Tree]
    C --&gt; D3[UI Work - Fix VR UI &amp; Improve Interaction]
    C --&gt; D4[Lightweight Relay Instance Server - Single Process, Multiple Instances]
  end

  subgraph Long Term
    D4 --&gt; E[Scalable Instances]
    E --&gt; F1[Network Topology Implementation]
    E --&gt; F2[Streamlined Content Creation - Better Workflow]
    E --&gt; F3[Zero Stutter when Loading Content - Address Bottlenecks]
    E --&gt; F4[Social and Upload Features - Enhance User Experience]
    E --&gt; F5[Video and Audio Work - Streaming Integration]
    E --&gt; F6[Scripting Integrations - WASM-based Scripts]
    E --&gt; F7[UX Work for Non-Technical Users - Accessible UI]
    E --&gt; F8[Loading VRM Avatars - Streamlined Process]
    E --&gt; F9[In-Editor Content Building UX - Non-Technical Users]
  end
```

The discussion involves the development of V-Sekai, a project with
short-term, mid-term, and long-term goals. In the short term, the focus
is on avatar loading, simple demos, VRM & Unity import, network code
reconciliation, adding network interpolation, and voice jitter buffer.
Mid-term goals include working on the network, entity system, background
loading, UI improvements, and developing a lightweight relay instance
server. Finally, long-term goals involve scalable instances, network
topology implementation, streamlined content creation, zero stutter
loading, enhancing social and upload features, video and music playback
and live streaming, scripting integrations, UX work for non-technical
users, and in-editor content building UX.

One challenge the project faces is maintaining and improving the
existing codebase, which includes outdated workarounds from Godot 3.
Another setback was the change from OpenVR to OpenXR. Content is another
hurdle: transferring a world from other platforms to V-Sekai is
currently best accomplished by exporting source assets such as glTF or
FBX. The project aims to cater to non-technical users, making it more
accessible than other platforms. WASM-based scripting is being
considered, but there are concerns about implementation challenges and
security.

In addition, the V-Sekai project needs a project manager, and the team
struggles to find collaborators who share their vision and can dedicate
enough time to contribute significantly. Nevertheless, despite the long
list of features needed for basic functionality, the team believes that
V-Sekai is essential for the future of the Metaverse space, and that
will draw collaborators to assist on our common vision.

It’s important that our roadmap and goals continue to be discussed and
iterated on. Nothing should be seen as final, since technology changes
so rapidly and consensus is important.

### Positive Consequences

We can create V-Sekai easier.

### Negative Consequences

Overhead might be hard.

### Option graveyard

- Relying on informal communication and ad-hoc collaboration
- Continuing with the current approach without a structured process

### If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No. This is a process.

### Is there a reason why this should be core and done by us?

This is a core process for V-Sekai.

### References

- [V-Sekai](https://v-sekai.org/)
