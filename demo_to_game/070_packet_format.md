# Variable bit rate encoding

The strategy we want to use is called variable bit rate encoding to optimize the use of bandwidth.

In the context of our game, this strategy can be applied to reduce the amount of data that needs to be sent over the network for each snapshot. Here's how it could work with our `TimeOffsetPacket` and `DataPacket` structures:

1. **Keyframe Omission**: Instead of sending a full update (a keyframe) for every single frame, you only send keyframes at certain intervals. In between these keyframes, you send smaller updates (delta frames) that describe how the game state has changed since the last keyframe. This is where the `frame_within_metablock` and `frame_offset` fields come into play. They allow you to specify which keyframe a particular delta frame is relative to.

2. **Interpolation**: On the receiving end, the game client uses the data from the keyframes and delta frames to interpolate the game state for the frames in between. This means that even though you're sending less data, the client can still produce a smooth animation. The `x_offset`, `y_offset`, and `z_offset` fields in the `DataPacket` structure are used for this purpose. They provide the information needed to calculate the position of an entity at any given frame.

3. **Variable Bit Rate Encoding**: The `time_bit_width`, `x_bit_width`, `y_bit_width`, and `z_bit_width` fields in the `TimeOffsetPacket` structure allow you to use different amounts of bits for different types of data. For example, if the x, y, and z positions of an entity don't change much from one frame to the next, you might choose to use fewer bits to represent these values. This can help to further reduce the size of your snapshots.

4. **Octahedral Compression**: The rotation of the rigid bodies is stored as an octahedral normal, which is a very efficient way to represent 3D rotations. This can significantly reduce the amount of data needed to represent the orientation of each rigid body.

## Entity

Given the `Entity` struct:

```cpp
struct TimeOffsetPacket {
    uint16_t frame_within_metablock; // Bits 0-15
    uint8_t time_bit_width;          // Bits 16-19
    uint8_t x_bit_width;             // Bits 20-23
    uint8_t y_bit_width;             // Bits 24-27
    uint8_t z_bit_width;             // Bits 28-31
    uint32_t byte_offset_to_first_packet; // Bits 0-23 of high word
    uint8_t amount_of_packets_that_follow; // Bits 24-31 of high word
};

struct DataPacket {
    uint16_t base_x_value; // bits 0-15
    uint16_t base_y_value; // bits 16-31
    uint16_t base_z_value; // bits 32-47
    // The following fields are bit-compressed
    uint16_t frame_offset; // [Time bit width] (unsigned)
    int16_t x_offset;      // [X bit width] (signed)
    int16_t y_offset;      // [Y bit width] (signed)
    int16_t z_offset;      // [Z bit width] (signed)
};
```

```cpp
// Given values
int size_of_time_offset_packet = 11;
int size_of_data_packet = 14;
int total_bytes = 1596;
int packets_per_entity = 4;
int packets_per_bone = 2;

// Calculate the number of DataPackets we can store after accounting for one TimeOffsetPacket
int data_packet_count = (total_bytes - size_of_time_offset_packet) / size_of_data_packet; // This will be 113

// Calculate the number of DataPackets we can store after accounting for the entity's position, orientation, linear_velocity and angular_velocity
data_packet_count = data_packet_count - packets_per_entity; // This will be 109

// Now, let's solve for the number of bones
int total_bones = data_packet_count / packets_per_bone; // This will be 54
```

1. `TimeOffsetPacket`
1. A full RigidBody structure on the server consists of position, orientation, linear_velocity and angular_velocity.
1. Rotation is stored as x/y is an octahedral normal storing axis, while z is the rotation. Converting from this to quaternion is extremely efficient.
1. A bone is similar to the rigid body.
1. We omit frames for the worst representation to represent a user at distances.
1. Lets assume all bones are in constant motion at all time.
1. We can pretend a entity is a skeleton without bones and that will work out since a skeleton is a Node3D.

## Unknowns

Define some character limitations, for the skeleton.

We need to define that before we start coding on it, else your going to be chasing a very long ouroboros and it will come back to bite you.

Distance limitations, farther you get the higher the positional precision losses which will cause issues with converting for math.

Also need some sort of id system for player info.

Max number of bones, min number of bones, bone important so as you move farther away the # of bones decreases in association to what informaiton you need to send.

The limitation boundaries based on distance from the player.

## Targets

For AAA game development, target $2.50 to $3 USD per user per server per month.

00knight at Winter Pixel Games tries to keep each players state update under 1.2 kilobytes. So 1.2 kilobytes x 30hz x number of players + whatever meta data is transferred at a lesser rate.

## References

1. [Serialization Strategies](https://gafferongames.com/post/serialization_strategies/)
2. [Networked Physics in Virtual Reality](https://www.youtube.com/watch?v=sx4IIQL0x7c)
3. [Godot Engine Proposal](https://github.com/godotengine/godot-proposals/issues/3375)
4. [Host your Unreal Engine game for under $1 USD](https://aws.amazon.com/blogs/gametech/how-to-host-your-unreal-engine-game-for-under-1-per-player-with-amazon-gamelift/)
```
