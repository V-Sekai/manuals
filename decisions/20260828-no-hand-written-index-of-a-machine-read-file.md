# A readme carries no hand-written index of a machine-read file

## The Context

The `vsk-world-manifest` readme opened with a `## Sides` table: seven rows, one
per side directory, each with a sentence about what that side holds. Every row
was derived from `default.xml`, and nothing checked that the two agreed.

The table published an anchor, `#sides`, which other documents and conversations
then cited. A reader following that link landed on the copy rather than on the
file it was copied from.

This workspace has met the same failure three times already. A comment beside a
`<project>` is prose no tool reads. A `<copyfile>` at the workspace root is a
second copy of a file that drifts between syncs. A submodule bump is a bare hash
with no name attached. Each is a fact in a second place, visible to nothing that
checks.

## The Problem Statement

Every change to the layout required a second edit, in a second file, in a
different repository from the change that prompted it. Nothing failed when only
one of the two was made, and a reader had no way to tell which of the two was
current.

The suffix work described in the sibling decision moved 27 paths in one
afternoon. The readme was edited twice during it, and one paragraph still named
a path that had been renamed hours earlier.

## Design

`check_readme_index.py` fails any block of the readme naming three or more
distinct things `default.xml` declares: a side directory, a `<project name=>`, or
a `<project path=>`.

The vocabulary is read out of `default.xml` when the gate runs. A gate holding
its own list of the seven side names would be the same defect one file further
in.

Three is the threshold. Two names is a comparison, and prose that cannot show a
pair cannot make a point; three is where a listing stops illustrating and starts
enumerating, which is what has to be re-edited when the layout moves.

Measurement is per block at every depth, and prose counts. A paragraph naming
three projects across three sentences needs exactly the hand edit a three-row
table does, and exempting it would leave the rule enforcing a formatting
preference. Fenced and indented code blocks are exempt, because a `repo init`
line is copied and run rather than read as a listing.

Nine negative controls ship with the gate, and CI runs them before it runs the
gate. Six must fail: the sides table verbatim, a list of three paths, a paragraph
of three, an index nested inside a list item, a heading that is itself a listing,
and a manifest that does not parse. Three must pass: a pair, three paths inside a
fenced command, and a readme naming nothing.

Generating the index was deferred rather than rejected. Until that tooling
exists, the honest arrangement is no index, and the reader is sent to
`default.xml`, which is sorted by side and cannot be out of date with itself.

One copy of what each side holds survives, in `CLAUDE.md` in this repository. It
describes what belongs on a side, which is a rule rather than a listing of what
is currently placed there, and the manifest readme points at it.

## CRIS Score

| Factor          | Score | Evidence |
| --------------- | ----- | -------- |
| **C**omplexity  | 7 | One gate, nine controls, and a section removed. The threshold is arguable. |
| **R**each       | 5 | Everyone reads the readme; only editors of it hit the gate. |
| **I**mpediment  | 5 | The stale index misinformed readers rather than blocking them. |
| **S**takeholder | 5 | The manifest repository and anything citing its anchors. |
| **Total**       | 5.5 | Evaluate, and it was cheap enough to build. |

## The Downsides

An index is genuinely useful, and there is now none. A newcomer who wants to see
everything at once opens a 200-line XML file rather than a table.

The threshold of three is a number chosen by argument rather than by measurement.
A document can still spread an index across adjacent blocks, two names at a time,
and the gate will not see it. That hole is named in the gate's docstring rather
than left to be discovered.

The gate reads every markdown file it is given, so the vocabulary it enforces
grows as the manifest grows. A repository named after a common word would start
matching prose that was never about it.

## The Road Not Taken

Generating the index from `default.xml` on every commit is the arrangement that
keeps both the table and the truth. It needs a generator, a run step, and a check
that the generated file is current, none of which exist.

Trusting review to catch drift is what was already happening. The stale paragraph
survived two reviews on the day the rule was written.

Blocking every mention of a project in the readme would have removed the pair
that makes the suffix rule legible, which is the one thing the prose there needs
to do.

## Status

Status: Accepted

Applied in V-Sekai/vsk-world-manifest#4.

## Decision Makers

- K. S. Ernest (iFire) Lee
