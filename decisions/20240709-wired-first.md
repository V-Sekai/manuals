# A Wired-First Strategy for PCVR

## The Context

WiFi video streaming for PCVR becomes unreliable in warm ambient conditions, breaking development sessions in summer.

## The Problem Statement

WiFi drops and latency spikes interrupt VR development iteration. There is no policy that makes wired USB-C or DisplayPort the default connection path for PCVR headsets in the V-Sekai studio setup.

## Implementation

1. Check whether the headset is connected via USB-C or DisplayPort.
2. If wired, stream via the wired path.
3. If no wired connection is detected, fall back to WiFi and log a warning.

## The Downsides

Wired connections limit physical movement to cable length. Cables long enough to cover a full play area cost more than short ones. Motion trackers cannot use this strategy — no wired tracking option exists at the project's budget.

## The Road Not Taken

Dedicated 6 GHz WiFi hardware (WiFi 6E access point, per-headset channel reservation) eliminates most interference issues without cables. Rejected on cost: the hardware exceeds the studio budget for a problem that wired connection solves for free.

## Status

Status: Draft <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai, 20240709-wired-first

## Further Reading

