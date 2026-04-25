# Draft: Updater No-Op Implementation Using Velopack

## The Context

V-Sekai needs frequent updates to improve and expand its VR features.

## The Problem Statement

It's essential to keep users informed during updates without distracting them with complex visuals.

## Design

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

- Simplicity: Straightforward user communication.
- Clarity: Clear update status messages.
- Performance: Efficient use of resources through Velopack's optimized update mechanisms.

## The Downsides

- Lack of Visual Appeal: Simple text might seem less professional.
- Dependency on External Tool: Reliance on Velopack for update management.

## The Road Not Taken

A full graphical interface was considered but deemed too distracting for this phase.

## The Infrequent Use Case

Users who rarely update might prefer more detailed visuals.

## In Core and Done by Us

Handled internally to ensure seamless integration with Velopack.

## Status

Status: Draft <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai, 20241014-app-updater
- Updater
- Velopack

## Further Reading

[@velopack_documentation_2024]: "Velopack Documentation." Learn more about how Velopack manages application updates. <https://velopack.org/docs>

