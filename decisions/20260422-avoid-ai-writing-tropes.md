# Avoid AI Writing Tropes in Documentation

## The Context

multiplayer-fabric documentation is produced with AI assistance. LLM-generated prose carries recognisable structural patterns — "tropes" — that undermine a reader's trust. ossama.is maintains a living directory of 33 such patterns at tropes.fyi [@ossama2025tropes].

## The Problem Statement

AI models reach for the same constructions across different prompts and models. A reader who recognises these patterns discounts what surrounds them. In technical writing, where credibility depends on precision, that cost is real.

## Describe how your proposal will work

Use the tropes.fyi taxonomy as the review checklist for any prose documentation added to this project. The five highest-risk patterns for technical writing are listed below.

#### Bold-first bullets (trope #19)

Every list item opens with a bolded phrase. Rewrite as subheadings if the items warrant structure, or as a plain numbered list if they warrant sequence.

#### Negative parallelism (trope #1)

"It's not X — it's Y." The reframe implies the reader held the wrong belief. State the thing directly and drop the negation.

#### Tricolon stacking (trope #5)

Three-item parallel constructions are easy for models to generate. One tricolon in a document can be rhetoric; several is a pattern failure. Trim to two items or break the parallelism.

#### Grandiose stakes inflation (trope #14)

A localised engineering choice described as reshaping how software is built forever. Match the claim to the evidence.

#### Dead metaphor beating (trope #28)

Introducing a metaphor and repeating it across every subsequent paragraph. One use, then drop it — unless the metaphor is the argument, as in "simplify-then-add-lightness", where mass and weight are the point.

The secondary word-choice checklist: avoid _leverage_, _robust_, _streamline_, _delve_, _tapestry_, _landscape_, and _paradigm_ unless a direct replacement is worse.

## The Benefits

Readers who recognise AI writing patterns stop trusting the document at the first tell. Prose that clears this checklist stands on its own. Review time shifts from cleaning up tells to checking content.

## The Downsides

The tropes.fyi list is a symptom directory. Removing a trope does not fix the underlying sentence — it removes one reason the sentence is bad. The root cause (inflated claim, missing evidence) still needs addressing.

## The Road Not Taken

A generic prose style guide covers some of the same ground. It does not name the specific patterns that AI tools produce, so reviewers must pattern-match by intuition rather than against a checklist.

## Status

Status: Active

## Decision Makers

- iFire

## Tags

- Writing, Documentation, AI, Style, Review, Contributing

## Further Reading

1. tropes.fyi [@ossama2025tropes] — full 33-trope directory with examples and explanations
2. "Why AI Writing Is So Generic — Semantic Ablation", The Register [@theregister2026semantic] — why AI writing is generically correct but without character
3. Wikipedia: Signs of AI Writing [@wikipedia2025aiwriting] — enumerated tells maintained by the Wikipedia editing community
