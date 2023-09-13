# Challenges that need to be addressed in V-Sekai

## Metadata

- **Status:** Proposed
- **Deciders:** V-Sekai
- **Tags:** V-Sekai

## The Backdrop

In our quest to expand our community, we are faced with several challenges that need to be addressed.

## The Challenge

Our game has been QA Engineered by Facade, which was a great help. However, there are still issues that need to be resolved.

## The Strategy

We have identified several areas of concern and have charted them in the following flow diagram:

```mermaid
graph TD
  IK["IK errors ingame #256"]
  VOIP["Restore VOIP #255"]
  Gestures["Restore gestures #254"]
  Sensitivity["Increase default mouse sensitivity #253"]
  Text["UI dropdown text is invisible until hovered #252"]
  Escape["Escape button in menu should go back, instead does nothing #251"]
  Freeze["Pressing escape button while ingame freezes client #250"]
  Mirror["Restore mirror in the preview server #249"]
  Deadzones["Stick deadzones #248"]
  Invisible["When loading into a server without selecting an avatar, the default is invisible #247"]
  Raycast["Raycast rays from the menu remain visible in game #246"]
  Uploads["Restore world uploads #244"]
  Avatar["Restore avatar upload #243"]
  VR["VR doesn't work #228"]

  Crash["V-Sekai crash on start on RADV, Ubuntu 22.04.2 LTS (Jammy Jellyfish) #115"]
  Fingers["Corruption near the fingers #57"]
  Login["Allow another way to login from the map & avatar list dialog #52"]
  Loading["Avatars should load after the loading screen ends but before the menu screen #51"]
  Logout["People tend to be logged out by Uro #50"]
  Pause["Players get disoriented by the pause menu flow #31"]
  Speech["Player speech appears to stop forever #28"]
  Menu["Menu doesn't work in VR #8"]
  Jumping["Jumping doesn't work #6"]
  Grab["Restore grabbing and environmental interactions for players #47"]
  Upload["Couldn't upload a large map #68"]

  IK-->VOIP
  VOIP-->Gestures
  Gestures-->Sensitivity
  Sensitivity-->Text
  Text-->Escape
  Escape-->Freeze
  Freeze-->Mirror
  Mirror-->Deadzones
  Deadzones-->Invisible
  Invisible-->Raycast
  Raycast-->Uploads
  Uploads-->Avatar
  Avatar-->VR

  VR-->Crash
  Crash-->Fingers
  Fingers-->Login
  Login-->Loading
  Loading-->Logout
  Logout-->Pause
  Pause-->Speech
  Speech-->Menu
  Menu-->Jumping
  Jumping-->Grab
  Grab-->Upload
```

## The Upside

Addressing these issues will significantly improve the user experience, making our game more enjoyable and accessible. This could lead to an increase in our user base and community engagement.

## The Downside

The process of resolving these issues may require significant time and resources. It might also involve some trial and error, which could potentially introduce new bugs or problems.

## The Road Not Taken

Ignoring these issues is not an option as it would negatively impact the user experience and could hinder the growth of our community.

## The Infrequent Use Case

While some of these issues might only affect a small number of users or occur under specific circumstances, it's important to address them to ensure a smooth and enjoyable experience for all users.

## In Core and Done by Us?

Yes, these issues are core to the functionality of our game and should be addressed by our team.

## Further Reading

- [V-Sekai](https://v-sekai.org/)
- This article is assisted by AI.
