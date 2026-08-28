# Manifest paths name how the engine loads a C++ project

## The Context

`vsk-world-manifest` places every V-Sekai repository into a folder tree. Two
naming rules already governed it: GitHub names are never changed to suit the
layout, and local paths are normalised to lowercase and hyphenated with prefixes
dropped.

Neither rule reaches the distinction that decides how a C++ repository is built.
A Godot engine module is `config.py` and `SCsub` dropped into `godot/modules/`
and compiled into the binary, so changing one means rebuilding the engine. A
GDExtension is `godot-cpp` and a `.gdextension` file that a stock binary loads at
runtime, so changing one means rebuilding a shared library and nothing else.

The two are indistinguishable in a directory listing. Before this decision the
manifest recorded the difference exactly once, in the pair
`1-transport/godot-openvr` and `1-transport/godot-openvr-module`, where the
suffix on the second was the only signal that the first was something else.

## The Problem Statement

A developer opening a checkout cannot tell whether their change requires an
engine rebuild without reading the repository's build files. The information
exists in every checkout and is recoverable in seconds, and it was recorded
nowhere that a listing, a `repo list`, or a path in a bug report would show.

## Design

The folder name carries it. A path ends `-module` when the repository is a Godot
engine C++ module, ends `-gdextension` when it is a GDExtension, and takes no
suffix otherwise.

| Suffix | Evidence in the checkout |
| --- | --- |
| `-module` | `config.py` and `SCsub` at the repository root, `register_types.cpp` |
| `-gdextension` | a `godot-cpp` checkout, a `*.gdextension` file |
| neither | GDScript addon, standalone library, service, asset bank, engine fork |

Classification comes from reading the checkout rather than from the repository
name. All 192 repositories placed at the time were scanned for those files; 27
were one or the other, and 20 took `-module` against 7 taking `-gdextension`.

Three cases needed a rule rather than a scan.

A `project.godot` at the repository root outranks both suffixes. Such a
repository is a Godot project, whatever it builds or loads, because the project
is what somebody opens. One repository was affected. A `project.godot` under
`demo/` does not count, since a demo is a thing the repository ships rather than
the thing the repository is.

The engine forks take no suffix. They are what modules compile into, so naming
how they load one would say nothing about them.

A repository that genuinely builds both ways takes the suffix its own
documentation calls the normal install, and the commit says which build the
other one is. One repository was affected.

## CRIS Score

| Factor          | Score | Evidence |
| --------------- | ----- | -------- |
| **C**omplexity  | 9 | A rename of 27 paths in one file. `repo sync` moves the checkouts. |
| **R**each       | 6 | Everyone who opens the workspace reads paths; only C++ work acts on the distinction. |
| **I**mpediment  | 4 | The workaround is opening the repository and reading its build files. |
| **S**takeholder | 6 | The engine fork and every module and extension it consumes. |
| **Total**       | 6.25 | Schedule soon. |

## The Downsides

The suffix is a claim about a repository that only the repository can settle, and
nothing checks it after the rename. A repository that migrates from a module
build to a GDExtension keeps a path that now lies, and the manifest will not
notice.

Renaming a path moves a checkout on the next `repo sync`. Anything holding an
absolute path into the workspace breaks once, silently.

The `-gdextension` suffix is long. It was chosen over `-gdext` because the short
form is a name nobody outside this workspace uses.

## The Road Not Taken

Grouping folders, `3-interactor/modules/` and `3-interactor/gdextensions/`, were
rejected because they add a directory level to every path for a property that
applies to a seventh of the repositories, and because the manifest already used a
suffix for exactly this distinction in the openvr pair.

An attribute in the manifest, such as `<project loads="module">`, would be
invisible in a listing and in every path anybody quotes, which is where the
question is actually asked.

Leaving it to each repository's readme keeps the fact where it is true and where
nobody looks before opening the folder.

## Status

Status: Accepted

Applied in V-Sekai/vsk-world-manifest#1 and refined by #2.

## Decision Makers

- K. S. Ernest (iFire) Lee
