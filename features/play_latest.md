# Play the latest build

Instructions last checked 2022-10-22.

V-Sekai uses rolling releases and is alpha quality.

> Alpha software may not contain all of the features that are planned for the final version. Alpha software is not thoroughly tested by the developer before it is released to customers. (Definition from Wikipedia.)

Our V-Sekai CI is located at [ci.v-sekai.cloud/](https://ci.v-sekai.cloud) - you must use Guest to login, since GitLab is admin-only.

Here are links to each of the latest jobs. Generally, you will want to click the Artifacts tab from each of these to download things.

Editor (linux, windows):

- [linuxJob](https://ci.v-sekai.cloud/go/tab/build/detail/godot-groups-editor/latest/defaultStage/latest/linuxJob)
- [windowsJob](https://ci.v-sekai.cloud/go/tab/build/detail/godot-groups-editor/latest/defaultStage/latest/windowsJob)

templates.tpz (for making export):

- [defaultJob](https://ci.v-sekai.cloud/go/tab/build/detail/godot-groups-editor/latest/templateZipStage/latest/defaultJob)

V-Sekai demo release (linux, windows):

- [linuxDesktopJob](https://ci.v-sekai.cloud/go/tab/build/detail/groups-export/latest/exportStage/latest/linuxDesktopJob)
- [windowsJob](https://ci.v-sekai.cloud/go/tab/build/detail/groups-export/latest/exportStage/latest/windowsJob)

Direct .zip downloads of the releases can be found here (linux, windows):

- [export_linuxbsd.zip](https://ci.v-sekai.cloud/go/files/groups-export/latest/exportStage/latest/linuxDesktopJob/export_linuxbsd.zip)
- [export_windows.zip](https://ci.v-sekai.cloud/go/files/groups-export/latest/exportStage/latest/windowsJob/export_windows.zip)

The included .exe are fully functioning Godot editors. However, note that the .exe will not function properly as an editor unless you copy it or rename to be different from the .pck. again, you must use Guest when it asks you to sign in then, from those links, you can click the Artifacts tab
