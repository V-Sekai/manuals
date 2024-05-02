# Proposed: Launching the mvsqlite rdbms server

## Context

In software development and maintenance, automation of routine tasks is crucial for efficiency. One such task is launching a database server at system startup. For macOS users, this can be achieved using `launchd`, an open-source service management framework. In this context, we are specifically interested in automating the launch of the `mvsqlite` RDBMS server.

## Problem Statement

The task at hand is to create a `launchd` service for macOS that will automatically run the following command at system startup:

```bash
/usr/local/bin/mvstore --data-plane 127.0.0.1:7000 --admin-api 127.0.0.1:7001 --metadata-prefix mvstore-test --raw-data-prefix m --auto-create-namespace --cluster /usr/local/etc/foundationdb/fdb.cluster
```

Additionally, we need to be able to retrieve logs from this service and check its status.

## Solution

To solve this problem, we can create a `.plist` file in the `~/Library/LaunchAgents` directory. This file will define our `launchd` service and specify the command it should run. We can also add keys to redirect the standard output and error to log files. Finally, we can use the `launchctl list` command to check the status of our service.

Here are the detailed steps:

### Creating the .plist File

1. Open Terminal and navigate to the LaunchAgents directory:

```bash
cd ~/Library/LaunchAgents
```

2. Create a new `.plist` file called `com.user.mvstore.plist`:

```bash
touch com.user.mvstore.plist
```

3. Open the file with a text editor (e.g., nano):

```bash
nano com.user.mvstore.plist
```

4. Paste the following content into the file:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.user.mvstore</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/local/bin/mvstore</string>
        <string>--data-plane</string>
        <string>127.0.0.1:7000</string>
        <string>--admin-api</string>
        <string>127.0.0.1:7001</string>
        <string>--metadata-prefix</string>
        <string>mvstore-test</string>
        <string>--raw-data-prefix</string>
        <string>m</string>
        <string>--auto-create-namespace</string>
        <string>--cluster</string>
        <string>/usr/local/etc/foundationdb/fdb.cluster</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>EnvironmentVariables</key>
    <dict>
        <key>RUST_LOG</key>
        <string>info</string>
        <key>DYLD_LIBRARY_PATH</key>
        <string>/usr/local/lib</string>
    </dict>
</dict>
</plist>
```

5. Save and close the file.

6. Load the new service:

```bash
launchctl load ~/Library/LaunchAgents/com.user.mvstore.plist
```

### Retrieving Logs

To retrieve logs from the `launchd` service, add the `StandardOutPath` and `StandardErrorPath` keys to the `.plist` file. These keys will redirect the standard output (stdout) and standard error (stderr) to specified log files.

### Checking the Service Status

To check the `launchd` status for `mvsqlite`, use the `launchctl list` command:

```bash
launchctl list | grep mvstore
```

## Benefits

Automating tasks with `launchd` can save time and reduce the risk of errors. It also provides a standardized way to manage services on macOS.

## Downsides

The main downside is that `launchd` is specific to macOS, so this solution won't work on other operating systems.

## The Road Not Taken

An alternative approach could be to use cron jobs or another task scheduler, but these may not offer the same level of control and flexibility as `launchd`.

## Infrequent Use Case

This solution is most useful for developers who frequently need to run certain commands at system startup. It may be less relevant for casual users or those who don't use macOS.

## In Core and Done by Us

This solution was developed in-house by the V-Sekai development team.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

Assistance provided by Aria, an AI assistant.
