# Proposed: Spreadsheet Animation Preview

### Context and Problem Statement

Workflow for QA testing animations

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

Load in a spreadsheet dataview of animation tracks and play animation back.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

Work on https://github.com/V-Sekai/godot-hop-spin-dance.

- Display a spreadsheet view.

| Key | EN  | Animation | Queue Play |
| --- | --- | --------- | ---------- |
|     |     |           |            |

- Show the debug animation tree.

- Show graphical playback on a VRM character

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not trivial, combines a spreadsheet with animations, an animation tree debugger and a animation player.

### Positive Consequences

Able to QA animations easier.

### Negative Consequences

A sizable amount of work.

### Is there a reason why this should be core and done by us?

We care about characters.

### References

GDC 2021 Summer:

- 'Genshin Impact': Building a Scalable AI System
  This session reviews some of AI programming challenges in developing open-world game 'Genshin Impact' and describes several handful methods to improve AI system scalability. It details an AI framework and production pipeline that allow designers to craft huge amount of AI archetypes quickly and flexibly. Next, Genshin's pathfinding service is introduced, an approach to reduce NavMesh disk and memory space overhead, caused by continuously-growing world map. Finally, this session discusses AI performance optimization and shows how AI system can be modularized and broke down into multi-threaded tasks on CPU.
- Emotional Systemic Facial of 'Last of Us Part II'
  As graphic fidelity in video games has rapidly accelerated, one aspect of development has overwhelmingly remained stagnant; in-game character emotions. In this talk, Naughty Dog explores how they addressed this industry wide limitation in The Last of Us Part II. Represented by team members from character rigging, animation, dialogue, and design; this talk comprehensively covers how character emotion was brought into gameplay ranging from nuanced narrative moments to adrenaline charged melee combat. Learn about the challenges, implementation, and innovation that occurred to develop the systemic emotion system that brought over 65 characters speaking 13 languages with up to 20 individual emotions to life.
- Motion Matching in 'The Last of Us Part II'
  Naughty Dog is known for the animation quality of their titles. For The Last of Us Part II, they decided to take a leap of faith and switch to at that time pretty experimental animation system called Motion Matching. Two Naughty Dog technical animators will tell you the story of initial joy, later frustration and ultimate fear as the development of the new project went on and but not everything went according to plan. Thanks to many clever solution, hard work and a very talented team, Naughty Dog was able to ship a game that was unanimously praised for animation quality among critics and players.
- https://tabletomarkdown.com/convert-spreadsheet-to-markdown/
- https://github.com/deflinhec/GodotGoogleSheet
- https://baserow.io/
- https://github.com/fenix-hub/godot-engine.easy-charts
- https://github.com/godotengine/godot/pull/32408

### Derivative License

Copyright (c) 2020-2021 V-Sekai contributors.

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
