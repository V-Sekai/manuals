# Accepted: World Godot Build Dispatch

## What is the context of the proposal?

Using a custom Godot Engine build to handle arbitrary Godot Engine projects.

## What is the problem being solved?

Send automated build messages to “v-sekai/v-sekai-game” on “v-sekai/world-godot” commits.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

To enable it, add “REPO_DISPATCH” to repository secrets.

A fine-grained token with Contents: Read and write permission for the “v-sekai-game” repo must be placed in the “REPO_DISPATCH” named repository secret of “V-Sekai/world-godot”.

In `V-Sekai/world-godot`, add the Godot Engine project to the dispatch job's list too.

## What are the benefits of the proposal?

Automated builds increase efficiency.

Reduces manual interventions on commits.

## What are the downsides of the proposal?

Requires careful secret management.

Additional setup steps are needed.

## What are the alternative proposals?

Direct build triggers within the same repository.

Manual triggers via local scripting.

## When might the proposed solution be used rarely or not at all?

If simpler builds without cross-repo triggers are sufficient.

## Is this a V-Sekai core responsibility, and should it be done by us?

Yes, because it streamlines the build workflow for V-Sekai projects.

## What is the status of the proposal?

Status: Accepted

## Who is making decisions on the proposal?

- V-Sekai development team
- fire
- dragonhunt02

## What tags does the proposal have?

- V-Sekai
- release

## List further reading references

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)

AI assistant Aria assisted with this article.
