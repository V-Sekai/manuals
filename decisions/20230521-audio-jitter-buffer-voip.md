# Proposed: Improving Jitter-Buffer Implementation for Voice Chat in V-Sekai Projects

## Metadata

- Status: proposed
- Deciders: V-Sekai, lyuma, Dreadpon,
- Tags: V-Sekai, GPT-4, jitter-buffer, voice-chat, godot-speech, audio-quality, adaptive-jitter-buffer, Speex

## Context and Problem Statement

Dreadpon is working on a voice chat solution inside Godot 3.5.2 and found the jitter-buffer implementation in [godot-speech](https://github.com/V-Sekai/godot-speech) to be rudimentary. They are looking for an ideal jitter-buffer implementation that can handle both slowing down and speeding up played audio.

## Proposed Solution

Use the adaptive jitter buffer from the Speex source code as a starting point, with modifications to address its limitations:

1. Capture packets as they are being dropped from the jitter buffer.
2. Ensure all captured packets are played.
3. Implement a playback buffer to speed up the audio when necessary.

## Implementation

1. Integrate the adaptive jitter buffer from the Speex source code into the godot-speech project.
2. Modify the jitter buffer to capture dropped packets and store them in a separate buffer.
3. Implement a playback buffer that accelerates audio playback when more audio packets are available.
4. Test the new implementation to ensure it handles jitter compensation effectively.

## Positive Consequences

- Improved jitter compensation in the voice chat solution.
- Better handling of packet drops and audio acceleration.
- Enhanced overall audio quality in the voice chat system.

## Negative Consequences

- Additional complexity in the godot-speech codebase.
- Potential performance impact due to the added buffering mechanism.

## Option graveyard

- Continue using the current rudimentary jitter-buffer implementation in godot-speech.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement is essential for a high-quality voice chat solution and cannot be easily worked around with a few lines of script.

## Is there a reason why this should be core and done by us?

Yes, improving the jitter-buffer implementation is crucial for providing a reliable and high-quality voice chat experience in V-Sekai projects.

## References

- [V-Sekai](https://v-sekai.org/)
- [godot-speech](https://github.com/V-Sekai/godot-speech)
- [Speex](https://www.speex.org/)
