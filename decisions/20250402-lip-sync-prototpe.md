# Proposed: Lip Sync to Facial Action Coding System

## Context

This proposal involves the development of a speech-to-FACS (Facial Action Coding System) mapping pipeline to capture real-world 3D facial movements synchronized with speech. Metrics include the accuracy of lip-sync, the diversity of speakers and phrases, and the scalability of the system. A robust speech-to-FACS mapping system can enhance virtual avatars, animation, and human-computer interaction. This proposal addresses the growing need for realistic virtual characters in industries like entertainment, education, and healthcare, making it timely and strategically relevant.

## Problem Statement

The primary issues causing operational challenges are:

1. Lack of a robust speech-to-FACS system for capturing 3D facial movements synchronized with speech.
2. Difficulty in collecting diverse, high-quality training/validation data.
3. Risk of overfitting to lab data and insufficient real-world noise augmentation.

## Proposed Solution

A speech-to-FACS pipeline that maps speech to 3D facial movements using multimodal alignment and reinforcement learning. Key technical steps include:

- Converting FaceMotion3D blend shapes renderings with markers at vertex positions to Keypoint COCO JSON format.
- Leveraging "Accent Tag" phonetic-rich sentences for training.
- Aligning audio to FACS keypoints via a multimodal large language model.
- Applying reinforcement learning to generate speech matching COCO Full Body Face data from masked audio.

**Implementation Steps**:

1. Collect and preprocess data (blend shape conversion, speaker recordings).
2. Train a multimodal model for audio-FACS alignment.
3. Implement reinforcement learning for speech generation.

## Implementation Plan

1. **Phase 1**: Data Collection & Preprocessing
   - Convert FaceMotion3D blend shapes to COCO JSON.
   - Record diverse speakers performing phonetic-rich phrases.
2. **Phase 2**: Model Development & Training
   - Train multimodal model for audio-to-FACS alignment.
   - Develop reinforcement learning pipeline for masked audio matching.
3. **Validation**:
   - Success Criteria: High lip-sync accuracy (>90%) and positive user study feedback.
   - Failure Threshold: <10% improvement in accuracy or negative user assessments.

## Benefits

- Improved lip-sync accuracy for virtual avatars and animations.
- Enhanced user engagement in entertainment, education, and healthcare.
- Scalable data collection and model development processes.

## Risks and Limitations

- Overfitting to lab data without real-world noise augmentation.
- Challenges in acquiring diverse, high-quality training data.
- Potential inaccuracies in FaceMotion3D animations.

## Alternatives Considered

| Option                          | Pros               | Cons                            |
| ------------------------------- | ------------------ | ------------------------------- |
| Existing speech-to-text systems | Faster development | Lower accuracy and flexibility  |
| Custom speech-to-FACS system    | Higher accuracy    | Higher cost and longer timeline |

## When to Avoid This Solution

Avoid if high realism is unnecessary or development costs/time are prohibitive.

## Organizational Alignment

Supports organizational goals in virtual character innovation and aligns with priorities for experience enhancement.

## Proposal Status

Status: Proposed

## Decision Makers

- iFire

## Tags

- Artificial Intelligence
- Machine Learning
- Virtual Avatars
- Animation

## References

1. [FaceMotion3D Documentation](https://www.facemotion3d.net/)
2. [PHI-4 Multimodal Model Repository](https://github.com/roboflow/maestro/issues/194)
3. [v-sekai Project Repository](https://github.com/v-sekai)
