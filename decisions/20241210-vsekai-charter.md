# Draft: Update V-Sekai Charter to 2024.

## The Context

The Mozilla Builders Summer MVP Lab charter was submitted on June 8, 2020.

## The Problem Statement

We want to update our V-Sekai charter to 2024.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

**A one-line summary of the MVP:**

A customizable and self-hosted virtual reality environment using Godot Engine.

**Description of the product: What will the MVP be in 8 weeks?**

In 8 weeks, our virtual reality app will work with all SteamVR-compatible PC headsets and the Meta Quest VR platform. It will have a social hub with 3D voice chat, real-time body tracking, simple games, physics, and social video viewing.

**Category:**

- Collaboration & Society
- Decentralized Web: YES
- Messaging & Social Networking: YES
- Surveillance Capitalism
- Misinformation & Content
- Artificial Intelligence
- Web Assembly

**Why does your idea matter? How will it help deliver on the full promise of the internet or make the internet more awesome?**

The Internet is about openness and communication. We see virtual reality as a new way to connect people. With the closure of the High Fidelity platform, we need open-source alternatives to the growing number of closed VR platforms.

We are at a point where VR and related tech are advancing quickly. With better game engines, audio and video codecs, faster internet, and more VR hardware, it's the right time to develop an open platform.

We believe in giving power back to individuals through decentralized technology. Our goal is to create a polished, well-functioning service and integrate decentralized authentication and encryption, as well as content distribution technologies like BitTorrent and IPFS.

**Who are your users or potential users?**

We are building this for users of social virtual reality, online collaboration, and communication products. Social VR is growing, and its potential is just starting to be realized.

Even though VR is still new, it has a large potential market, especially with affordable headsets like the Meta Quest. For example, VRChat has between 12,000 and 15,000 concurrent users, with about 4,000 using VR in 2019.

**What is your connection to the service & the user group you plan to reach with your product?**

We're a team of VR enthusiasts who work on visual effects, level design, and graphics in our spare time.

In a time when connecting at a distance is important, VR can bring people together in a shared space better than video calls. One of our team members has participated in Virtual Market 4, a growing virtual content marketplace.

Other social VR platforms have allowed us to engage with people worldwide, attend live events, and form friendships. We want to enable these experiences in an open and accessible setting.

**Will your team still work on this project if we do not fund it? To what extent?**

Without funding, we will continue to work on it in our spare time, but other closed platforms are catching up, and time is crucial.

**Why did you pick this idea? Would you happen to have domain expertise? How do you know people need what you’re building?**

We see a need for an open alternative to closed VR platforms. Many VR platforms are free now, but there's no guarantee they will stay that way. Our platform can be self-hosted, used privately, and modified.

Our team has experience in backend operations and working with Godot Engine, which is relevant to building this platform.

**Are you looking for any teammates? If so, please indicate what skills or roles you seek.**

We have a Discord group, a GitHub repository, and an issues list where we can post about the project and look for teammates.

**Could you describe your work plan?**

| Week         | Tasks                                                                                         |
| ------------ | --------------------------------------------------------------------------------------------- |
| **Week 1**   | - Maintain continuous integration of Windows SteamVR, Meta Quest, and Linux server builds.    |
|              | - VOIP implementation: Basic lipsync based on volume, and spatialization library integration. |
|              | - Improve Inverse Kinematics implementation and add non-VR support.                           |
| **Week 2**   | - Headless clients will stress test the system.                                               |
|              | - Implement crash reporting system and performance metrics.                                   |
|              | - Content: Use a basic scripting API to implement physics-based games.                        |
|              | - Begin work on engine changes for smooth frame rates during content loading.                 |
| **Week 3**   | - Networking interpolation: eliminate stuttering caused by networking.                        |
|              | - Godot OpenVR Plugin: fix bugs causing inconsistent framerate in VR.                         |
|              | - Pre-load content to avoid stutters in the 3D environment.                                   |
| **Week 4**   | - Content: Begin work on hardcoded avatars.                                                   |
|              | - Content: Recruit artists for creating a default home map.                                   |
|              | - Physics: fix physics errors such as sliding down ramps.                                     |
|              | - Test performance on regular VR hardware and optimization.                                   |
| **Week 5-6** | - Account system, TOS, Privacy Policy.                                                        |
|              | - Allow closed registration of users.                                                         |
|              | - Continue working on content and fix bugs.                                                   |
|              | - Integration of video playback.                                                              |
|              | - Focus on stress testing.                                                                    |
| **Week 7-8** | - Fix bugs found during testing.                                                              |
|              | - Monitor performance metrics and keep fixing performance.                                    |

**Could you describe the team's approach to developing the Minimum Viable Product throughout the summer? This includes, but is not limited to:**

**Who are your competitors?**

| Tier S              | Tier A        | Tier B        |
| ------------------- | ------------- | ------------- |
| VRChat              | Rec Room      | ENGAGE VR     |
| Meta Horizon Worlds | Roblox VR     | HTC Vive Sync |
| cluster             | Spatial       | Oasis VR      |
| Rec Room            | Mozilla Hubs  | ChilloutVR    |
| Roblox VR           | VirtualCast   | Lavender      |
| Meta Horizon Worlds | Sansar        | Resonite      |
|                     | Somnium Space | Bigscreen     |
|                     | Overte        | Anyland       |
|                     |               | VirBELA       |


