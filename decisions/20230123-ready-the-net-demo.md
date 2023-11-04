# Proposed: Ready net demo

### Context and Problem Statement

Get the net demo ready for merge into V-Sekai

### Describe the proposed option and how it helps to overcome the problem or limitation

I want to get the net demo ready for presentation.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. jitter buffer window of 100ms
2. bit packing with the godot engine core animation compression
3. perfect prediction using ballistic trajectory https://github.com/fbsamples/oculus-networked-physics-sample/blob/f4242f317fc1c81348308bdd69774c637c3c0f91/Networked%20Physics/Assets/Scripts/Prediction.cs#L48

### Positive Consequences

We'll have lag free VR network sync.

### Negative Consequences

May have cheating with this type of replication.

### Option graveyard

Option: The status quo.
Rejection Reason: This solves nothing.


### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not trivial.

### Is there a reason why this should be core and done by us?

We are doing this.

### References

- [V-Sekai](https://v-sekai.org/)


### License of the contribution

Copyright (c) 2019-latest V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
