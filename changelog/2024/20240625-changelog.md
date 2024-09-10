# Special Notice: V-Sekai 2023-2024

## Stuff we did over the past year:

### 2023

- Focused on Unidot and VRM (import pipeline).
- Godot 4.0 bugfixes and animation. Lots of engine dev.
- July–Aug spent time working on new CDN downloader and starting to rethink avatar controller.

### 2023

- New networking system committed to v-sekai-game and to a demo repository. It is missing basic features like support for pickup items so we haven't enabled it yet.

### 2024

- Jan–Mar focused on FBX support and GDC.
- Apr–May focused on updating Unidot to support FBX.

## Current work:

- Since early June, Lyuma started to revisit the incomplete code from 10 months ago. Lyuma is currently working on tracker binding / skeleton calibration (e.g. full body).
- 4.3 release was delayed. Lyuma wants to release 4.3-compatible updates to Unidot and VRM.
- Lyuma had some difficulties with API integration.
- Some Godot 4.3 bugs are still on Lyuma's plate.

## Other projects in progress:

- New in-game UI update. A draft was committed a couple weeks ago but saracen has been away on vacation.
- Saracen has also been working some more on physics sync.
- API/backend redesign.

## WTFAWRY: What do we need to get v-sekai-game working with the new architecture:

- Integration of UI code into game.
- Network syncing support of props/objects using the new system.
- Integration of other game features between avatar_vr_demo (player controller) and v-sekai-game (legacy codebase).
- New backend so we can reenable registration.
- Some OpenAPI wrapper so we can talk to the new backend.

Lyuma thinks we should put more focus on getting something lightweight we can run and play levels in. Lyuma is of half a mind to put more focus into making avatar demo runnable with custom content rather than fully integrating network syncing just so we can get off the ground more easily with content creation.
