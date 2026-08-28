# Working agreements

Working agreements for every project in the V-Sekai world workspace.

This file lives in `V-Sekai/manuals` and is linked to the workspace root by
`V-Sekai/vsk-world-manifest`. `AGENTS.md` beside it covers working inside this
repository — Quarto build, where ADRs go, commit style.

## Where things are

There is **one live goal manifest**: `V-Sekai/vsk-world-manifest`. Every
repository sits on a side of the hexagon and that manifest is what decides
which. A repository is placed when it is added to the manifest, not later — an
unplaced project is drift, and `repo list` against the org's non-archived set is
the check that catches it.

| Side | Holds |
| --- | --- |
| `1-transport` | Driving adapters — client and launcher, editor and viewer tools, XR and input managers, network and HTTP transports, Blender-side authoring addons. |
| `2-contract` | Manuals, specifications, formats, protocols. This repository is here, at `2-contract/manuals-vsk`. |
| `3-interactor` | Use cases and engine work — the Godot fork, IK and retargeting, mesh and cloth algorithms, importers, ML. |
| `4-entities` | Avatars, maps, entity frameworks, and the demo and test projects that embody them. |
| `5-repository` | Persisted artifacts: model and asset stores. |
| `6-datasource` | Asset banks, corpora, casync seeds, databases and their drivers. |
| `7-service` | Backend services and everything that ships them: Uro, deployment, packaging, build orchestration. |

Two naming rules, and they pull in opposite directions on purpose:

- GitHub names are never changed to suit the layout. `<project name=>` is the
  repository exactly as the org has it, `V-Sekai.rig_net` and `TOOL_coacd` and
  `SingletonScriptsShortcut` included. Renaming a repository breaks every URL
  anybody has ever written down.
- Local paths are normalised. `<project path=>` is lowercase and hyphenated
  with prefixes dropped, so the checkout reads consistently. `V-Sekai.rig_net`
  lands at `3-interactor/rignet`.

A third rule sits on top of both, and only the path can carry it: **how the
engine loads a C++ project is part of its folder name.** A module is `config.py`
and `SCsub` compiled into the binary; a GDExtension is `godot-cpp` and a
`.gdextension` loaded by a stock binary at runtime. The two look alike in a
listing and share nothing in how they build, so the path ends `-module` or
`-gdextension` and everything else — GDScript addons, standalone libraries,
services, the engine forks themselves — takes no suffix. `godot_openvr` and
`godot_openvr_module` are the same feature written both ways; the suffix is what
says so before either is opened.

**Every project names its own revision.** V-Sekai's default branches are not
uniform — `master`, `godot3`, `godot-4.3`, `colliders`, `vsekai`, `flux2`,
`4.0`, `master-rd` and more all appear across the org. A `<default revision=>`
would silently be wrong for most of them, so `<default>` sets the remote and the
job count only, and each `<project>` carries an explicit `revision`.

## How decisions are recorded

Decisions are ADRs in `decisions/`, dated `YYYYMMDD-kebab-title.md`, indexed
from `decisions.qmd`. They are not numbered. Superseded decisions move to
`_archive/decisions/` rather than being deleted — a reader who knows which roads
turned out to be dead ends is better off than one who only knows the current
answer.

Where a decision and its measurement would otherwise live apart, they belong
together: state the number and the baseline in the entry that relies on them.

## How work is verified

These recur often enough to state as rules:

1. A check that passes on known-broken input is decoration, and it certifies
   the defect. Every gate ships with a negative control asserting the broken
   input fails. The three gates in the manifest repository each do.
2. A silent skip reads exactly like a pass. An unmet precondition is a FAIL.
   Unchecked things are named and counted, never omitted.
3. A number without a baseline is not a measurement. Report the floor beside
   it.
4. Conventions are data. Parse rotation order, up axis, and units; never
   assume them. Avatar and animation work crosses VRM, glTF, PMX, FBX and USD,
   and each of them answers those three questions differently.
5. **Bugs live at interfaces**, not inside components. Name the interfaces and
   check each.

## Deployment

glTF and VRM exports carry **pure data** — skin weights, animation samplers,
morph targets. An export that only looks right because the consumer runs our
code is not portable, and portability across clients is the point of the
formats V-Sekai has committed to.

## Commit style

Sentence case, no `type(scope):` prefix. Example:
`Add ADR for aria-storage replacing desync`.

Do not hand-edit `_site/` — it is Quarto build output.
