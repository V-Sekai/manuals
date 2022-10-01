# V-Sekai allows distributing custom avatars and worlds in a networked environment

## Abstract 

A networked avatar system is a virtual world in which multiple users can interact with each other as avatars. The system consists of several parts that work together to allow users to customize their avatars and interact with other players.

## Distribute the custom content your users create to the clients that need it.

* upload the custom content from the Godot Engine editor to the Uro backend
* use a content distribution network to distribute the packages
* use store version metadata to keep track of changes in the Uro backend

## Manage the avatar and world data for each client in the system.

* the server serves the avatar and world data being simulated
* the server needs to know which clients need which assets
* the server needs to know which clients have what assets
* the server needs to know where the assets are located
* send the appropriate assets to each client from a server.



