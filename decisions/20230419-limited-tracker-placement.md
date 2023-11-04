# Proposed: Capturing accurate body movements with limited tracker placement

### Metadata

- Status: superseded by `20230602-limited-tracker-placement.md` <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,


### Context and Problem Statement

In our current VR project, we face the challenge of capturing accurate body movements for both soccer and dancing experiences with a limited budget. How can we prioritize the placement of a limited number of trackers to ensure a realistic and immersive experience for both activities?

### Describe the proposed option and how it helps to overcome the problem or limitation

The proposed option involves prioritizing tracker placement for the head, hands, hips, and feet, as they are essential for both soccer and dancing experiences. This approach allows for an effective trade-off between tracking accuracy and budget constraints while ensuring a satisfactory level of immersion in both activities.

### Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

1. Head: At the base of the neck to monitor head rotation and tilt.
2. Left Hand: On the left wrist to track the overall motion of the left hand.
3. Right Hand: On the right wrist to track the overall motion of the right hand.
4. Hips: A tracker on the hips to monitor lower body movement.
5. Left Foot: A tracker on the left foot to capture left foot movement, essential for both soccer and dancing.
6. Right Foot: A tracker on the right foot to capture right foot movement, also crucial for both activities.

As the budget permits, additional trackers can be incorporated into the setup to further enhance tracking accuracy, particularly for the upper body and leg movements. This expansion can be achieved by following the prioritized list of additional trackers below:

7. Chest: A tracker on the chest to monitor upper body rotation, providing more detailed information about the user's torso movements.
8. Left Shoulder: A tracker on the left shoulder to track upper arm rotation, allowing for more precise tracking of arm movements during soccer and dancing.
9. Right Shoulder: A tracker on the right shoulder to track upper arm rotation, complementing the left shoulder tracker for better arm movement tracking.
10. Left Knee: A tracker on the left knee to track left leg movement, enhancing the realism of leg movements and providing more accurate feedback for actions like kicking in soccer or complex footwork in dancing.
11. Right Knee: A tracker on the right knee to track right leg movement, mirroring the benefits of the left knee tracker for a balanced leg movement representation.

By gradually adding these trackers to the initial setup, the overall tracking accuracy of the system will be improved. This will result in more natural and immersive interactions within the VR environment, leading to a more satisfying user experience for both soccer and dancing activities.

### Positive Consequences

- Effective use of a limited budget while maintaining immersive experiences.
- The solution caters to both soccer and dancing activities in VR.
- Flexibility in adding more trackers as budget permits.

### Negative Consequences

- Reduced tracking accuracy for upper body and leg movements compared to a setup with more trackers.
- Potential limitations in supporting advanced features or interactions in VR.

### Option graveyard

Camera-based tracking: Utilizing external cameras to track body movements without the need for wearable trackers. While this approach can be cost-effective, it may not provide the same level of accuracy and precision as wearable trackers, particularly for fast and complex movements in soccer and dancing. Additionally, camera-based tracking can be sensitive to lighting conditions and may require a specific setup to function optimally.

Camera-based tracking might be a viable solution if budget constraints are severe, but it is essential to consider the potential trade-offs in terms of tracking accuracy and reliability compared to wearable trackers.

### If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, as the proposed solution deals with hardware configuration and the strategic placement of physical trackers to balance budget and immersion.

### Is there a reason why this should be core and done by us?

Yes, ensuring an immersive VR experience with a limited budget is a fundamental challenge that requires expertise in tracker placement and prioritization.

### References

- [V-Sekai](https://v-sekai.org/)
