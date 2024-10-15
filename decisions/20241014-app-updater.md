# Proposed: Updater No-Op Implementation Using Velopack

## The Context

V-Sekai needs frequent updates to improve and expand its VR features.

## The Problem Statement

It's essential to keep users informed during updates without distracting them with complex visuals.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

### Pseudo-Code Using Velopack

```gdscript
func update_application():
    show_text("Updating V-Sekai... Please wait.")
    if Velopack.check_for_updates():
        Velopack.perform_update()
    hide_text()
    notify("Update complete!")

func show_text(text):
    var label = Label.new()
    label.text = text
    add_child(label)

func hide_text():
    get_node("Label").queue_free()

func notify(message):
    show_message(message)
```

## The Benefits

- **Simplicity:** Straightforward user communication.
- **Clarity:** Clear update status messages.
- **Performance:** Efficient use of resources through Velopack's optimized update mechanisms.

## The Downsides

- **Lack of Visual Appeal:** Simple text might seem less professional.
- **Dependency on External Tool:** Reliance on Velopack for update management.

## The Road Not Taken

A full graphical interface was considered but deemed too distracting for this phase.

## The Infrequent Use Case

Users who rarely update might prefer more detailed visuals.

## In Core and Done by Us

Handled internally to ensure seamless integration with Velopack.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai
- Updater
- Velopack

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub repository.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - Project page on GitHub.
3. [Velopack Documentation](https://velopack.org/docs) - Learn more about how Velopack manages application updates.

AI assistant Aria assisted with this article.