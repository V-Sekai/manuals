# AGENTS.md — manuals

Guidance for AI coding agents working in this submodule.

## What this is

V-Sekai project documentation published as a Quarto website at
`https://v-sekai.github.io/manuals`. Contains decisions (ADRs), changelog,
and reference content for contributors and users.

## Build

```sh
# Requires Quarto CLI and Python env
uv sync                # install Python deps (pyproject.toml / uv.lock)
quarto render          # builds _site/
quarto preview         # local preview server
```

## Key files

| Path | Purpose |
|------|---------|
| `_quarto.yml` | Site config: navbar, sidebar, output dir (`_site/`) |
| `index.md` | Landing page |
| `decisions/` | Architecture Decision Records (ADRs) |
| `decisions.qmd` | ADR index page |
| `changelog.qmd` | Changelog rendered from `changelog/` entries |
| `create_changelog_entry.exs` | Elixir script to generate a new changelog entry |
| `references.bib` | BibTeX references (Verbalized Sampling paper, etc.) |

## Conventions

- New decisions go in `decisions/` as `.md` files; add them to `decisions.qmd`.
- Changelog entries are generated via `elixir create_changelog_entry.exs`.
- Do not hand-edit `_site/` — it is the build output.
- Commit message style: sentence case, no `type(scope):` prefix.
  Example: `Add ADR for aria-storage replacing desync`
