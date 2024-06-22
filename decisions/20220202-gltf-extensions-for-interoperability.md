# Accepted: Interoperability between platforms using gltf extensions

- Status: accepted
- Deciders: V-Sekai,fire,lyuma,humbletim,codefloof,
- Tags: V-Sekai,

## Context and Problem Statement

Build Gltf extensions. Why build incomplete Gltf extensions with limited usefulness without the complete package? We should be making for creators, not ourselves.

## Describe the proposed option and how it helps to overcome the problem or limitation

`humbletim`, `codefloof`, `iFire` and `lyuma` debated the meaningfulness of building Gltf extensions.

iFire constructed an argument we are making a Gltf container for the metaverse. A metaverse container where each part is separated because of limited engineering bandwidth. We brought up the point Gltf isn't unknown and is unknown.

Lyuma can't entirely agree that Gltf extensions are "separated." Gltf extensions are independent extensions that are good from an engineering perspective.

Lyuma reaffirmed his suspicions that OMI standards are not so valuable in isolation. Humbletim raised valid concerns that the Unity work had not progressed, and Mozilla Hubs had not merged the OMI audio emitter code. We may need Unity platforms and Mozilla Hubs to bootstrap the ecosystem, but tools like Gltf transform could sidestep it.

iFire also constructed a strawman of how operating inside a platform is seamless, and transferring between platforms is like pulling teeth. Still, a strawman isn't something that helped facilitate the discussion so Lyuma may have misunderstood that part. iFire described the unity package vs others. Lyuma agrees that this is valid; other formats could be deemed "interoperable," more expressive than Gltf.

In Lyuma's mind, it's a fair X point that already exists. So why work on Y? Why does Gltf 3d format if we have Fbx 3d format etc.?

Lyuma doesn't think we need to assume that there must be only one standard.

We're trying to see if we can do better by working together than taking some existing closed format and using it verbatim.

OMI work is valid even if a unity package standard exists. We don't need to be the only standard.

iFire didn't exhaust all the details of the point, but we can make a Gltf transform for as many standards we can catalog.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

We will generate github actions templates using the same jsonnet we use for GoCD.

## Positive Consequences <!-- optional -->

- Interoperating between platforms.

## Negative Consequences <!-- optional -->

- Easy to ignore users.

## Option graveyard:

- Option: Keep the status quo, which is having separate platforms.
- Rejection Reason: We want interoperability at OMI.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

It is not only a few lines of code.

## Is there a reason why this should be core and done by us?

We want to maintain it to encourage developers and as the publisher of the platform it is our responsibility.

## References <!-- optional and numbers of links can vary -->

- https://omigroup.org/

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
