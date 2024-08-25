# Proposed: FFMPEG Wave/Mic and Speaker/Play

## The Context

Testing audio input and output for VOIP applications.

## The Problem Statement

Simulate microphone input and capture speaker output to debug and test audio functionality.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

```bash
#!/bin/bash

# Define file paths and device IDs
INPUT_WAV="/path/to/input.wav"
OUTPUT_WAV="/path/to/output/speaker_output.wav"
MIC_DEVICE="plughw:0,0"      # Replace with your actual mic device ID
SPEAKER_DEVICE="plughw:0,0"  # Replace with your actual speaker device ID
DURATION=10                   # Duration in seconds

# Play the WAV file as microphone input using ffmpeg
ffmpeg -re -i $INPUT_WAV -f alsa -ac 2 -ar 44100 hw:$MIC_DEVICE &

# Record the speaker output to a WAV file
ffmpeg -f alsa -i $SPEAKER_DEVICE -t $DURATION -ac 2 -ar 44100 $OUTPUT_WAV

# Wait for background processes to finish
wait
```

## The Benefits

- **Automated Testing**: Enables automated testing of VOIP clients.
- **Versatility**: Can be used to test various VOIP applications like Discord and VRChat.
- **Prototyping**: Useful for prototyping WebRTC later.

## The Downsides

- **Complex Setup**: Requires knowledge of Linux audio systems and command-line tools.
- **Potential Compatibility Issues**: May not work seamlessly across all hardware configurations.

## The Road Not Taken

Using Godot-specific audio stream players and effects was considered but found to be too closely tied to Godot, limiting broader application testing.

## The Infrequent Use Case

In cases where precise audio sample rate configuration is critical, additional adjustments may be needed to avoid issues.

## In Core and Done by Us

This approach aligns with our goal of robust and versatile testing methodologies and will be implemented by our team.

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
