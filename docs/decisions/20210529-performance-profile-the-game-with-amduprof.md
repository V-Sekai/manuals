# Performance profile the game with AMDuProf

## Context and Problem Statement

How do we profile the game?

The context is for example importing files are slow (they're not the biggest bottleneck anymore). What tools and techniques can we use?

## Describe the proposed option and how it helps to overcome the problem or limitation

Use AMDuProf

## Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

AMDuProf shows the slower functions and there's also a callgraph and flamegraph feature.

A callgraph is similar to a stacktrace.

A flamegraph is a way of visualizing performance.

The workflow is for each item start from the top and go down.

## Positive Consequences <!-- optional -->

- Works for both Intel and AMD
- Works on Windows 10 and Linux

## Negative Consequences <!-- optional -->

- Less usable than superluminal
- Slower than superluminal

[this section can be repeated for each option, if more than one option is open for consideration]

## Option graveyard: same as above

* Option: superluminal
* Rejection reason: 
    * Not free

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not appliable.

## Is there a reason why this should be core and done by us?

Not in code. This is documenting a technique.

## Links <!-- optional -->

- https://superluminal.eu/
- https://developer.amd.com/amd-uprof
- http://www.brendangregg.com/flamegraphs.html