**How will you attract your first 1000 users? Your first 1,000,000?**

We will start with contacts from our VR communities to get the first 50 users. To get more users, we will offer unique experiences not available on other platforms. To reach thousands of users, we will host events and ensure privacy and self-hosting capabilities.

**First 2-week development milestone**

**First two weeks:**

- Maintain continuous integration of Windows SteamVR, Meta Quest, and Linux server builds.
- VOIP implementation: basic lipsync based on volume, and spatialization library integration.
- Improve Inverse Kinematics implementation and add non-VR support.
- Headless clients will stress test the system.
- Implement crash reporting system and performance metrics.
- Content: Use a basic scripting API to implement physics-based games.
- Work on engine changes for smooth frame rates during content loading.

**Tech stack you plan to use (Cloud services, APIs, mobile platforms, languages, etc)**

Godot Engine, k3s, Elixir, OAuth, CockroachDB, Nginx, Fedora, CentOS 8, Digital Ocean Spaces, Meta Quest SDK on Android, Valve OpenVR on Windows.

**Link to simple sketches (can be as simple as paper and pencil) of your product or idea**

Most Social VR applications are being developed in Unity, leading to design challenges. Social platforms are strongly impacted by the network effect, which challenges acquisition. VR applications tend to have low retention compared with conventional applications.

**What challenges do you anticipate with this idea?**

**Team Member Locations by Country**

Canada, United States, United Kingdom

**Team Details**

**MMMaellon:** C++, Java, and Python. Familiar with the Android and iOS frameworks. Design skills come from working professionally as a motion graphics, VFX artist, and video editor. I used to work as a mobile app developer and am getting a master's in computer science.

**Saracen:** C++, C, C#, Java, Python, GDScript, Android. Worked several years professionally on mobile app development, self-taught experience working on game mods and game engine architecture, including forks of the Id Software GPL releases, code contributions to the open source Godot Engine and other VR platforms, tools development including Unity, Godot, and Blender plugins, and work on reimplementing legacy game engines for modern platforms.

**Lyuma:** C++, Java, Python, Javascript, C#, Android, iOS. Familiar with backend, operations, and networking. Spent 9 years working in industry: led a team developing the VOIP and video implementation on an iOS and Android app, reaching hundreds of millions of users, including the backend architecture, scaling, operations, and networking, as well as the stats and monitoring needed to optimize the design.

**iFire:** C++. Familiar with Godot Engine and Unreal Engine. Working professionally in game development. A Blender to glTF2 pipeline was created for Godot Engine, and an FBX pipeline was coordinated. Shipped Offworld Industries’ Squad (80-player War Simulator) as a programmer, DevOps, and IT for nearly two years. As a team, I implemented an Unreal Engine touchscreen product demo for an aerospace company exhibited at the Las Vegas NBAA convention using HTML5 and Blueprints.

**Will all team members commit their full-time energy to this project during the 8 weeks of the program?**

Not all successful MVP applicants will, but we expect a significant commitment to the MVP Lab. Please explain if you cannot commit full-time to this and how we can be sure this will be a very serious commitment by you and your team.

MMMaellon is making individual contributions, including a VR character movement system, that have proved extremely valuable, as needed.

Saracen will be working full-time on the core client written for Godot.

Lyuma will work full-time on this project, starting with the MVP Lab, focusing on dev ops, operations, backend, and testing.

iFire is heavily engaged with the wider open-source community surrounding Godot Engine and takes on projects that help further Godot as an ecosystem. In addition, it spends part-time dedicated to this MVP project.

**How did you hear about the MVP Lab?**

We heard about it from Hacker News: https://news.ycombinator.com/item?id=23194178

**Is there anything else we should know?**

We are passionate about VR, open source, and decentralization, and strive to bring value to the internet community.

## The Benefits

Updating our V-Sekai charter to 2024 will:

- Keep the project relevant and aligned with current technological advancements and user needs.
- Provide a clear roadmap and goals for the development team.
- Attract potential investors and collaborators.
- Enhance the project's credibility and visibility within the VR and open-source communities.

## The Downsides

Updating our V-Sekai charter to 2024 could:

- Overcommit resources and time without guaranteed funding.
- Risk technological changes or market shifts rendering parts of the charter obsolete.
- Lead to team burnout or turnover due to the extended timeline and ambitious goals.

## The Road Not Taken

Maintaining the current charter and focusing on short-term goals could:

- Allow more flexibility and adaptability to changing market conditions.
- Reduce the risk of overcommitting resources and time.
- Potentially limit the project's growth and impact.

## The Infrequent Use Case

An infrequent use case for our V-Sekai platform could be:

- Virtual historical reenactments or educational tours.
- Hosting virtual conferences or trade shows.

## Why is it in Core and done by us?

Updating the V-Sekai charter to 2024 is core to our mission because:

- We are committed to developing an open-source, decentralized VR platform.
- Our team has the expertise and passion for VR and open-source technology.
- Setting long-term goals ensures the project's sustainability and growth.

## Status

**Status:** Draft <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
