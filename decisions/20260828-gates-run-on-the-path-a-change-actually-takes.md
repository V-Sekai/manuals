# Gates run on the path a change actually takes

## The Context

This repository runs three checks on pull requests: `codespell` and
`markdownlint` under `prek`, and `check_tropes.sh` for the house writing style.
They are configured in `.github/workflows/checks.yml`, which triggers on
`pull_request` and `merge_group`.

`CLAUDE.md` was added to `main` by a direct push. The first pull request opened
afterwards failed `tropes` with six findings, all of them in lines the pull
request had not touched. The file had been on `main` for under an hour and had
never been checked, because the only trigger that runs the check is one the push
did not use.

A second instance appeared the same day in a different tool. `repo sync` printed
`fatal: couldn't find remote ref` for a project whose branch had been deleted
upstream, retried, then printed `repo sync has finished successfully` and exited
zero. The project was not synced. Reading the exit code alone reports success.

## The Problem Statement

A check that does not run on the path a change actually takes is decoration for
that path. Nothing distinguished "this file passed the style gate" from "this
file has never been offered to the style gate", and the first pull request to
touch the file inherited every violation.

A tool that prints a fatal error and exits zero has the same shape. Automation
reading the exit code cannot tell a completed sync from a partial one.

## Design

Two rules, both stated as absolutes because the failure mode of each is silence.

Every gate triggers on every path into the protected branch. A workflow that
guards `main` lists `push: branches: [main]` alongside `pull_request`, so a
direct push is measured by the same checks a pull request is. Where a job cannot
run on push, such as one that reads a pull request description, it says so at the
job and names what is therefore unchecked.

An exit code is not a result. Where a tool reports failure in its output and
success in its status, the output is what gets read, and any wrapper around it
greps for the failure text rather than trusting the code.

This decision does not change what the checks measure. It changes when they run,
which is the part that was silently optional.

## CRIS Score

| Factor          | Score | Evidence |
| --------------- | ----- | -------- |
| **C**omplexity  | 9 | Two lines of workflow YAML per repository. |
| **R**each       | 8 | Every contributor to every repository with a gate. |
| **I**mpediment  | 7 | Violations accumulate on the branch and land on whoever opens the next pull request. |
| **S**takeholder | 7 | Every gate in the workspace depends on running to mean anything. |
| **Total**       | 7.75 | Schedule soon. |

## The Downsides

Running the gates on push means a push can fail after it has landed. There is no
pull request to block, so the failure is a red mark on the branch and a job for
whoever notices, which is weaker than prevention and better than silence.

The style gates read every tracked file rather than the diff, so adding a push
trigger to a repository with existing violations turns `main` red until they are
fixed. That is the true state being reported for the first time.

Greping output instead of reading exit codes is fragile in the ordinary way:
message text changes between tool versions, and a check keyed to it goes quiet.

## The Road Not Taken

Branch protection requiring pull requests would close the push path rather than
measure it. It is the stronger answer and it needs administrative settings per
repository, so it is worth doing and it does not remove the need for the trigger,
since a merge queue and an admin override both bypass it.

Checking only the diff rather than every file would have hidden the six findings
instead of surfacing them. The whole-file scan is what made the gap visible, and
it is the reason the gap was found at all.

## Status

Status: Proposed

The trigger has not yet been added to `checks.yml`.

## Decision Makers

- K. S. Ernest (iFire) Lee
