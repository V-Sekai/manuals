# Implementation of 3D Garment Previews

## Metadata

- Status: rejected <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai, fire,
- Tags: V-Sekai, ChatGPT-4

## Context and Problem Statement

We want to create 3D models from a front-shot of the garment.

## Proposed Solution

Use Meta's image segmentation model and zero123's 3D reconstruction algorithm to generate novel 3D views of garments from a single front-shot image.

## Implementation

1. **Preprocess the input image**: Resize and normalize the input image to meet the requirements of Meta's image segmentation model.

2. **Extract the garment using Meta's image segmentation model**:
   - Load the pre-trained Meta's image segmentation model.
   - Pass the preprocessed input image through the model to obtain the segmented garment image.

3. **Prepare the segmented garment for 3D reconstruction**:
   - Convert the segmented garment into a format compatible with zero123's 3D reconstruction algorithm (e.g., point cloud or depth map).

4. **Apply zero123's 3D reconstruction algorithm**:
   - Load the pre-trained zero123's 3D reconstruction model.
   - Pass the prepared segmented garment data through the model to generate a 3D mesh of the garment.

5. **Generate novel 3D views of the garment**:
   - Set up a virtual 3D camera in the 3D environment containing the reconstructed garment mesh.
   - Rotate the 3D camera at intervals of 20 degrees around the garment to capture multiple 3D views.

## Positive Consequences

- Enhanced user experience with realistic 3D garment previews.
- Improved understanding of garment fit and style.
- Increased creator satisfaction.

## Negative Consequences

- Potential increase in computational resources required for processing.
- Possible limitations in accuracy and quality of generated 3D models.

## Option graveyard

- Using multiple images for 3D reconstruction (discarded due to not enough input images for 3D construction).

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement requires integration of advanced image segmentation and 3D reconstruction algorithms, which cannot be achieved with a simple script.

## Is there a reason why this should be core and done by us?

Yes, implementing this feature as part of our core project will improve our opensource community of creators.

## References

- [V-Sekai](https://v-sekai.org/)