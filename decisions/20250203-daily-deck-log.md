# Proposed: Daily Deck Log

## What is the context of the proposal?

The V-Sekai team requires a structured, real-time method to track daily project health, team contributions, and technical progress. This log aims to streamline communication across contributors and stakeholders in an open-source social VR project built on the Godot Engine.

## What is the problem being solved?

- Fragmented updates across chat/email.
- Lack of visibility into blockers or critical issues.
- Difficulty aligning priorities between developers, artists, and leadership.

## Describe how your proposal will work

**Process:**

1. **Daily Interactive Prompting**: A bot (e.g., Discord/GitHub bot) prompts contributors for updates via a form.
2. **Structured Data Collection**:

   ```python
   def collect_deck_log():
       date = input("Date (YYYY-MM-DD): ")
       active_contributors = input("Active contributors (count/details): ")
       blockers = input("Current blockers: ")
       # ... additional fields
       return format_markdown(date, active_contributors, blockers)
   ```

3. **Automated Aggregation**: Data is compiled into a Markdown log (example below) and posted to a project channel.
4. **Decision Tracking**: Highlighted decisions/blockers trigger alerts to relevant roles (e.g., engineering lead).

**Mock-Up:**

```markdown
**Date:** 2025-02-03  
**Active Contributors:** 8 (2 new QA testers onboarded)  
**Critical Blockers:** Issue #45: Rendering crash on Linux  
**Key Initiative:** Netcode refactor (PR #78 merged)
```

## What are the benefits of the proposal?

- **Transparency**: Centralized visibility into progress.
- **Alignment**: Reduces redundant meetings.
- **Accountability**: Tracks unresolved blockers.

## What are the downsides of the proposal?

- Overhead for contributors to submit daily updates.
- Risk of rigidity if not adapted to evolving workflows.

## What are the alternative proposals?

- Use GitHub Projects/Jira (less tailored to open-source volunteer workflows).
- Weekly async summaries (loses real-time urgency).

## When might the proposed solution be used rarely or not at all?

- During low-activity periods (e.g., holidays).
- If the team shrinks to <5 contributors.

## Is this a V-Sekai core responsibility, and should it be done by us?

Yes. As an open-source project, maintaining transparent, community-friendly processes aligns with V-Sekai’s core values.

## What is the status of the proposal?

**Status:** Proposed

## Who is making decisions on the proposal?

- fire

## What tags does the proposal have?

- `V-Sekai`
- `Project Management`

## List further reading references

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
