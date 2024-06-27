# Proposed: Every Commit Push Pass Cicd

## The Context

We are working on V-Sekai, a virtual reality social network. Our development workflow involves multiple developers making frequent changes to the codebase.

## The Problem Statement

We have trouble understanding the logical flow of work. This is causing delays in development and making it difficult to track changes and debug issues. Currently, our commits are checked after they are merged into the main branch, which can lead to problems if the commit does not pass the checks.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

The proposal is to implement a system where every commit and push operation passes through our CI/CD pipeline as a logical unit before being checked into the main branch. This means that each commit will trigger a build and test process, ensuring that all changes are validated before they are merged.

```pseudo
On every commit:
  Trigger CI/CD pipeline
    Build application
    Run tests
If tests pass:
  Allow check-in to main branch
Else:
  Return error and prevent check-in
```

## The Benefits

- Improved traceability of changes
- Faster identification and resolution of issues
- More efficient development workflow
- Prevention of problematic commits entering the main branch

## The Downsides

- Potential increase in build times
- Requires investment in robust testing infrastructure

## The Road Not Taken

An alternative approach could be to only run the CI/CD pipeline on specific branches or at specific times. However, this would not provide the same level of validation and could lead to issues being missed.

## The Infrequent Use Case

In cases where commits are made infrequently, this approach may result in longer periods between builds. However, the benefits of improved traceability and issue resolution outweigh this potential downside.

## In Core and Done by Us

This change will be implemented by the V-Sekai development team and will become a core part of our development workflow.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
