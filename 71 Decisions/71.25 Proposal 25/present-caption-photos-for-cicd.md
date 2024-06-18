# Proposed: Image Captioning Tool

## Context

In the V-Sekai project, we are developing a continuous integration and continuous delivery (CI/CD) tool for Meta Platform Inc.'s Virtual Reality OpenXR API headset simulator (Windows 11). A key feature of this tool is the ability to caption images.

## Problem Statement

We need to caption images for two main reasons:

1. Debugging: Developers can quickly identify issues by reading the captions.
2. Dataset Creation: We can create a nominal vs anomaly dataset for visual anomaly detection.

## Proposal

Here's a Python script that uses the Gradio client to generate captions for images:

```python
# Copyright (c) 2019-2022 K. S. Ernest (iFire) Lee (fire)
# SPDX-License-Identifier: MIT
# pip3 install gradio_client
from gradio_client import Client, handle_file

file_or_url_paths = ["//192.168.1.72/share/Screenshot 2024-05-22 at 6.05.58 PM.png"]
client = Client("gokaygokay/PaliGemma-PixelProse")

for path in file_or_url_paths:
    try:
        result = client.predict(
            image=handle_file(path),
            api_name="/create_captions_rich"
        )
        print(result)
    except Exception as e:
        print(f"An error occurred while processing {path}: {e}")
```

## Benefits

- Improved debugging process.
- Facilitates the creation of a dataset for visual anomaly detection.

## Downsides

- The accuracy of the captions depends on the performance of the Gradio client.

## Road Not Taken

- We could have used other image captioning tools or libraries, but we chose Gradio due to its simplicity and ease of use.

## Infrequent Use Case

- This tool may not be useful when working with non-visual data or when debugging is not required.

## In Core and Done by Us

- This feature will be developed and maintained by the V-Sekai development team.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - The GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

This proposal was assisted by Aria, an AI assistant.
