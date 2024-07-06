# Mozilla Builders Summer MVP Lab (SUBMITTED ON JUNE 8 2020)

Did you apply for our Spring MVP Lab program?

Check this if at least one team member applied.

One line summary of the MVP:

A fully remixable and self-hosted collaborative VR environment based on Godot Engine.

Description of the product: What will the MVP be in 8 weeks?

Our standalone Virtual Reality (VR) application will be usable from all SteamVR compatible PC headsets, as well as the mobile Oculus Quest VR platform. The MVP features a social hub with both 3D spatialized voice and realtime upper body tracking, with simple games, physics and social video viewing.

Category Category

- Collaboration & Society
- Decentralized Web : YES
- Messaging & Social Networking : YES
- Surveillance Capitalism
- Misinformation & Content
- Artificial Intelligence
- Web Assembly

Check all that apply.

Optional Video

~~https://www.youtube.com/watch?v=j2PTDXG1Hc4~~

Why does your idea matter: How will it help deliver on the full promise of the internet, or make the internet more awesome? \*
The core principles of the Internet are openness and communication. We see VR as the basis for a new frontier of communication products, Social VR platforms. Hastened by the closure and general failings of the once-open source High Fidelity platform, we are now in desperate need of open source alternatives to the growing number of closed source VR-compatible walled gardens in development.

We are at the pinnacle of a new wave of VR and related tech, and with the impending maturity of open game engines, audio and video codecs, combined with faster internet connectivity capable of hosting services, and increasingly available VR hardware, the time is right to lead the development of an open platform.

We believe in putting power back in the hands of individuals, and thus we are strong believers in decentralized technology. Our initial goal will be to produce a polished, well-functioning service, but we also have plans to integrate decentralized authentication and encryption schemes, including GPG and web of trust based E2EE, as well as decentralized content distribution tech such as Bittorrent and IPFS.

Who are your users or potential users?

We are building a product for all users of social VR, online collaboration or communication products. Social VR is a growing space, and its potential is only beginning to be realized, with a mass movement towards virtual collaboration.

Even VR as a whole is still in very early stages, but it represents a large potential market, especially with the recent availability of affordable and easy to install headsets such as the Oculus Quest, which has seen rapid growth after its release one year ago.

An example of a leading VR platform with public numbers, VRChat has recently between 12000 and 15000 concurrent online users across VR and Desktop platforms, with roughly 4000 concurrent VR users using this platform (out of a reported 4 million registered users as of 2019).

What is your personal connection to the service & the user group you are planning to reach with your product? \*

We're a passionate team of VR enthusiasts, some of us tinkering in our spare time with visual effects, level design, or graphics concepts still in research.

In an age where collaborating and connecting at distance is increasingly important, meeting in real life can often be a barrier to people. VR has the potential to bring people together and immerse them in a shared space, in a way that not even the best video collaboration can. I and another member of our group have participated in Virtual Market 4, the most recent iteration of a Japanese-run exponentially-growing marketplace of virtual content spanning multiple platforms.

Other Social VR platforms have found ways to immerse me in a multitude of realities: for example, engaging in real time with people around the world at all times of day and night: attending live dance and music events, seeing performers breakdance and do pole acrobatics using VIVE full body trackers, forming friendships through exchanging personal stories around a campfire, programming environments defined by a math function and then experiencing them in VR, even solving a 1000 piece jigsaw puzzle with friends. It is my dream to enable these experiences and more in a setting that is sustainable, open and accessible.

If we do not fund this project, will your team still work on it? To what extent? \*

An Injection of capital by Mozilla will speed up our development and let me take leave of my company to focus full time on the MVP. This could give us the opportunity to outrun these walled gardens in a very short time.

If not funded, we will be able to continue to advance it more slowly in our spare time, but other closed platforms are catching up, and time is of the essence. Our project will additionally drive development around open source VR support and 3D tools, and we can see lasting effects from our contributions in those areas.

Why did you pick this idea? Do you have domain expertise? How do you know people need what you’re building? \*

We’re seeding the beginning of the VR frontier, and we already see a sizable fraction of the current VR population spending a substantial amount of time in Social VR walled gardens, such as VRChat.

