# Setup Avatar Uploading for VRChat on Linux

## Context and Problem Statement

To test VRChat compatibility, we need to install VRChat, Unity, and its associated Univrm SDKs.

I'm also on linux.

## Describe the proposed option and how it helps to overcome the problem or limitation

The solution will be to document how to install the associated packages.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Download Unity Hub from https://public-cdn.cloud.unity3d.com/hub/prod/UnityHub.AppImage

```bash
chmod +x UnityHub.AppImage
./UnityHub.AppImage unityhub://2019.4.29f1/0eeae20b1d82
```

Must install Windows mono package and use Windows target platform.

To install a Unity Package go to Assets > Import Packages > Custom Package and select all the files in the dialog.

Install UniVRM from https://github.com/vrm-c/UniVRM/releases/download/v0.76.0/UniVRM-0.76.0_7adf.unitypackage.

VRMConverterForVRChat cares about UniVRM versions.

Install https://codeload.github.com/esperecyan/VRMConverterForVRChat/zip/refs/tags/v27.1.1 into the Assets folder.

Install https://github.com/esperecyan/UniVRMExtensions/archive/refs/tags/v1.6.2.zip into the Assets folder.

Install https://vrchat.com/home/download VRCHAT SDK3 for Avatar and Worlds.


Log in VRChat for upload. (There is a randomized waiting period.)

Restart Unity.

Drop the VRM character into the Characters folder inside of Assets.

Open the VRM character prefab and select the root node and then export as a VRChat Avatar.

Save the avatar to Assets/VRChat Character.

### Troubleshooting

* VRM doesn't export or import.
  * The vrm may be badly defined.  

## Positive Consequences <!-- optional -->

- Improve interoperatibility
- Improve VRM standard

## Negative Consequences <!-- optional -->

- Complexity
- Blackbox design

## If this enhancement will not be used often, can it be worked around with a few lines of script?

This is documentation and can be automated.

## Is there a reason why this should be core and done by us?

No one seemed to document this.

## References <!-- optional -->

- https://public-cdn.cloud.unity3d.com/hub/prod/UnityHub.AppImage
- https://vrchat.com/home/download
- The current Unity version in use by VRChat is Unity 2018.4.20f1.

## Derivative License

Copyright (c) 2020-2021 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
