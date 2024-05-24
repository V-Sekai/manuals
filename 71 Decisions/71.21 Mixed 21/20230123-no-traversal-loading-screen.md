# Proposed: No traversal loading screen

### Metadata

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

### Context and Problem Statement

This is a proposal to mask the loading time, but it doesn't solve it.

### Describe the proposed option and how it helps to overcome the problem or limitation

Trim the steps needed to enter the game.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

When you first start up the application, you will see a loading screen. This screen will be displayed until all the assets needed to load your world have been downloaded.

When switching between worlds, there is technically no need for a loading screen. Both leading platforms have chosen to include one in their applications, but this is not necessary. The leading platform displays a loading screen when clicking to go to a new world, while the secondary leading platform does not display one--you stay in your original world while also loading into the second world and then switch over once enough of it has been downloaded that you can be there.

You click go and are left in your current world while loading in the other world, once the other world is completely loaded in you are transported to it instantaneously.

### Positive Consequences

    Able to mask loading times
    Able to direct players to the positive parts of v-sekai

For style points we could enforce portals that seamlessly transport you between different worlds, at least, as the default option, you place a portal, it has a camera, and you can walk through it, and after a certain point it disappears.

### Negative Consequences

    coordinating cats

The drawback to the multi-world load is that it is more resource intensive, though it should only last a short while, so if we do go that route it should be an option to use a loading screen instead.

It makes for a far less friction-less experience

But again, resource intensive issues, so will have to be optional

We could even add a little button you click once you are ready to be transported, so it doesn't happen against your will if your trying to say something last minute.

### Option graveyard

- Option: The status quo. <!-- List the proposed options no longer open for consideration. -->
- Rejection Reason: This solves nothing. <!-- List the reasons for the rejection: (the bad traits) -->

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not script.

### Is there a reason why this should be core and done by us?

World traversal is a problem.

### References

- [V-Sekai](https://v-sekai.org/)

### License of the contribution

```
MIT License

Copyright (c) 2018-present SaracenOne
Copyright (c) 2019-present K. S. Ernest (iFire) Lee (fire)
Copyright (c) 2020-present Lyuma
Copyright (c) 2020-present MMMaellon
Copyright (c) 2022-present See authors.md

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
