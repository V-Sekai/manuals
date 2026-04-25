# CRIS Scoring for Development Effort Prioritisation

- Status: accepted
- Deciders: V-Sekai, fire
- Tags: V-Sekai, process

## Context and Problem Statement

The V-Sekai project spans multiple components — a Godot Engine fork, an
Elixir/Phoenix backend, WebTransport networking, asset delivery, and more.
Across all of these, the team regularly faces the same question: is this
work worth doing now? Without a shared framework, the decision depends on
who is in the room and what mood they are in.

A Godot Engine conference presentation (April 2026) introduced the **CRIS**
scoring framework as a principled way to prioritise code inclusion decisions.
We generalise it as the canonical tool for deciding where to invest
development effort across the entire V-Sekai project, not only Godot patches.

## Decision

Use the CRIS score to rank any candidate unit of work — a Godot Engine patch,
a backend feature, a test suite, an infrastructure change — when deciding
whether to build it now, defer it, or drop it.

## CRIS Scoring

Each factor adds (+) or subtracts (−) from the candidate's priority score.

| Factor | Raises priority | Lowers priority |
|--------|----------------|----------------|
| **C**omplexity | Low complexity | High complexity |
| **R**each | Affects many users | Affects nobody |
| **I**mpediment | Blocks progress on the game | Easy workaround exists |
| **S**takeholder | Large project depends on it | No project depends on it |

A unit of work scores higher when it is simple, widely needed, blocking, and
backed by a real project. It scores lower when it is complex, niche, optional,
and unsupported.

## How to Apply

1. For any candidate piece of work, fill in a brief CRIS table in the
   tracking issue, PR description, or TODO entry.
2. Score each factor +1 (favourable) or −1 (unfavourable). Sum to a total.
3. Use the total to guide the decision:

   | Total | Default action |
   |-------|---------------|
   | +3 or +4 | Build now; high urgency |
   | +1 or +2 | Schedule soon; normal priority |
   | −1 or 0 | Defer; revisit when a stakeholder project appears |
   | −2 or lower | Drop; document why in an option graveyard |

4. Any decider may override the default with a written rationale. The CRIS
   score is a guide, not a veto.

## Application to Specific Areas

### Godot Engine fork

CRIS determines whether a patch is worth carrying. The existing flowchart
(`20211207-for-godot-engine-changes-use-a-decision-flowchart.md`) then
determines *where* it lives (fork-only, upstream PR, or V-Sekai-specific
branch). Apply CRIS first; apply the flowchart only if CRIS clears it.

### Backend and infrastructure

CRIS ranks competing feature requests and bug fixes in the Elixir backend,
hosting stack, and CI pipeline. A ticket that scores +3 or +4 gets pulled
into the current sprint; a ticket that scores −2 or lower is closed with a
note.

### Research and tooling

New tools, languages, or frameworks are evaluated with CRIS before any
prototype work begins. High Complexity and low Stakeholder support are
disqualifying unless Reach and Impediment compensate.

## Positive Consequences

- Shared vocabulary that works across every subsystem.
- Contributors can self-assess before requesting review or opening a PR.
- Low-CRIS work is dropped early, freeing capacity for high-value tasks.
- Decisions are auditable: the CRIS table is preserved in the issue history.

## Negative Consequences

- Scoring is subjective; two reviewers may reach different totals.
- A niche but genuinely blocking item (low Reach, high Impediment for one
  team) can be underweighted if reviewers anchor on Reach.

## Option Graveyard

- Option: Ad-hoc prioritisation by whoever is loudest.
- Rejection reason: Produces inconsistent outcomes and repeated arguments.

- Option: Strict urgency-only ordering (fix what is broken, ignore the rest).
- Rejection reason: Ignores strategic value and lets important features
  remain unbuilt indefinitely.

- Option: Separate scoring rubrics per subsystem.
- Rejection reason: Fragments the vocabulary; makes cross-team trade-offs
  impossible to compare.

## References

- Godot Engine conference slide, April 2026: "Factors that should determine
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
