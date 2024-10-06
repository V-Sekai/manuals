# Accepted: Restoring Default User Directory Structure in Windows 11

## The Context

Using Windows 11.

## The Problem Statement

Microsoft has configured OneDrive to automatically move key user folders such as Documents, Desktop, and others from the user directory into the OneDrive folder. This change can disrupt users' familiar file organization and system workflows.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

The solution involves two main steps:

1. **Disabling OneDrive Sync**: Users need to pause or stop OneDrive from syncing these folders.
2. **Running a Restore Default Paths Script**: Execute a script that resets the default paths of user directories back to their original locations on the local drive.

## The Benefits

- Restores traditional file paths for ease of access and familiarity.
- Reduces dependency on cloud synchronization for essential folders.
- Improves system performance by reducing unnecessary sync operations.

## The Downsides

- Manual intervention required by users not comfortable with script execution.
- Potential data discrepancies if files are not fully synchronized before the change.

## The Road Not Taken

Alternative solutions like using third-party tools or different cloud services were considered but dismissed due to increased complexity and potential security concerns.

## The Infrequent Use Case

Users who operate primarily offline or have strict data handling policies may find this change particularly beneficial.

## In Core and Done by Us

This proposal is to be implemented internally within the V-Sekai development team's systems before considering broader deployment.

## Status

Status: Accepted <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.
3. [Windows 10/11 User Shell Folders Restore Default Paths](https://www.winhelponline.com/blog/windows-10-shell-folders-paths-defaults-restore/)

AI assistant Aria assisted with this article.
