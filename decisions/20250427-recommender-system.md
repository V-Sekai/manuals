# Draft: Phoenix-Based Recommender System Integration (Using Pythonx)

## **Context**

V-Sekai requires a scalable recommendation system. The Elixir/Phoenix backend (uro) will integrate Python ML (`librecommender`) via `pythonx`. The core data flow involves `Oban` for job management, `Membrane` for stream processing, `Ecto` for database interaction with CockroachDB (CRDB), and `pythonx` as the bridge to Python.

## **Problem Statement**

1.  Scalability limits of standalone Python recommendation serving.
2.  Inefficient user/item handling without specialized libraries.

## **Proposed Solution**

Implement Elixir/Phoenix using `pythonx` to call `librecommender`. Leverage `Ecto` for CRDB data mapping, `Oban` for background job processing, and `Membrane` for integrating `pythonx` calls into data streams.

**Key Components:**

- **Phoenix/Ecto:** Backend framework and database interaction layer with CRDB. Handles schemas.
- **Oban:** Manages background jobs which can trigger processing, including `pythonx` calls.
- **Membrane:** Used for stream-based processing pipelines which can incorporate `pythonx` calls for ML tasks on data streams.
- **Pythonx:** Bridge enabling Elixir to call Python functions in `librecommender` for recommendation logic.
- **CockroachDB (CRDB):** Persistent storage managed via Ecto.

## **Implementation Plan**

1.  **Phase 1**: Core Setup & Basic Integration
    - Define Ecto schemas mapping to CRDB.
    - Setup `pythonx` environment.
    - **Stage 1**: Implement Oban workers that directly call `librecommender` via `pythonx` and interact with CRDB via Ecto.
2.  **Phase 2**: Advanced Integration & Metadata
    - Develop Elixir interface for `librecommender` via `pythonx`.
    - **Stage 2**: Integrate `pythonx` calls within Membrane pipelines (potentially triggered by Oban) for stream processing, storing results via Ecto in CRDB.
3.  **Validation**:
    - **Success**: <500ms p99 latency for `pythonx` recommendation calls.
    - **Failure**: >5% `pythonx` serialization errors OR significant performance issues.

## **Benefits**

- Leverages Elixir concurrency via Oban/Membrane.
- Utilizes Python ML (`librecommender`) via `pythonx`.
- Native Ecto/CRDB metadata querying.

## **Risks**

- `pythonx` interop overhead.
- Python GIL limitations (mitigated by Elixir concurrency).
- Deployment complexity (Elixir + Python).
- Error handling between Elixir/Python via `pythonx`.

## **Alternatives Considered**

- Pure Python (Scalability issues)
- Pure Elixir (Lacks ML libraries)
- Elixir + Rustler (Higher complexity)

## **Tags**

- ML
- Backend
- High Priority
- Python Integration
- Ecto
- Oban
- Membrane
- CockroachDB

## Status

Status: Accepted <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- Technical Lead
- Backend Lead
- V-Sekai Core Team

## Tags

- V-Sekai
- Recommendation System
- Architecture
- Elixir
- Python

## Further Reading

- [pythonx Documentation](https://github.com/elixir-python/pythonx)
- [librecommender Documentation (Placeholder - Add actual link if available)](URL_TO_LIBRECOMMENDER)
- [Oban Documentation](https://getoban.pro/docs/stable/Oban.html)
- [Membrane Framework Documentation](https://membraneframework.org/guide)
- [Ecto Documentation](https://hexdocs.pm/ecto/Ecto.html)
