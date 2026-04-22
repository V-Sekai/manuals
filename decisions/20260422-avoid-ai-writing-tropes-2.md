# Avoid AI Writing Tropes in Documentation (Part 2)

## The Context

The first avoid-AI-writing-tropes ADR covers five patterns from the tropes.fyi taxonomy. An audit of these documents found four of the remaining tropes active and one category common enough in technical writing to warrant a standing rule.

## The Problem Statement

The first checklist targets the most visible surface patterns — bold bullets, negative framing, the rule of three. The patterns below are harder to catch because they operate at the level of paragraph rhythm and argument structure.

## The Proposal

Add these five patterns to the review checklist.

#### One-point dilution (`one-point-dilution`)

A single argument restated in different words across multiple sentences or paragraphs. Test: delete the second sentence. If the reader loses no information, delete it.

#### Short punchy fragments (`short-punchy-fragments`)

Sentence fragments deployed as standalone paragraphs for manufactured weight. "It works." "A platform." These are RLHF artifacts aimed at low reading-level readability. Fold the fragment into the surrounding sentence.

#### Superficial analyses (`superficial-analyses`)

A present participle phrase appended to a factual sentence to inject significance without argument: "highlighting the importance of this approach", "underscoring its role as...". The participle asserts meaning without demonstrating it. Delete these phrases.

#### Anaphora abuse (`anaphora-abuse`)

The same sentence opener repeated in quick succession. "They could expose... They could offer... They could provide..." One repetition is rhetorical. When the repeated opener could be factored into a single sentence, it should be.

#### False ranges (`false-ranges`)

"From X to Y" constructions where X and Y are not on a real scale. "From infrastructure to culture." The construction implies a spectrum with meaningful midpoints; when none exists, replace with a list or a direct claim.

## The Benefits

Clearing these five patterns removes the most common forms of padding — passages that feel comprehensive but add no information.

## The Downsides

One-point dilution and anaphora often co-occur: a restated argument tends to use anaphoric sentence structure. Reviewers may flag the same passage under both patterns. Treat it as one fix.

## The Road Not Taken

A hard word-count target would suppress dilution mechanically but would also suppress legitimate detail. Pattern-based review preserves judgement.

## Status

Status: Active

## Decision Makers

- iFire

## Tags

- Writing, Documentation, AI, Style, Review, Contributing

## Further Reading

1. tropes.fyi [@ossama2025tropes] — full 33-trope directory with examples and explanations
