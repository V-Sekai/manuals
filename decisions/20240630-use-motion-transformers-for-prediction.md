# Proposed: Use motion transformers for motion prediction

## MotionGPT: Human Motion as Foreign Language

### The Context

In virtual reality and gaming, predicting human motion is a critical aspect. It helps in creating more realistic characters and enhancing user interaction. Currently, we use traditional methods that are not very efficient and lack accuracy.

### The Problem Statement

The main problem we are trying to solve is to predict the next tokens for motion. This will help us in creating more realistic movements for our characters in the game.

### Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

We propose to use MotionGPT, a transformer-based model that treats human motion as a foreign language. It learns the 'grammar' of human motion from data and uses it to generate new motions.

```python
# Pseudo-code for MotionGPT
def MotionGPT(data):
    model = TransformerModel()
    model.train(data)
    return model.generate_motion()
```

### The Benefits

- Improved accuracy in motion prediction.
- More realistic character movements.
- Enhanced user experience.

### The Downsides

- Requires large amounts of data for training.
- Might be computationally expensive.

### The Road Not Taken

We could have continued using traditional methods for motion prediction but they lack the efficiency and accuracy provided by transformer models.

### The Infrequent Use Case

This proposal might not be beneficial for games that do not require realistic human motion or where the computational resources are limited.

### In Core and Done by Us

This proposal is core to our project as it directly impacts the realism and user experience of our game. It will be implemented by our development team.

### Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

### Decision Makers

- V-Sekai development team

### Tags

- V-Sekai

### Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [MotionGPT: Human Motion](https://motion-gpt.github.io/)

AI assistant Aria assisted with this article.
