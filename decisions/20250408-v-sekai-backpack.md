# Active: Ash-Based Recommender System Integration

## Context

Godot Engine's V-Sekai project requires a scalable recommendation system (200k+ user-items) with modern metadata handling. The current implementation does not exist. The decision to use Ash is driven by the fact that our backend (uro) is already implemented in Elixir, ensuring seamless integration and leveraging existing expertise.

## Problem Statement

1. Scalability bottlenecks in Python-based recommendation serving
2. Inefficient user/item bag management
3. Missing JSON-LD attribute compatibility

## Proposed Solution

Implement Ash framework with Rustler-based NIF integration for librecommender.

**Implementation Steps**:

1. Create Ash resource DSL for recommendation entities
2. Implement NIFs for bag operations using Rustler
3. Add JSON-LD context annotation layer
4. Support both item-item and user-item recommendation algorithms

## Implementation Plan

1. **Phase 1**: Ash core setup
   - Port uro entity relationships
   - Rustler integration tests
2. **Phase 2**: Recommender bridge
   - Implement protocol for librecommender
   - JSON-LD attribute mapping
3. **Validation**:
   - Success Criteria: <500ms p99 inference latency
   - Failure Threshold: >5% data serialization errors

## Benefits

- 10x concurrent recommendation capacity
- Native Ecto/Ash metadata queries
- Future-proofed for Fediverse integration

## Risks and Limitations

- Rust-Elixir type conversion overhead
- NIF complexity
- JSON-LD namespace collisions

## Alternatives Considered

| Option      | Pros          | Cons              |
| ----------- | ------------- | ----------------- |
| Pure Python | Faster MVP    | Limits scale      |
| Pure Elixir | Simpler stack | Lacks optim algos |

## When to Avoid This Solution

Projects requiring simple recommendation needs (<1k items) or without Rust ops support.

## Organizational Alignment

Supports V-Sekai 2025 goals for UGC and fediverse interoperability.

## Proposal Status

Status: Active <!-- Options: Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by [Link/Reference] -->

## Decision Makers

- Fire

## Tags

- ML
- Backend
- High Priority

## References

1. Ash Framework https://ash-hq.org/
2. Rustler 0.30 NIF guide https://github.com/rusterlium/rustler
3. V-Sekai Roadmap 2025 https://v-sekai.github.io/manuals/roadmap.html
4. Librecommender Rust Serving Guide https://librecommender.readthedocs.io/en/latest/serving_guide/rust.html
