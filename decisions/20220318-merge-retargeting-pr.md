# Proposed: Merge retargeting feature into Godot Engine master

### Describe the status of the issue.

Superceded by the https://github.com/V-Sekai/V-Sekai.github.io/issues/229 proposal.

### List the deciders of the issue.

V-Sekai,tokage,fire,lyuma

### Describe the tags of the issue.

V-Sekai,animation,retargeting,

### Context and Problem Statement

We want to share animations among different skeletons.

### Describe the proposed option and how it helps to overcome the problem or limitation

Use tokage's animation retargeting.

#### Lyuma's explanations

First of all, Local (rest) and Absolute modes are not good enough for most of the common retargeting cases. As a test,. I transferred a local animation from one character to an Xbot model, and the animation was broken. See here: left is Global (GLO) which works well. Right is Local (LOC) which has arms and body backwards (image below).

So the question is: when is Global not good enough? Well, it is not well suited for finger bones. By its very nature, it does not know how finger bones work, since it is working on the "silhouette" of the model.

This means none of these retargeting modes are good enough on their own. So what can we do about it?

Perhaps it is possible to create an importer which twists fingers in the Bone Rest matrix into a configuration suitable for Global retargeting? I can't say whether or not this is possible, but if this could be solved, then maybe we can use Global mode for everything?

It could be declared that finger bones shall be local, and all other bones shall be global, and everyone making assets should agree on finger rotations. This might not always be possible, but this is my interpretation of reduz's idea of storing the PlaybackMode in Node B in Tokage's diagram.

Or it could be left up to each animation artist / importer which to use, and then you're going to have a mixture of modes. If so, I see two ways to deal with it:

The animations are stored in global along with skeleton and converted using the source skeleton. This sounds ok in principle if some conversion tool could be made, but I would be afraid to deal with converting animations on the fly at runtime.

The animations must point to the RetargetOption they were generated with (or a per-track retarget mode), so that these differently sourced animations can be mixed.

from what I can understand, "2" is what Tokage is proposing. I don't see many other solutions to this. Fundamentally, if it is the case that animations made from different models are needed to be mixed, I don't see a viable solution other than the last one.

![158130997-7582d581-2b3c-45f5-b28f-deb26f2f6ffd](./attachments/158152887-0f91d668-12f0-487a-a217-eb5b38881f9a.png)

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

- See pull request.

### Positive Consequences

- Sharing animations will make Godot Engine better.

### Negative Consequences

- The feature is hard to do.

### Option graveyard

- Use Blender and other types of retargeting

### If this enhancement will not be used often, can it be worked around with a few lines of script?

- NOT A FEW LINES OF SCRIPT!!!

### Is there a reason why this should be core and done by us?

- This should be a core feature of Godot Engine.

### References

- [V-Sekai](https://v-sekai.org/)
- `https://github.com/godotengine/godot/pull/56902`

### License of the contribution

Copyright (c) 2022 V-Sekai contributors. Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
