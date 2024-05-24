# Proposed: Without visualization, we cannot easily compare the interpolation states

### Metadata

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,

### Context and Problem Statement

V-Sekai interpolation is poor.

### Describe the proposed option and how it helps to overcome the problem or limitation

Provide visualization for interpolation.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

To optimize end to end interpolation, you can use line graphs and scatter plots. A line graph shows the progress of an animation over time, while a scatter plot shows the data points that were used to create an animation.

A line graph can help you debug physics interpolation issues. If your object's position is not moving smoothly, you can look at how it moved over time and see if there are any sudden changes or jumps in its motion that might be causing problems. This will help you determine whether you need to adjust your physics simulation or tweak some other aspect of your game design.

Second, you can use scatter plots to visualize how different variables interact with each other. For example, if you have an object that's supposed to move along a straight line but instead moves in a curved path, then it might be helpful for you to see whether there are any correlations between its position and its velocity. This will help you isolate which variables are causing this behavior so that you can optimize them individually or together.

### Positive Consequences

We are able to use V-Sekai easier.

### Negative Consequences

We cannot get other features in.

### Option graveyard

- Option: The status quo. <!-- List the proposed options no longer open for consideration. -->
- Rejection Reason: This solves nothing. <!-- List the reasons for the rejection: (the bad traits) -->

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Easy chart is a gdscript addon but it is not trivial to reimplement.

### Is there a reason why this should be core and done by us?

Motion posing is a core feature.

### References

- [V-Sekai](https://v-sekai.org/)
- [Easy Charts](https://github.com/fenix-hub/godot-engine.easy-charts)