It can be difficult or impossible to build atop walled garden platforms outside of their respective visions: we’ve run into such roadblocks in past projects. For example a combination of lack of the persistence, access to media/web requests, and general customizability has made other platforms unsuitable for building long games, and unsuitable for building complex collaboration tools. Meanwhile, our platform can be self hosted, allows private usage and can be modified.

Our team includes significant backend and operations experience and several years of work on Godot Engine, all of which will be relevant to building this platform.

We suspect the need exists for an open alternative to other competing walled gardens. While many VR platforms are currently free-to-use and advertise a minimal set of privacy features, there is no guarantee that popular platforms will remain free or private forever: for example, a widely used product could be acquired by a corporation with different goals.

Additionally, we see potential for a customizable, open platform to be used within enterprises, as well as to build the foundation for games or other content which share needs with our platform, such as its VOIP or VR interaction features.

Are you looking for any teammates? If so, please indicate what skills or roles you seek.

Not at this time

We have created a Slack Channel and GitHub repository and issues list where you can post your project and look for teammates. You can also pivot or abandon your project as you connect with teammates:

GitHub: ~~https://github.com/fix-the-internet/spring-mvp-lab/issues~~

Slack: ~~https://join.slack.com/t/mozillabuilders/shared_invite/zt-czo6bp37-R9I5mKJVYPtCkTQFu1NLWw~~

Describe your work plan.

**THIS IS A COPY OF OUR GANTT CHART. THIS WAS NOT SUBMITTED ~Lyuma**

Week 1:
Maintain continuous integration of Windows SteamVR and Oculus Quest, and Linux server builds running on a public server against which to test and dogfood the product.
VOIP implementation: basic lipsync based on volume, integrate spatialization library.
Improve Inverse Kinematics implementation and add non-VR support.

Week 2:
Headless clients to extensively stress test the system.
Implement crash reporting system, and reporting metrics including performance.
Content: Use a basic scripting API to implement physics based games.
Begin work on engine changes necessary to give smooth framerates even when during content loading.

Week 3:
Networking interpolation: eliminate stuttering caused by networking.
Godot OpenVR Plugin: fix bugs causing inconsistent framerate in VR.
Pre-load content where needed to avoid stutters in the 3d environment.

Week 4:
Content: Begin work on specific set of hardcoded avatars.
Content: Recruit artist to begin work on create default home map.
Physics: fix physics errors such as sliding down ramps.
Test performance on regular vr hardware and optimization.

Week 5-6:
Account system, TOS, Privacy Policy.
Allow closed registration of users, starting with people who have already shown interest.
Continue working on content. Fix bugs and issues as needed.
Integration of video playback.
Focus on stress testing.

Week 7-8
Fix bugs discovered during testing.
Monitor performance metrics captured by users, keep fixing performance

Describe the approach the team will take to develop the Minimum Viable Product throughout the summer. This includes, but not limited to:

- _Who are your competitors?_

VRChat, Facebook Horizon, RecRoom, AltSpace, EngageVR, Spatial (quest), Mozilla Hubs, VirtualCast, cluster, Sansar, HTC Vive Sync, OasisVR, ChilloutVR, Lavender, Roblox VR
(We are not considering non-VR capable platforms or MMORPGs as competition)

- _How will you attract your first 1000 users? Your first 1,000,000?_

We anticipate contacts from our immediate VR communities who have already shown interest in our project will seed the first 50 users.

At a minimum, we will provide the real time presence features available in other VR platforms: appearing in a room of people who you can hear and to break past 100 users, we will need to provide experiences which are not easily accessible on other platforms such as VRChat.

