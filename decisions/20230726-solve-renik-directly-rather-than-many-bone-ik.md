# Proposed: Solve Renik directly rather than through many bone ik

## Metadata

- Status: proposed
- Deciders: V-Sekai
- Tags: V-Sekai

## Context and Problem Statement

We want a robust character controller through V-Sekai renik, but we're working on an abstract many bone ik and there wasn't visible progress. The current approach is not yielding the desired results and is proving to be inefficient.

## Proposed Solution

Pause many bone ik and update renik to use many bone ik technologies. This would involve refactoring the existing codebase to integrate the many bone ik technologies directly into the renik solution.

## Implementation

To be determined.

## Positive Consequences

- More efficient and direct solution for character control.
- Better utilization of many bone ik technologies.
- Potential for improved performance and responsiveness in the final product.

## Negative Consequences

- Requires significant refactoring of the existing codebase.
- Potential for introducing new bugs during the integration process.
- May require additional resources and time to implement correctly.

## Option graveyard

This section is reserved for documenting past decisions and their outcomes.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement involves a fundamental change in how the character controller is implemented and cannot be achieved with a simple script workaround.

## Is there a reason why this should be core and done by us?

Yes, as the creators of the system, we have the best understanding of its architecture and potential improvements. Outsourcing or relying on external contributions may not align with our vision for the project.

## References

- [V-Sekai](https://v-sekai.org/)