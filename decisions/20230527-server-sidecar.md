# Proposed: Efficiently managing and synchronizing game data with a server sidecar

## Metadata

- Status: proposed
- Deciders: V-Sekai, Bioblaze Payne, fire
- Tags: V-Sekai, GPT-4

## Context and Problem Statement

V-Sekai is facing a problem with efficiently managing and synchronizing data across multiple devices and platforms.

The goal is to find a more reliable and efficient solution for data synchronization that can handle large amounts of data, minimize latency, and ensure data consistency across all devices and platforms.

## Proposed Solution

We propose a new approach that involves directly inserting data into the MVSQLite cluster database and implementing a robust syncing mechanism to ensure data consistency across all devices and platforms.

1. Modify the editor export process to stream MVSQLite to the Godot Engine server.
2. Schedule externally consistent syncing of MVSQLite with the Godot Engine server (1 frame).
3. Schedule periodic syncing of MVSQLite to a backup (e.g., every 30 minutes).

## Implementation

```gdscript
# Step 1: Insert MVSQLite data directly into the MVSQLite database.
func insert_data_to_database():
    var mvsqlite_data = get_mvsqlite_data()
    var db = MVSQLite.new()
    db.open("user://your_database_name.db")
    for data in mvsqlite_data:
        db.execute("INSERT INTO your_table_name (column1, column2) VALUES (?, ?)", [data.column1, data.column2])
    db.close()

# Step 2: Schedule externally consistent syncing of MVSQLite with the SQLite database (1 frame).
func _process(delta):
    if should_sync():
        insert_data_to_database()

# Step 3: Schedule periodic syncing of MVSQLite to a backup (e.g., every 30 minutes).
var backup_timer = Timer.new()
func _ready():
    backup_timer.set_wait_time(1800) # 30 minutes in seconds
    backup_timer.connect("timeout", self, "_on_backup_timer_timeout")
    add_child(backup_timer)
    backup_timer.start()

func _on_backup_timer_timeout():
    insert_data_to_database()

# Helper functions
func get_mvsqlite_data():
    # Placeholder for obtaining MVSQLite data from the project
    pass

func should_sync():
    # Placeholder for determining when to sync MVSQLite data with the SQLite database
    pass
```

## Positive Consequences

- Improved data management and performance.
- Enhanced security through server validation and sanitization.
- Reduced load on the client-side.

## Negative Consequences

- Increased complexity in the system architecture.
- Potential challenges in implementing the new architecture.

## Option Graveyard

1. **Client-side caching**: Storing data on the client-side to reduce server load. However, this approach can lead to security vulnerabilities and inconsistent data across clients.
2. **Static file export**: Exporting data as static files instead of using MVSQLite. This option was rejected due to limited flexibility and scalability.

These options were considered but ultimately rejected in favor of the proposed solution, which aims to balance performance, security, and maintainability.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

The proposed enhancement is designed to address core limitations in V-Sekai's architecture and cannot be easily worked around with a few lines of script.

## Is there a reason why this should be core and done by us?

Implementing this solution at the core level ensures that all users benefit from improved data management, performance, and security. Additionally, addressing these limitations at the core level allows for better integration with other components of the system.

## References

- [V-Sekai](https://v-sekai.org/)