To move beyond thousands of users: being a neutral, open platform to host events: for example, Virtual Market had on the order of a million visitors ( https://www.youtube.com/watch?v=lLX7UNKV1fk ; https://v-market.work/ ), was hosted just as a collection of VRChat world instances, and still had to deal with several glitches as a result of instabilities of the underlying platform.

Another source of usage will be business meetings, and anything where privacy and self-hosting is a concern. Making sure that it is lightweight and remains very easy to compile will allow novel usages and customizations of the platform.

- First 2 week development milestone

First two weeks:

- Maintain continuous integration of Windows SteamVR and Oculus Quest, and Linux server builds running on a public server against which to test and dogfood the product.
- VOIP implementation: basic lipsync based on volume, integrate spatialization library.
- Improve Inverse Kinematics implementation and add non-VR support.
- Headless clients to extensively stress test the system.
- Implement crash reporting system, and reporting metrics including performance.
- Content: Use a basic scripting API to implement physics based games.
- Begin work on engine changes necessary to give smooth framerates even when during content loading.

- Tech stack you plan to use (Cloud services, APIs, mobile platforms, languages, etc)

Godot Engine, k3s, Elixir, OAuth, CockroachDB, nginx, Fedora, CentOS 8, Digital Ocean Spaces, Oculus Quest SDK on Android, Valve OpenVR on Windows.

- Link to simple sketches (can be as simple as paper and pencil) of your product or idea

~~https://cdn.discordapp.com/attachments/659137056991346708/718332831687901224/vsekai-sketch.png~~

Links to mockups, prototypes, pitches.

What challenges do you anticipate with this idea?

With the exception of Hubs, the now-defunct High Fidelity, and a handful of proprietary VR platforms, most Social VR applications are being developed in Unity. This leads to a design challenge in building around infrastructure and content that was created specifically with Unity in mind. For example, one of the leading open model sharing formats VRM only officially supports exporting from Unity.

Social platforms are strongly impacted by network effect, which puts a challenge towards acquisition. On top of this, VR applications tend to have extremely low retention compared with conventional applications. One possible reason is the restriction of only running one application at a time.

We are likely to encounter several unanticipated engineering challenges: VR platforms combine most of the hardest problems in all aspects of computing, from art, networking, social features to graphics optimization.

Team Member Locations by Country

Add location of all team members by country. COMMA SEPARATED.

Canada, United States, United Kingdom

Team Details

Describe the background of ALL team members including finished projects, design skills, technologies, languages + frameworks you are familiar with or briefly describe any professional experience.

MMMaellon: C++, Java, and Python. Familiar with the Android and iOS frameworks. Design skills come from working professionally as a motion graphics and VFX artist, and video editor. Used to work for a mobile app developer and in the process of getting a masters in computer science.

Saracen: C++, C, C#, Java, Python, GDScript, Android. Worked several years professionally on mobile app development, self-taught experience working on game mods and game engine architecture including forks of the Id Software GPL releases, code contributions to the open source Godot Engine and to other VR platforms, tools development including Unity, Godot, and Blender plugins, and work on reimplementing legacy game engines for modern platforms.

Lyuma: C++, Java, Python, Javascript, C#, Android, iOS. Familiar with backend, operations, networking. Spent 9 years working in industry: led a team developing the VOIP and video implementation on an iOS and Android app reaching hundreds of millions of users, including the backend architecture, scaling, operations, and networking, as well as the stats and monitoring needed to optimize the design.

iFire: C++. Familiar with Godot Engine and Unreal Engine. Working professionally in game development. For Godot Engine, created a Blender to glTF2 pipeline and coordinating a FBX pipeline. Shipped Offworld Industries’ Squad (80 player War Simulator) as a programmer, devops, and IT for nearly two years. As a team, I implemented a Unreal Engine touch screen product demo for an aerospace company that was exhibited at the Las Vegas NBAA convention using HTML5 and Blueprints.

Will all team members be committing their full-time energy to this project during the 8 weeks of the program? Not all successful MVP applicants will, but we do expect a major commitment to the MVP Lab. Please explain if you’re not able to commit fulltime to this & how we can be sure this will be a very serious commitment by you and your team

MMMaellon is making individual contributions, including a VR character movement system, that have proved extremely valuable, as needed.

Saracen will be working full time on the core client written for Godot.

Lyuma will be working full time on this project starting with the MVP Lab, focusing on dev ops, operations, backend and testing.

iFire is heavily engaged with the wider open source community surrounding Godot Engine, and takes on projects which help further Godot as an ecosystem, on top of spending part time dedicated to this MVP project.

How did you hear about the MVP Lab?

We heard about it from Hacker News: https://news.ycombinator.com/item?id=23194178

Anything else we should know?

Aside from being passionate in the VR space, we are all committed to open source/decentralization, and we strive to bring value to the internet community as a whole.
