# Avoid AI Writing Tropes in Documentation (Part 3)

## The Context

Parts 1 and 2 cover patterns from the tropes.fyi catalog. An audit of the 22 2026 ADRs in this corpus found a different class of problems: structural and grammatical weaknesses that appear even in technically precise documents. The authoritative sources are the Google Developer Documentation Style Guide [@googledocs2024voice], Microsoft Writing Style Guide [@microsoft2024style], and Helen Sword's work on nominalizations [@sword2012zombie].

## The Problem Statement

The tropes.fyi patterns are visible on a sentence-by-sentence reading. The patterns below require looking at paragraph structure and grammatical form. They are harder to catch because each instance feels locally acceptable.

## The Proposal

Add these five patterns to the review checklist.

#### Template headings left verbatim

The ADR template contains the prompt "Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams." This prompt appeared as a live section heading in all 22 2026 ADRs audited. Replace the template prompt with a heading that names what the section actually contains: "Design", "Protocol", or "Implementation".

#### Passive voice on technical actions (Google Dev Docs)

Passive constructions hide the actor: "Plans are stored in the CDN", "Assets are uploaded to zone-backend". When the actor is known, name it: "Zone-backend stores plans in the CDN at plan-compute time." Reserve passive voice for cases where the actor is genuinely unknown or where naming it would be repetitive.

#### Buried lede (Microsoft Writing Style Guide)

"The Context" is the first thing a reader sees. In 13 of 22 audited documents it contains background prose before reaching the technical gap that drove the decision. State the gap in the first sentence: "No benchmark comparing the two delivery strategies exists." Everything else is context for that gap, not preamble before it.

#### "The Road Not Taken" restating The Downsides

The Road Not Taken is for alternatives seriously considered and specifically rejected. In 4 of 22 documents it lists alternatives without stating why each was rejected, or repeats arguments already made in The Downsides. Each entry needs a named alternative and a specific technical reason for rejection.

#### Zombie nouns (Helen Sword)

Nominalizations convert live verbs into abstract nouns: "implementation of" (implement), "evaluation of" (evaluate), "utilization of" (use). They strip the actor and dilute the commitment. Check for -tion, -ment, -ity, and -ness suffixes. Where the underlying verb is available, use it: "The team evaluates, documents, and deploys both solutions" rather than "The team will handle evaluation, documentation, and deployment of both solutions."

## The Benefits

Template heading and zombie noun fixes are mechanical — they require no judgement, just a suffix check and a heading comparison. The lede and road-not-taken fixes require knowing what the document is actually about, so they double as a comprehension check on the content.

## The Downsides

Passive voice is sometimes correct: when the actor is unknown, or when naming it would be awkward repetition. Applying the rule without reading the sentence produces its own monotony.

## The Road Not Taken

A linter (Vale, write-good) would catch passive voice and nominalizations automatically. Linter integration was not adopted because the ADR format has no CI pipeline, and a checklist applied manually is more useful than one requiring tooling setup.

## Status

Status: Active

## Decision Makers

- iFire

## Tags

- Writing, Documentation, Style, Review, Contributing

## Further Reading

1. Google Developer Documentation Style Guide — Active Voice [@googledocs2024voice]
2. Microsoft Writing Style Guide — Top 10 Tips [@microsoft2024style]
3. Helen Sword, "Zombie Nouns" [@sword2012zombie]
