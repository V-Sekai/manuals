# Proposed: A Wired-First Strategy for PCVR

## The Context

Constant problems with WiFi video streaming for vr in the stupid summer heat.

## The Problem Statement

Implementing a wired-first strategy for PCVR headsets to mitigate connectivity issues.

## Describe How Your Proposal Will Work with Code, Pseudo-Code, Mock-Ups, or Diagrams

1. Check if the VR headset is connected via a wired connection.
2. If wired, establish a wired connection.
3. If not wired, fall back to a wireless connection.

## The Benefits

- **Stability:** Wired connections are generally more stable than wireless ones.
- **Performance:** Reduced latency and higher data transfer rates.
- **Reliability:** Less interference compared to WiFi.
- **Developer Iteration Times:** Faster and more reliable connections can significantly reduce iteration times during development.

## The Downsides

- **Mobility:** Limited movement due to the physical cable.
- **Setup Complexity:** Additional setup required for wiring.
- **Cost:** Potentially higher costs for longer or specialized cables.

## The Road Not Taken

We're unable to implement this strategy for motion trackers. However, some tracking technologies out of our price range can do passive marker ball tracking.

## The Infrequent Use Case

In scenarios where mobility is crucial, such as large-scale VR experiences, a wireless connection might still be preferred despite its downsides.

## In Core and Done by Us

This proposal will be implemented and maintained by the V-Sekai development team.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
