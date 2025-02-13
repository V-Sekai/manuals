# Active: Pin Key Repositories on V-Sekai GitHub Organization for Better Visibility

## Context

The V-Sekai GitHub organization hosts multiple repositories critical to its open-source social vr project. As contributions and community interest grow, ensuring quick access to core projects (e.g., the main engine, tooling, and documentation) becomes essential. Pinned repositories prominently displayed on the organization’s profile improve discoverability and reduce onboarding friction.

## Problem Statement

Currently, the V-Sekai GitHub organization does not have repositories pinned, forcing users to manually search for key projects like `v-sekai-game` or `awesome-vsekai`. This creates unnecessary effort for newcomers and risks obscuring high-priority tools (e.g., `xr-grid`). The GitHub UI defaults to pinning repositories on personal profiles, not organizations, requiring explicit action by org owners.

## Proposed Solution

Pin the following repositories to the V-Sekai organization profile:

1. **v-sekai-game** (primary engine)
2. **awesome-vsekai** (ecosystem resources)
3. **tool-explorer** (development utilities)
4. **xr-grid** (XR interaction framework)

**Implementation Steps**:

1. An organization owner navigates to the V-Sekai GitHub profile.
2. Clicks "Pinned repositories" → "Customize pins."
3. Selects the four repositories from the dropdown and saves.

## Implementation Plan

1. **Phase 1**: Org owner pins repositories (5 minutes).
2. **Phase 2**: Quarterly review to update pins as projects evolve.
3. **Validation**: Confirm pinned repos appear on the organization’s public profile.

## Benefits

- **Faster Access**: Reduces time to locate critical projects.
- **Community Clarity**: Signals which repos are actively maintained.
- **First-Time User Experience**: Simplifies onboarding for contributors.

## Risks and Limitations

- **Stale Pins**: Requires periodic updates if priorities shift.
- **Limited Slots**: Only six pins allowed; strategic selection needed.

## Alternatives Considered

| Option            | Pros                    | Cons                           |
| ----------------- | ----------------------- | ------------------------------ |
| **Status Quo**    | No maintenance overhead | Poor discoverability           |
| **Featured Tags** | Flexible categorization | Less visible than pinned repos |

## When to Avoid This Solution

If the organization prefers alternative navigation methods (e.g., a dedicated docs site), pinning may be redundant.

## Organizational Alignment

Aligns with V-Sekai’s mission to foster open collaboration by lowering barriers to entry.

## Proposal Status

Status: Active

## Decision Makers

- V-Sekai GitHub organization owners
- fire
- dragonhunt02

## Tags

- GitHub Management
- Immediate

## References

1. [GitHub: Pinning Organization Repositories](https://stackoverflow.com/a/67478102)  
   _Solution requires org owners to manually customize pins via profile settings._
