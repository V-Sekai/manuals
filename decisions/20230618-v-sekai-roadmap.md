# V-Sekai Roadmap and Goals 2023-06-18

### Metadata

- Status: accepted
- Deciders: V-Sekai, fire, guillefix
- Tags: V-Sekai, chatgpt4 summary,

### Context and Problem Statement

What is the V-Sekai Roadmap and Goals?

### Describe the proposed option and how it helps to overcome the problem or limitation

The roadmap presented here is short-term.

### Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

### Non-goals

To prioritize WAP, NET, and UIUX, we need to avoid working on User Generated Content (UGC) and world building. This allows us to focus on the core aspects of V-Sekai and achieve our goals more efficiently.

### Goals

```mermaid
stateDiagram-v2
  state "World / Avatar Performance" as WAP {
    [*] --> IK_Points: June 18th, 2023
    IK_Points --> Investigate_ManyBoneIK: IK Points for V-sekai
  }
  
  state "Networking" as NET {
    Investigate_ManyBoneIK --> Elixir_mvsqlite: Investigate ManyBoneIK & mediapipe to support Facial Mocap to ARKit 52 blendshape and audio to face
    Elixir_mvsqlite --> Add_Jitter_Buffer1: Elixir mvsqlite Serversidecar
    Add_Jitter_Buffer1 --> Unidot_Unity_Import: Add jitter buffer to godot_speech
    Unidot_Unity_Import --> Add_Jitter_Buffer2: Unidot Unity Import upload to the asset library
    Add_Jitter_Buffer2 --> Implement_OneVoip: Add jitter buffer to godot_speech
  }

  state "First Time User Experience" as FTUX {
    IK_Points --> Vrm_Upload: Vrm upload to the asset library
  }
```

### Positive Consequences

We can create V-Sekai easier.

### Negative Consequences

Overhead might be hard.

### Option graveyard

- Implementing a custom voice chat solution instead of using onevoip
- Waiting for Godot Engine 4.2 instead of assisting with 4.1 features

### If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No. This is a process.

### Is there a reason why this should be core and done by us?

This is a core process for V-Sekai.

### References

- [V-Sekai](https://v-sekai.org/)

By avoiding work on User Generated Content (UGC) and world building, we can prioritize the three main states in the roadmap: "World / Avatar Performance" (WAP), "Networking" (NET), and "UI/UX". This allows the team to focus on the core aspects of V-Sekai and achieve the goals more efficiently.