# Proposal: Wasm Cache Incident Report

## Context

The issue arose while attempting to build the desync module for Godot Engine 4.3.

## Problem Statement

The following error was encountered even though the module is disabled from building and other code was identical to master:

```bash
error: undefined symbol: saveSetjmp (referenced by root reference (e.g. compiled C/C++ code))
warning: To disable errors for undefined symbols use `-sERROR_ON_UNDEFINED_SYMBOLS=0`
warning: _saveSetjmp may need to be added to EXPORTED_FUNCTIONS if it arrives from a system library
error: undefined symbol: testSetjmp (referenced by root reference (e.g. compiled C/C++ code))
warning: _testSetjmp may need to be added to EXPORTED_FUNCTIONS if it arrives from a system library
Error: Aborting compilation due to previous errors
em++: error: '/home/runner/work/_temp/5ca5bc6c-db6b-4fae-a502-2fde903054ae/emsdk-main/node/16.20.0_64bit/bin/node /home/runner/work/_temp/5ca5bc6c-db6b-4fae-a502-2fde903054ae/emsdk-main/upstream/emscripten/src/compiler.mjs /tmp/tmpjyhtoot1.json' failed (returned 1)
scons: *** [bin/godot.web.template_release.wasm32.js] Error 1
scons: building terminated because of errors.
```

## Proposed Solution

The proposed solution involves modifying the web build Github Actions and suffixing the branch name. The steps are as follows:

1. Modify the `GODOT_BASE_BRANCH` environment variable in the Github Actions workflow file:

```yaml
name: 🌐 Web Builds
on:
  workflow_call:

# Global Settings
env:
  # Used for the cache key. Add version suffix to force clean build.
  GODOT_BASE_BRANCH: master # Add a suffix here.
```
2. Combine master with em version: `master-em-3.1.59`
3. Commit the changes.

## Benefits

This solution will help in resolving the current build issue and ensure that the Godot Engine 4.3 desync module is built successfully.

## Downsides

The downside of this approach is that it requires manual intervention for each build process, which might not be feasible for continuous integration/continuous deployment (CI/CD) pipelines.

## Alternatives Considered

An alternative could be to investigate the root cause of the undefined symbols and fix them at the source code level.

## Infrequent Use Case

This solution is specifically for the current build issue and may not apply to other build problems or modules.

## In Core and Done by Us

This proposal is made by us and is intended to be implemented in the core build process of the Godot Engine.

## Status

Status: Proposed

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - The GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

This proposal was assisted by Aria, an AI assistant.
