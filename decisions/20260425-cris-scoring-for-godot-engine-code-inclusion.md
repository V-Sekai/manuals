# CRIS Scoring for Development Work

- Status: accepted
- Deciders: V-Sekai, fire
- Tags: V-Sekai, process, 20260425-cris-scoring-for-godot-engine-code-inclusion

## Context and Problem Statement

V-Sekai has no shared framework for ranking work; decisions depend on who is
in the room. A Godot Engine conference presentation (April 2026) introduced
the **CRIS** scoring framework for code inclusion decisions. We adopt it as
the canonical tool for deciding where to invest effort across the entire
V-Sekai project — Godot Engine patches, backend features, infrastructure,
and tooling.

## Decision

Use the CRIS score to rank any candidate unit of work — a Godot Engine patch,
a backend feature, a test suite, an infrastructure change — when deciding
whether to build it now, defer it, or drop it.

## CRIS Scoring

Each factor adds (+) or subtracts (−) from the candidate's priority score.

| Factor          | Raises priority             | Lowers priority          |
| --------------- | --------------------------- | ------------------------ |
| **C**omplexity  | Low complexity              | High complexity          |
| **R**each       | Affects many users          | Affects nobody           |
| **I**mpediment  | Blocks progress on the game | Easy workaround exists   |
| **S**takeholder | Large project depends on it | No project depends on it |

## How to Apply

1. For any candidate piece of work, fill in a brief CRIS table in the
   tracking issue, PR description, or TODO entry.
2. Score each factor +1 (favourable) or −1 (unfavourable). Sum to a total.
3. Use the total to guide the decision:

   | Total       | Default action                                    |
   | ----------- | ------------------------------------------------- |
   | +3 or +4    | Build now; high urgency                           |
   | +1 or +2    | Schedule soon; normal priority                    |
   | −1 or 0     | Defer; revisit when a stakeholder project appears |
   | −2 or lower | Drop; document why in an option graveyard         |

4. Any decider may override the default with a written rationale. The CRIS
   score is a guide, not a veto.

## Application to Specific Areas

### Godot Engine fork

CRIS determines whether a patch is worth carrying. The existing flowchart
([20211207-for-godot-engine-changes-use-a-decision-flowchart.md](20211207-for-godot-engine-changes-use-a-decision-flowchart.md)) then
determines _where_ it lives (fork-only, upstream PR, or V-Sekai-specific
branch). Apply CRIS first; apply the flowchart only if CRIS clears it.

### Backend and infrastructure

CRIS ranks competing feature requests and bug fixes in the Elixir backend,
hosting stack, and CI pipeline. A ticket that scores +3 or +4 gets pulled
into the current sprint; the reviewer closes a ticket scoring −2 or lower
with a note.

### Research and tooling

New tools, languages, or frameworks go through CRIS before any prototype
work begins. High Complexity and low Stakeholder support disqualify a
candidate unless Reach and Impediment compensate.

## Positive Consequences

- Contributors share a vocabulary that works across every subsystem.
- Contributors can self-assess before requesting review or opening a PR.
- Reviewers drop low-CRIS work early.
- The CRIS table in each issue makes the decision auditable later.

## Negative Consequences

- Scoring is subjective; two reviewers may reach different totals.
- A niche but genuinely blocking item (low Reach, high Impediment for one
  team) can be underweighted if reviewers anchor on Reach.

## Option Graveyard

- Option: Ad-hoc prioritising by whoever is loudest.
- Rejection reason: Produces inconsistent outcomes and repeated arguments.

- Option: Strict urgency-only ordering (fix what is broken, ignore the rest).
- Rejection reason: Ignores strategic value and leaves important features
  unbuilt indefinitely.

- Option: Separate scoring rubrics per subsystem.
- Rejection reason: Fragments the vocabulary; makes cross-team trade-offs
  impossible to compare.

## References

- Godot Engine conference slide, April 2026: "Factors that should determine
  code inclusion: CRIS Scoring" (Complexity, Reach, Impediment, Stakeholder).
- [20211207-for-godot-engine-changes-use-a-decision-flowchart.md](20211207-for-godot-engine-changes-use-a-decision-flowchart.md)
