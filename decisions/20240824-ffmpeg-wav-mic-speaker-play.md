# Proposed: FFMPEG Wave/Mic and Speaker/Play

## The Context

Testing audio input and output for VOIP applications.

## The Problem Statement

Simulate microphone input and capture speaker output to debug and test audio functionality.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

The following script uses `ffmpeg` to play a WAV file as microphone input and record the speaker output. This setup is designed to work on macOS, Windows, and Linux.

### Bash Script (macOS/Linux)

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

### Batch Script (Windows)

```batch
@echo off

:: Define file paths and device IDs
set INPUT_WAV=C:\path\to\input.wav
set OUTPUT_WAV=C:\path\to\output\speaker_output.wav
set MIC_DEVICE=audio="Microphone (Realtek High Definition Audio)"  :: Replace with your actual mic device name
set SPEAKER_DEVICE=audio="Speakers (Realtek High Definition Audio)" :: Replace with your actual speaker device name
set DURATION=10  :: Duration in seconds

:: Play the WAV file as microphone input using ffmpeg
start /B ffmpeg -re -i %INPUT_WAV% -f dshow -i %MIC_DEVICE%

:: Record the speaker output to a WAV file
ffmpeg -f dshow -i %SPEAKER_DEVICE% -t %DURATION% -ac 2 -ar 44100 %OUTPUT_WAV%

:: Wait for background processes to finish
wait
```

### Listing Devices on Windows

To list available audio devices on Windows, you can use the following command:

```batch
ffmpeg -list_devices true -f dshow -i dummy
```

This will output a list of all available audio devices, which you can then use to replace the `MIC_DEVICE` and `SPEAKER_DEVICE` placeholders in the batch script.

### Steps:

1. **Define File Paths and Device IDs**:

   - `INPUT_WAV`: Path to the input WAV file.
   - `OUTPUT_WAV`: Path where the recorded speaker output will be saved.
   - `MIC_DEVICE`: Microphone device ID (replace with actual device ID).
   - `SPEAKER_DEVICE`: Speaker device ID (replace with actual device ID).
   - `DURATION`: Duration of the recording in seconds.

2. **Play the WAV File as Microphone Input**:

   - Use `ffmpeg` to play the input WAV file as if it were coming from the microphone.

3. **Record the Speaker Output**:

   - Use `ffmpeg` to record the speaker output to a WAV file for the specified duration.

4. **Wait for Background Processes**:
   - Ensure all background processes complete before the script exits.

## The Benefits

- **Automated Testing**: Enables automated testing of VOIP clients.
- **Versatility**: Can be used to test various VOIP applications like Discord and VRChat.
- **Prototyping**: Useful for prototyping WebRTC later.

## The Downsides

- **Complex Setup**: Requires knowledge of audio systems and command-line tools.
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
