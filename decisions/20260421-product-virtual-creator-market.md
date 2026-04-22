# Virtual Creator Market as the Primary Product

Juan Linietsky's framework for evaluating a game idea before writing a line of code names four questions: who will play it, how will you reach them, how will it be financed, and what makes it different. The same questions apply to any product. multiplayer-fabric answers the fourth with unusual depth — zone streaming, content-addressed delivery, and self-hosted infrastructure are capabilities no competitor ships. The first three questions remain unanswered as of April 2026.

This document answers them by identifying the product most likely to sustain the group financially and most naturally served by what multiplayer-fabric already does.

**The Product**

A self-hostable virtual creator marketplace and event platform. Communities run their own virtual market events — avatar showcases, doujin goods sales, fan conventions — on hardware they control. Creators sell directly; the event organizer keeps what they earn.

One sentence: **A virtual event stage you host yourself, where avatar creators sell and keep 100% of their earnings.**

**Who Will Use It**

Creators: Avatar and 3D asset makers in the Japanese doujin economy and the global VRChat/VRM creator community. This audience already attends virtual market events. Virtual Market (バーチャルマーケット), run by Hikky, drew over 1.3 million visitors worldwide and holds a Guinness World Record as the world's largest VR event. The format is proven; no self-hostable alternative exists.

Organizers: Fan convention organizers — anime, gaming, cosplay — who want a persistent virtual venue without platform risk. Rec Room shut down in March 2026 after reaching 150 million registered users, stranding every community that had built events on that platform. Self-hostability is now a trust argument.

Attendees: Desktop users with no headset. Alife Virtual reached 1.1 million users on a desktop-only client. Approximately 50% of VRChat sessions use desktop mode even after the iOS and Android launch. Meta's own data showed that desktop and mobile users were more engaged than headset users within Meta's own ecosystem, which drove Horizon Worlds to pivot away from VR as its primary surface. The total addressable audience is larger without a headset requirement than with one.

**How to Reach Them**

Avatar creators share booth walkthroughs and sales announcements on Twitter/X and YouTube. A creator with 20,000 followers posting a 60-second booth video reaches more qualified users than any paid campaign. The discovery funnel is creator-driven.

The entry point is the group's existing proximity to the VRChat and VRM content creator communities and to Booth.pm, the Japanese avatar marketplace. These communities are already conditioned to participate in virtual market events; they need an event platform they can own.

**How to Finance It**

Event hosting subscriptions: Organizers who do not want to self-host pay a recurring fee for a managed instance. The group operates the infrastructure; the organizer operates the event.

White-label SDK: Convention organizers license the platform for their brand. This is a B2B sale — longer sales cycles, larger contract values, recurring revenue.

Not a transaction fee on creator sales. Taking a cut of creator earnings is the mechanism that creates platform risk and drives migration. The business model is event infrastructure, not commission. This is the explicit differentiator from VRChat's shop layer and any future Virtual Market competitor.

Linietsky reports that approximately one in ten funded games succeeds and only two or three recover their investment. Infrastructure products follow different economics: revenue is recurring, not launch-concentrated, and the comparison is a developer tools business, not a game release.

**What Makes It Different**

No existing platform combines all four properties:

| Platform | Self-hostable | Desktop-first | Zone streaming | Creator keeps 100% |
|---|---|---|---|---|
| Virtual Market / Hikky | No | Partial | No | No |
| VRChat | No | Yes (50% of sessions) | No | No |
| Mozilla Hubs | Yes | Yes | No | N/A |
| Resonite | No | Yes | No | N/A |
| **This product** | **Yes** | **Yes** | **Yes** | **Yes** |

Differentiation must be communicable in one sentence, one image, or one short video. The sentence above passes this test. The table above is the image.

**What multiplayer-fabric Already Provides**

Zone streaming handles event crowds. A convention hall with thousands of concurrent attendees is a zone topology problem. multiplayer-fabric solves it: each hall is a zone, entities migrate at boundaries, the physics loop runs at constant cost per zone regardless of global headcount.

Content-addressed delivery handles product assets. A buyer downloads only the chunks they do not already have. A repeat visitor to the same booth pays no redundant bandwidth. The same avatar file shared across multiple booths is stored once.

ReBAC handles booth access control. Booth owners specify who can enter their space, purchase items, or modify their display. Permission checks happen at join time and upload time, not per tick.

Self-hosted deployment is the trust argument. Docker Compose reference deployment, no cloud dependency, no third-party platform to pivot or shut down.

**What Is Not Decided Here**

- Avatar and product listing UI, creator onboarding flow
- Payment processing integration
- Asset moderation tooling
- Whether managed hosting runs on Fly.io multi-region or single-node Docker

## Status

Status: Proposed

## Decision Makers

- iFire

## Tags

- Product, VirtualMarket, CreatorEconomy, Sustainability, Marketplace, Events, Desktop

## References

```bibtex
@article{linietsky2017,
  author  = {Juan Linietsky},
  title   = {How to Make Your Dream Game, Publish It, and Not Die in the Process},
  journal = {Godot Engine Blog},
  year    = {2017},
  month   = {August},
  url     = {https://godotengine.org/article/how-make-your-dream-game-publish-it-and-not-die-process/}
}

@online{hikky2025,
  author       = {{Hikky Co., Ltd.}},
  title        = {Virtual Market — Company Profile},
  year         = {2025},
  url          = {https://hikky.co.jp/en/},
  note         = {Over 1.3 million visitors worldwide; Guinness World Record for largest VR event}
}

@online{vrchat2025,
  author       = {{VRChat Inc.}},
  title        = {VRChat Launches on iOS and Android},
  year         = {2025},
  month        = {October},
  url          = {https://hello.vrchat.com/blog/vrchat-on-ios-and-android},
  note         = {Approximately 50% of VRChat sessions use desktop mode without a headset}
}

@online{recroom2026,
  author       = {{Rec Room Inc.}},
  title        = {Rec Room Shutdown Announcement},
  year         = {2026},
  month        = {March},
  note         = {Platform shut down after reaching 150 million registered users; communities lost access to user-built content}
}

@online{horizon2026,
  author       = {{Meta Platforms, Inc.}},
  title        = {Horizon Worlds Shifts Primary Surface to Mobile},
  year         = {2026},
  month        = {February},
  note         = {Meta's internal data showed desktop and mobile users were more engaged and more numerous than headset users, even within Meta's own ecosystem}
}

@online{alife2025,
  author       = {{Alife Virtual}},
  title        = {Alife Virtual Platform},
  year         = {2025},
  note         = {Over 1.1 million users on a desktop-only social avatar client; no VR hardware required}
}
```
