# Draft: Update V-Sekai Charter to 2024

## The Context

The Mozilla Builders Summer MVP Lab charter was submitted on June 8, 2020. It's now time to refresh our goals and direction.

## The Problem Statement

Our current V-Sekai charter is outdated and needs to be revised to reflect the project's current state and future ambitions in 2024.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

**A one-line summary of the MVP:**

A customizable and self-hosted virtual reality environment built on Godot Engine.

**Description of the product: What will the MVP be in 8 weeks?**

Our virtual reality app will be compatible with all SteamVR-compatible PC headsets and the Meta Quest VR platform. It will feature a social hub with 3D voice chat, real-time body tracking, simple games, integrated physics, and social video viewing.

**Category:**

- Decentralized Web: YES
- Messaging & Social Networking: YES

**Why does your idea matter? How will it help deliver on the full promise of the internet or make the internet more awesome?**

The internet thrives on openness and communication. We believe virtual reality is a powerful new medium for human connection. With the closure of platforms like High Fidelity, open-source alternatives are crucial to counter the trend of closed VR platforms.

VR technology is advancing rapidly. Better game engines, audio and video codecs, faster internet speeds, and more accessible VR hardware create the perfect opportunity to develop an open platform.

We champion individual empowerment through decentralized technology. Our goal is to build a polished and functional service that integrates decentralized authentication and encryption, along with content distribution technologies like BitTorrent and IPFS.

**Who are your users or potential users?**

Our target audience includes users of social VR experiences, online collaboration tools, and communication products. The social VR space is growing, and its potential is just beginning to be explored.

Despite being a relatively new technology, VR has a large potential market, particularly with the rise of affordable headsets like Meta Quest. For example, VRChat boasts between 12,000 and 15,000 concurrent users, with approximately 4,000 using VR in 2019.

**What is your connection to the service & the user group you plan to reach with your product?**

We are a team of VR enthusiasts with backgrounds in visual effects, level design, and graphics.

In an era where remote connection is essential, VR offers a more immersive and engaging way to bring people together compared to traditional video calls. One of our team members has participated in Virtual Market 4, a growing virtual content marketplace.

Through other social VR platforms, we have connected with people worldwide, attended live events, and formed meaningful friendships. We aim to provide these experiences in an open and accessible environment.

**Will your team still work on this project if we do not fund it? To what extent?**

We are committed to this project and will continue development regardless of funding. However, external funding would significantly accelerate our progress and help us stay competitive with closed VR platforms that are rapidly evolving.

**Why did you pick this idea? Would you happen to have domain expertise? How do you know people need what you’re building?**

We recognize the need for an open alternative to closed VR platforms. Many current platforms are free, but there's no guarantee they will remain that way. Our platform offers the advantages of self-hosting, private use, and modification.

Our team possesses expertise in backend operations and Godot Engine development, both essential for building this platform.

**Are you looking for any teammates? If so, please indicate what skills or roles you seek.**

We welcome new contributors! We have a Discord group, a GitHub repository, and an issues list where individuals can learn about the project and find ways to contribute.

**Could you describe your work plan?**

| Week         | Tasks                                                                                                                                                                                                                                                                    |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Week 1**   | - Maintain continuous integration of Windows SteamVR, Meta Quest, and Linux server builds. <br> - Implement basic VOIP with lipsync based on volume and integrate a spatialization library. <br> - Improve Inverse Kinematics and add non-VR support.                    |
| **Week 2**   | - Stress test the system using headless clients. <br> - Implement a crash reporting system and performance metrics. <br> - Use a basic scripting API to implement physics-based games. <br> - Begin optimizing the engine for smooth frame rates during content loading. |
| **Week 3**   | - Implement networking interpolation to eliminate stuttering. <br> - Fix bugs in the Godot OpenVR plugin that cause inconsistent framerate in VR. <br> - Pre-load content to avoid stutters in the 3D environment.                                                       |
| **Week 4**   | - Begin work on hardcoded avatars. <br> - Recruit artists to create a default home map. <br> - Fix physics errors. <br> - Test performance on various VR hardware and optimize.                                                                                          |
| **Week 5-6** | - Implement an account system, Terms of Service, and Privacy Policy. <br> - Enable closed registration of users. <br> - Continue working on content and bug fixes. <br> - Integrate video playback. <br> - Focus on stress testing.                                      |
| **Week 7-8** | - Fix bugs found during testing. <br> - Monitor performance metrics and continue performance optimization.                                                                                                                                                               |

**Could you describe the team's approach to developing the Minimum Viable Product throughout the summer? This includes, but is not limited to:**

**Who are your peers?**

| Tier S              | Tier A        | Tier B        |
| ------------------- | ------------- | ------------- |
| VRChat              | Spatial       | ENGAGE VR     |
| Meta Horizon Worlds | Mozilla Hubs  | HTC Vive Sync |
| cluster             | VirtualCast   | Oasis VR      |
| Rec Room            | Sansar        | ChilloutVR    |
| Roblox VR           | Somnium Space | Lavender      |
|                     | Overte        | Resonite      |
|                     |               | Bigscreen     |
|                     |               | Anyland       |
|                     |               | VirBELA       |

