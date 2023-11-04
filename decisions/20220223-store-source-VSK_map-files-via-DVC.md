# Rejected: Storing raw VSK_map files via DVC to avoid limitations

## Categories:

- pipeline
- V-Sekai

## Status:

- rejected <!-- draft | rejected | accepted | deprecated | superseded by -->

## Deciders:

- V-Sekai
- ifire
- lyuma

## Context and Problem Statement

How do I version control large binary game assets?

Need a procedure to version control large file folders like game map levels.

## Describe the proposed option and how it helps to overcome the problem or limitation

Propose using DVC as the version control system on top of git with a S3 remote on Digital Ocean.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Initial list of binaries to transfer to DVC

Use a Linux command to get the top 20 by size file types.

- `*.glb`
- `*.gltf`
- `*.bin*`
- `*.png`
- `*.webp`
- `*.jpg`
- `*.jpeg`
- `*.exr`
- `*.scn`

### Remotes

S3 Compatible has multiple implementations. Intent on using digital ocean spaces.

### Permissions vs Cost

- Permissions?
- Open bucket
- Cost of storage

### Installing

- https://dvc.org/doc/install/windows
  - https://github.com/iterative/dvc/releases/download/2.9.5/dvc-2.9.5.exe
- https://dvc.org/doc/install/linux

### Test using chibifire dvc bucket and the avatar wellness repository.

```bash
git clone https://github.com/fire/avatar-wellness.git
dvc init
dvc remote add -d chibifire-dvc-web https://chibifire.sfo3.digitaloceanspaces.com/dvc/
# dvc remote add --local chibifire-dvc-s3 s3://chibifire/dvc
# dvc remote modify --local chibifire-dvc-s3 endpointurl sfo3.digitaloceanspaces.com
# dvc remote modify --local chibifire-dvc-s3 access_key_id 'AAAA'
# dvc remote modify --local chibifire-dvc-s3 secret_access_key 'BBBB'
dvc config core.autostage true
```

### A V-Sekai alternative organization for creator

Discussed with Lyuma how it is possible to make a V-Sekai alternative organization for creator repositories.

## Positive Consequences <!-- optional -->

- Able to version control maps.

## Negative Consequences <!-- optional -->

- Usability now has a gap.

## Option graveyard: <!-- same as above -->

- Option: Do not use DVC remote on Google drive.
- Rejection Reason: Google Drive does not have two implementions

- Option: Use Github with git-lfs
- Rejection Reason: The last time I checked it was 50 USD per 50 gigabytes.

- Option: Use Gitlab git-lfs
- Rejection Reason: There is slightly larger limit on https://gitlab.com git-lfs but gitlab.com does not scale with usage.

- Option: Use Gitlab.com
- Rejection Reason: Gitlab.com commrcial is expensive

## If this enhancement will not be used often, can it be worked around with a few lines of script?

A version control system and object stores are not trivial and hard.

## Is there a reason why this should be core and done by us?

We want to present V-Sekai maps for others to remix.

## References <!-- optional and numbers of links can vary -->

- [DVC Version Control system](https://dvc.org/) <!-- example: Refined by [xxx](yyyymmdd-xxx.md) -->

## Derivative License

Copyright (c) 2022 V-Sekai contributors.

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
