import starvote
from starvote import hashed_ballots_tiebreaker
import json
from collections import defaultdict

# Individual voter ballots with original category structure (0 scores omitted)
voter_ballots = [
    # Fire's ballot
    [
        {   # Customization
            "Appearance Swapper 👗 - 3 preset outfit toggle": 80,
            "Build Duplicator 🏗️ - Object copy/paste tool": 80,
            "UGC Upload 🛠️ - Basic model/texture submission": 80
        },
        {   # Interaction
            "Avatar Calibration 🤖 - Height/Scale adjustment sliders": 85,
            "VR UI Selection 🎯 - Laser pointer object interaction": 100,
            "Script Editing Sandbox 💻 - On-the-fly gameplay scripting": 70
        },
        {   # Audio
            "Voice Chat 🔊 - Chat with voice": 90,
            "Directional VOIP 🔊 - Distance-based voice channel clarity": 60,
            "Lip Sync Prototype 🔊 - Basic viseme (FACS) triggers from audio input": 70
        },
        {   # Interface
            "Emergency Menu 📋 - Basic pause/glitch recovery panel": 50,
            "Text Chat Core 💬 - Persistent message display": 90
        },
        {   # Social
            "Friend List 👥 - Add/Remove contact system": 60,
            "VRM Trial 🕶️ - Single-avatar import test": 70
        },
        {   # Systems
            "Host Handoff 🏠 - Basic migration protocol": 95,
            "Script Console 💻 - Runtime command input": 80,
            "Rule Toggles ⚖️ - 3 configurable parameters": 60
        },
        {   # Simulation
            "Skill Progress 📈 - Experience counter display": 90
        },
        {   # Economy
            "Item Trade 💰 - Direct player exchange UI": 90,
            "NPC Patrol 🤖 - Predefined path walking": 60
        },
        {   # Production
            "Model Importer 🎨 - FBX/GLB load test": 60,
            "Poly Budget Tool 🖌️ - Triangle counter display": 70,
            "Level Streamer 🚀 - Section load/unload trigger": 60,
            "Investor Demo 💵 - 5-minute feature showcase": 90
        },
        {   # Networking
            "Multi-User Instance 🌐 - 10-player test environment": 100,
            "Object State Sync 🔄 - Position/Rotation transmission": 100,
            "Room Transition 🔄 - Basic join/leave mechanics": 100
        }
    ],
    
    # Lyuma's ballot
    [
        {   # Customization
            "Build Duplicator 🏗️ - Object copy/paste tool": 80,
            "UGC Upload 🛠️ - Basic model/texture submission": 80
        },
        {   # Interaction
            "VR UI Selection 🎯 - Laser pointer object interaction": 90
        },
        {   # Interface
            "Emergency Menu 📋 - Basic pause/glitch recovery panel": 50
        },
        {   # Social
            "VRM Trial 🕶️ - Single-avatar import test": 100
        },
        {   # Systems
            "Host Handoff 🏠 - Basic migration protocol": 20
        },
        {   # Simulation
            "Skill Progress 📈 - Experience counter display": 70
        },
        {   # Production
            "Poly Budget Tool 🖌️ - Triangle counter display": 5,
            "Level Streamer 🚀 - Section load/unload trigger": 80
        },
        {   # Networking
            "Multi-User Instance 🌐 - 10-player test environment": 100,
            "Room Transition 🔄 - Basic join/leave mechanics": 60
        }
    ],
    
    # Astral's ballot
    [
        {   # Interaction
            "Avatar Calibration 🤖 - Height/Scale adjustment sliders": 70
        },
        {   # Audio
            "Directional VOIP 🔊 - Distance-based voice channel clarity": 100
        },
        {   # Interface
            "Text Chat Core 💬 - Persistent message display": 100
        },
        {   # Social
            "Friend List 👥 - Add/Remove contact system": 100
        },
        {   # Systems
            "Host Handoff 🏠 - Basic migration protocol": 50
        },
        {   # Simulation
            "Mood Indicator 😊 - Basic emotion states UI": 25,
            "Skill Progress 📈 - Experience counter display": 75
        },
        {   # Networking
            "Multi-User Instance 🌐 - 10-player test environment": 100,
            "Object State Sync 🔄 - Position/Rotation transmission": 100,
            "Room Transition 🔄 - Basic join/leave mechanics": 100
        }
    ],
    
    # Lito's ballot
    [
        {   # Social
            "VRM Trial 🕶️ - Single-avatar import test": 90
        },
        {   # Systems
            "Host Handoff 🏠 - Basic migration protocol": 90,
        },
        {   # Production
            "Model Importer 🎨 - FBX/GLB load test": 80,
            "Level Streamer 🚀 - Section load/unload trigger": 90,
        },
        {   # Networking
            "Multi-User Instance 🌐 - 10-player test environment": 100,
            "Room Transition 🔄 - Basic join/leave mechanics": 70
        }
    ],
    
    # Deepseek R1's ballot
    [
        {   # Customization
            "Appearance Swapper 👗 - 3 preset outfit toggle": 95,
            "Build Duplicator 🏗️ - Object copy/paste tool": 80
        },
        {   # Interaction
            "Script Editing Sandbox 💻 - On-the-fly gameplay scripting": 85,
            "VR UI Selection 🎯 - Laser pointer object interaction": 70
        },
        {   # Audio
            "Voice Chat 🔊 - Chat with voice": 100,
            "Directional VOIP 🔊 - Distance-based voice channel clarity": 90,
            "Lip Sync Prototype 🔊 - Basic viseme (FACS) triggers from audio input": 80
        },
        {   # Interface
            "Emergency Menu 📋 - Basic pause/glitch recovery panel": 55,
            "Text Chat Core 💬 - Persistent message display": 100
        },
        {   # Social
            "Emote Wheel 😃 - 6-slot expression selector": 80,
            "Friend List 👥 - Add/Remove contact system": 90
        },
        {   # Systems
            "Script Console 💻 - Runtime command input": 90,
            "Rule Toggles ⚖️ - 3 configurable parameters": 50
        },
        {   # Simulation
            "Hunger Meter 🍎 - Time-based depletion": 100,
            "Mood Indicator 😊 - Basic emotion states UI": 95,
            "Skill Progress 📈 - Experience counter display": 90
        },
        {   # Economy
            "Item Trade 💰 - Direct player exchange UI": 100,
            "Wall Painter 🏡 - Single-surface color tool": 90,
            "NPC Patrol 🤖 - Predefined path walking": 85
        },
        {   # Production
            "Model Importer 🎨 - FBX/GLB load test": 60,
            "Poly Budget Tool 🖌️ - Triangle counter display": 60
        },
        {   # Networking
            "Multi-User Instance 🌐 - 10-player test environment": 30
        }
    ]
]

def flatten_ballot(category_ballots):
    return {task: score for category in category_ballots for task, score in category.items()}

flat_ballots = [flatten_ballot(b) for b in voter_ballots]

seats = 5

results = starvote.election(
    method=starvote.star if seats < 2 else starvote.allocated,
    ballots=flat_ballots,
    seats=seats,
    tiebreaker=hashed_ballots_tiebreaker,
    maximum_score=100,
)

print(json.dumps(results, indent=4))
