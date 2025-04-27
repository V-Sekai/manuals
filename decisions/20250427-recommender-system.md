# Draft: Phoenix-Based Recommender System Integration (Using FLAME)

## **Context**

V-Sekai requires a scalable recommendation system. The Elixir/Phoenix backend (uro) will integrate Python ML (`librecommender`) via `FLAME`. The core data flow involves `Oban` for job management, `Membrane` for stream processing, `Ecto` for database interaction with CockroachDB (CRDB), and `FLAME` as the bridge to run Python ML models.

## **Problem Statement**

1.  Scalability limits of standalone Python recommendation serving.
2.  Inefficient user/item handling without specialized libraries or optimized serving.
3.  Complexity in managing Python processes and dependencies alongside an Elixir application.

## **Proposed Solution**

Implement Elixir/Phoenix using `FLAME` to serve the `librecommender` model. Leverage `Ecto` for CRDB data mapping, `Oban` for background job processing (like model retraining triggers or batch predictions), and potentially `Membrane` for integrating recommendation calls into data streams.

**Key Components:**

- **Phoenix/Ecto:** Backend framework and database interaction layer with CRDB. Handles schemas and application logic.
- **Oban:** Manages background jobs which can trigger processing, including interactions with FLAME services or data preparation.
- **Membrane:** Used for stream-based processing pipelines. Could potentially feed data to or consume results from FLAME-served models.
- **FLAME:** Manages the lifecycle and serving of the Python `librecommender` model, allowing Elixir processes to interact with it efficiently.
- **CockroachDB (CRDB):** Persistent storage managed via Ecto.

## **Implementation Plan**

1.  **Phase 1**: Core Setup & Basic Integration
    - Define Ecto schemas mapping to CRDB.
    - Set up the `FLAME` environment and configure it to serve the `librecommender` model.
    - **Stage 1**: Implement Phoenix endpoints or Oban workers that make requests to the `librecommender` model served by `FLAME` and interact with CRDB via Ecto.
2.  **Phase 2**: Advanced Integration & Metadata
    - Develop Elixir client modules for interacting with the `FLAME`-served `librecommender`.
    - **Stage 2**: Explore integrating `FLAME` calls within Membrane pipelines (potentially triggered by Oban) for stream-based recommendations, storing results via Ecto in CRDB.
3.  **Validation**:
    - **Success**: <500ms p99 latency for `FLAME` recommendation calls under expected load. Efficient resource utilization by FLAME runners.
    - **Failure**: >5% errors during FLAME model inference OR significant performance bottlenecks under load.

## **Benefits**

- Leverages Elixir concurrency via Oban/Membrane and Phoenix.
- Utilizes Python ML (`librecommender`) via optimized serving with `FLAME`.
- Native Ecto/CRDB metadata querying.
- Simplified deployment and management of ML models compared to manual Python process management.

## **Risks**

- `FLAME` interop overhead (though likely optimized for ML workloads).
- Complexity in configuring and tuning `FLAME` runners.
- Deployment complexity (Elixir + Python dependencies managed by FLAME).
- Error handling between Elixir application and `FLAME` services.

## **Alternatives Considered**

- Pure Python (Scalability issues)
- Pure Elixir (Lacks ML libraries)
- Elixir + Rustler (Higher complexity for ML tasks)
- Elixir + Pythonx (Less specialized for ML serving than FLAME)

## **Tags**

- ML
- Backend
- High Priority
- Python Integration
- Ecto
- Oban
- Membrane
- CockroachDB
- FLAME

## Status

Status: Accepted ## Decision Makers

- V-Sekai Team

## Tags

- V-Sekai
- Recommendation System
- Architecture
- Elixir
- Python
- FLAME

## Further Reading

- [FLAME Documentation](https://github.com/phoenixframework/flame)
- [librecommender Documentation (Placeholder - Add actual link if available)](URL_TO_LIBRECOMMENDER)
- [Oban Documentation](https://getoban.pro/docs/stable/Oban.html)
- [Membrane Framework Documentation](https://membraneframework.org/guide)
- [Ecto Documentation](https://hexdocs.pm/ecto/Ecto.html)
