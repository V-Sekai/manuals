# View the worlds and interact with people in VR without being in VR via a Discord Inward Portal

## Context and Problem Statement

I want to see the worlds and interact with people in VR, without being in VR myself.

## Describe the proposed option and how it helps to overcome the problem or limitation

A Discord voice/video call bot would allow players within the virtual world and outside to interact with each other.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

This would be a bot client that connects to at least one server shard, and joins a Discord voice call, using WebRTC APIs to communicate voice and video data from Godot into discord.

## Positive Consequences <!-- optional -->

- Growing engagement with Groups

## Negative Consequences <!-- optional -->

- Requires Discord

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Players can stream using OBS or discord screen sharing, but this requires players to do it, and only provides uni-directional communication.

## Is there a reason why this should be core and done by us?

It should be a standalone project based on Groups, but not core. The WebRTC depdendency, if needed, would make integration difficult.

## Links <!-- optional -->

- https://discord.com/