# Proposed: Enable Windows 11 Installation on Older Computers

## Context

Many users with older computers wish to upgrade to Windows 11, but face compatibility issues.

## Problem Statement

Facilitating the installation of Windows 11 on older computer systems.

## Solution Overview

The following steps outline a method to bypass certain system requirements during the Windows 11 installation process:

1. Initiate the Windows 11 installer.
2. Press SHIFT + F10 to open the command prompt.
3. Enter `regedit` and press Enter to open the registry editor.
4. Navigate to `HKEY_LOCAL_MACHINE\SYSTEM\Setup`.
5. Create a new registry key under Setup named `LabConfig`.
6. Within `LabConfig`, create DWORD values named `BypassTPMCheck` and `BypassSecureBootCheck`, setting each to `1`. If you also want to bypass the RAM requirement, add a DWORD value for `BypassRAMCheck`.
7. Close both regedit and the command prompt. You should now be able to proceed with your Windows 11 installation.

## Benefits

- Allows users with older hardware to access Windows 11 features.
- Extends the lifespan of older devices.

## Downsides

- Potential security risks due to bypassing TPM and Secure Boot checks.
- Performance may not be optimal on older hardware.

## Alternatives Considered

- Upgrading hardware to meet Windows 11 requirements.
- Sticking with Windows 10 or other operating systems.

## Infrequent Use Case

This proposal is primarily beneficial for users with older hardware who wish to use Windows 11.

## In Core and Done by Us

This proposal is currently under consideration by the V-Sekai development team.

## Status

Status: Proposed

## Decision Makers

- V-Sekai Development Team

## Tags

- V-Sekai
- Windows 11
- Installation

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - The GitHub page for the V-Sekai open-source project.
3. [Toms Hardware: bypass-windows-11-tpm-requirement](https://www.tomshardware.com/how-to/bypass-windows-11-tpm-requirement)

Assisted by AI assistant Aria.
