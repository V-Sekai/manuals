# Rejected: To allow independent deployment run our own infrastructure

- Status: rejected <!-- proposed | draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

## Context and Problem Statement

It needs to be possible to replicate (or substitute) all of the existing infrasture and setup. This is important for a few reasons:

- The current host may disappear or the physical hardware could break (as it is not in a cloud)
- Part of our project's purpose is to allow anyone to fork the project or run their own version V-Sekai however they want.
- As a use for "staging" or testing changes to infrastructure.
- As a means for replicating live data such as CDN content, metadata or other databases. (some assets may depend on other assets in the future)

## Describe the proposed option and how it helps to overcome the problem or limitation

1. Run TrueNAS Scale in DigitalOcean (Droplet/standalone VM, not kubernetes).
2. (It should be possible in other cloud providers, and on own infrastructure, but we will pick this environment to focus on)
3. Write TrueNAS Scale charts for gocd; cockroachdb; uro
4. LetsEncrypt certs require open port 443 or 80 for http01; or any dns01 provider using a plugin.
5. TrueNAS Scale supports backups and snapshots.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

- Create new droplet. (Minimum configuration????):
  - Custom Image -> pick our TrueNAS image or some custom one we make.
  - Basic: pick a number of cpus. Direct storage is only used for the OS.
  - Add a block volume for $10. TrueNAS requires a separate block device.
  - Do not enable backups because TrueNAS has its own backup systems.
- Add one extra block volume after the machine spins up to get redundancy (RAID-1?)
- (Note that block volumes can be moved between VMs, so doing things this way gives pretty good redundancy.

## Positive Consequences <!-- optional -->

- Giving people many ways to remix, host or fork our work is part of our mission.
- It will give us a way to quickly spin up redundant infrastructure in the cloud, either if a disaster happens or we want to scale.

## Negative Consequences <!-- optional -->

- Supporting more configurations will take more time from us.

[this section can be repeated for each option if more than one option is open for consideration]

## Option graveyard: <!-- same as above -->

- Option: Support only bare metal infrastructure
- Rejection Reason: This is not ideal unless you are at scale, because bare metal can die and cannot scale.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

This project is to document what the script will be

## Is there a reason why this should be core and done by us?

Infra is part of our mission.

## References <!-- optional and numbers of links can vary -->

- https://docs.digitalocean.com/products/volumes/how-to/move-between-droplets/

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
