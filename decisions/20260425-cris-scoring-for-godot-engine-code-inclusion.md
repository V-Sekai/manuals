# CRIS Scoring for Godot Engine Code Inclusion

- Status: accepted
- Deciders: V-Sekai, fire
- Tags: V-Sekai, godot-engine, process

## Context and Problem Statement

The V-Sekai project maintains a Godot Engine fork assembled from many
feature branches via `.gitassembly`. Deciding which patches to carry,
upstream, or drop is a recurring source of debate with no shared vocabulary.
A Godot Engine conference presentation (April 2025) introduced the **CRIS**
scoring framework as a principled way to prioritise code inclusion decisions.
We adopt it as the canonical tiebreaker for V-Sekai Godot branch management.

## Decision

Use the CRIS score to rank candidate patches when deciding whether to carry
a change in the V-Sekai Godot fork, upstream it, or defer/drop it.

## CRIS Scoring

Each factor adds (+) or subtracts (−) from the candidate's priority score.

| Factor | Raises priority | Lowers priority |
|--------|----------------|----------------|
| **C**omplexity | Low complexity | High complexity |
| **R**each | Affects many users | Affects nobody |
| **I**mpediment | Blocks game progress | Easy workaround exists |
| **S**takeholder | Large project depends on it | No project depends on it |

A patch scores higher when it is simple, widely needed, blocking, and backed
by a real project. A patch scores lower when it is complex, niche, optional,
and unsupported.

## How to Apply

1. For each candidate patch open a brief CRIS table in its tracking issue or
   `.gitassembly` comment.
2. Score each factor +1 (favourable) or −1 (unfavourable). Sum to a total.
3. Use the total to guide the decision:

   | Total | Default action |
   |-------|---------------|
   | +3 or +4 | Carry in fork; submit upstream PR immediately |
   | +1 or +2 | Carry in fork; upstream PR when bandwidth allows |
   | −1 or 0 | Defer; revisit when a stakeholder project appears |
   | −2 or lower | Drop from fork; document in option graveyard |

4. Any decider may override the default with a written rationale. The CRIS
   score is a guide, not a veto.

## Relationship to the Existing Flowchart

This ADR supplements `20211207-for-godot-engine-changes-use-a-decision-flowchart.md`.
That flowchart answers *where* a change lives (fork vs. upstream PR vs.
V-Sekai-only). CRIS answers *whether* the change is worth the carrying cost
at all. Apply the flowchart after CRIS clears a change for inclusion.

## Positive Consequences

- Shared vocabulary reduces patch-inclusion debates to a structured checklist.
- Patch authors can self-assess before requesting review.
- Low-CRIS changes are dropped early, reducing fork maintenance burden.

## Negative Consequences

- Scoring is subjective; two reviewers may score the same patch differently.
- A genuinely important but niche patch (low Reach, high Impediment for one
  team) might be underweighted by the total.

## Option Graveyard

- Option: Ad-hoc per-patch discussion with no framework.
- Rejection reason: Produces inconsistent outcomes and repeated arguments.

- Option: Upstream-only policy (never carry patches locally).
- Rejection reason: Upstream review latency blocks game development.

## References

- Godot Engine conference slide, April 2025: "Factors that should determine
  code inclusion: CRIS Scoring" (Complexity, Reach, Impediment, Stakeholder).
- `20211207-for-godot-engine-changes-use-a-decision-flowchart.md`

## Derivative License

Copyright (c) 2026 V-Sekai contributors.

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
