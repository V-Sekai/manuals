# Proposed: Store presentation and book content via Lottie

## Context and Problem Statement

[Safety brochure in Lottie format]

We want to display book content and presentation content in groups.

If the original content is in vectorized format, we want to keep it.

We do not have enterprise levels of engineering power.

Licenses have to be compatible with groups.

## Describe the proposed option and how it helps to overcome the problem or limitation

Lottie via Samsung's rlottie library helps solve this problem. Lottie keeps pixel and curve data.

RGBA8 data is big and Lottie keeps it as pixel and does not rasterize curves.

Lottie exports may turn fonts into curves.

V-Sekai already has the rlottie implementation in Godot engine so engineering effort is minimized.

rlottie is Groups license compatible.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

### Offline export of lottie

1. Install synfig-studio
1. In synfig, for each page of pdf, epub, and others export a lottie json per page
1. Ensure the documents are sorted correctly
1. Save the folder as zstd compress 7zip archive
1. Name the archive `.cbzl` This is file that is similar to CBZ but has an extra l to make it easy to identify as Lottie.

### Online import of lottie

1. Open the zip.
1. For each sorted entry of the zip
1. Make a Godot Engine PackedScene using the Groups Lottie importer.

## Positive Consequences <!-- optional -->

- In engine presentation engine

## Negative Consequences <!-- optional -->

- Lottie is an obscure format

## Option graveyard: <!-- same as above -->

- Option: Create single executable Pdfium thing that writes to png
- Rejection Reason:
- Chromium build processes are difficult, but someone made a pdfium binary repository.

- Option: Import pdfium into Godot Engine as a static library
- Rejection Reason:
- Adding pdf support to Godot Engine is difficult.
- The straight-forward pdf implementation writes the RGBA8 data into the cache.

- Option: Use Godot Engine's native SVG library
- Rejection Reason:
- Does not support pixel data.
- Unreliable

## If this enhancement will not be used often, can it be worked around with a few lines of script?

rlottie and pdf formats are complicated.

## Is there a reason why this should be core and done by us?

Presentations and books should be a first-class feature in groups.

## References <!-- optional -->

- https://www.synfig.org/
- https://github.com/Samsung/rlottie
- https://github.com/godot-extended-libraries/lottie
- https://www.adobe.com/products/aftereffects.html
- https://airbnb.io/lottie/#/
- https://lottiefiles.com/
- https://github.com/reMarkable/pdfium-binaries

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