**How will you attract your first 1000 users? Your first 1,000,000?**

- **Initial Users:** We will leverage our existing contacts within the VR community to gain our first 50 users.
- **Growth:** We will offer unique experiences not found on other platforms to attract more users.
- **Scaling:** To reach thousands of users, we will host events and emphasize privacy and self-hosting capabilities.

**First 2-week development milestone**

- Maintain continuous integration of builds for Windows SteamVR, Meta Quest, and Linux servers.
- Implement basic VOIP with lipsync and spatialization.
- Improve Inverse Kinematics and add non-VR support.
- Conduct stress testing with headless clients.
- Implement crash reporting and performance metrics.
- Use a scripting API to implement physics-based games.
- Begin engine optimization for smooth frame rates during content loading.

**Tech stack you plan to use (Cloud services, APIs, mobile platforms, languages, etc)**

Godot Engine, k3s, Elixir, OAuth, CockroachDB, Nginx, Fedora, CentOS 8, Digital Ocean Spaces, Meta Quest SDK on Android, Valve OpenVR on Windows.

**Link to simple sketches (can be as simple as paper and pencil) of your product or idea**

[Insert Link to Sketches Here]

**What challenges do you anticipate with this idea?**

- **Design Challenges:** Most social VR applications are developed in Unity, which can present design challenges for our Godot Engine-based project.
- **User Acquisition:** Social platforms are heavily influenced by the network effect, making user acquisition a challenge.
- **User Retention:** VR applications tend to have lower user retention rates compared to traditional applications.

**Team Member Locations by Country**

Canada, United States, United Kingdom

**Team Details**

- **MMMaellon:** C++, Java, Python. Experience with Android and iOS frameworks. Design skills in motion graphics, VFX, and video editing. Background in mobile app development and currently pursuing a master's in computer science.
- **Saracen:** C++, C, C#, Java, Python, GDScript, Android. Professional experience in mobile app development, self-taught in game mods, game engine architecture (including forks of Id Software GPL releases), contributed code to Godot Engine and other VR platforms, developed tools including Unity, Godot, and Blender plugins, and worked on reimplementing legacy game engines for modern platforms.
- **Lyuma:** C++, Java, Python, Javascript, C#, Android, iOS. Expertise in backend, operations, and networking. 9 years of industry experience leading a team that developed VOIP and video implementation for an iOS and Android app with hundreds of millions of users. Experience includes backend architecture, scaling, operations, networking, stats, and monitoring.
- **iFire:** C++. Familiar with Godot Engine and Unreal Engine. Professional game developer. Created a Blender to glTF2 pipeline for Godot Engine and coordinated an FBX pipeline. Shipped Offworld Industries’ Squad as a programmer, DevOps, and IT. Implemented an Unreal Engine touchscreen product demo using HTML5 and Blueprints.

**Will all team members commit their full-time energy to this project during the 8 weeks of the program?**

- **MMMaellon:** Making valuable individual contributions as needed, including a VR character movement system.
- **Saracen:** Will be working full-time on the core client.
- **Lyuma:** Will be working full-time on dev ops, operations, backend, and testing.
- **iFire:** Heavily involved in the Godot Engine open-source community and dedicated part-time to this MVP project.

**How did you hear about the MVP Lab?**

We learned about the MVP Lab from Hacker News: [https://news.ycombinator.com/item?id=23194178](https://news.ycombinator.com/item?id=23194178)

**Is there anything else we should know?**

We are passionate about VR, open source, and decentralization. We are dedicated to building a valuable platform for the internet community.

## The Benefits

Updating our V-Sekai charter to 2024 will:

- Ensure the project remains relevant and aligned with current technology and user needs.
- Provide a clear roadmap and goals for the development team.
- Attract potential investors and collaborators.
- Increase the project's credibility and visibility.

## The Downsides

Updating our V-Sekai charter to 2024 could:

- Potentially overcommit resources and time.
- Introduce the risk of technological or market shifts that render parts of the charter obsolete.
- Increase the risk of team burnout due to ambitious goals.

## The Road Not Taken

Maintaining the current charter and focusing on short-term goals could:

- Offer more flexibility.
- Reduce the risk of overcommitting resources.
- Potentially limit the project's long-term growth and impact.

## The Infrequent Use Case

Examples of less frequent use cases for the V-Sekai platform:

- Virtual historical reenactments or educational tours.
- Hosting virtual conferences or trade shows.

## Why is it in Core and done by us?

Updating the V-Sekai charter is core to our mission because:

- We are committed to developing an open-source, decentralized VR platform.
- Our team has the necessary expertise and passion.
- Setting long-term goals ensures project sustainability.

## Status

**Status:** Draft

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)

AI assistant Aria assisted with this article.
