# Proposed: Create a Conceptual Model of VRChat Networking

## The Context

In the realm of virtual reality, particularly within VRChat, understanding the networking model is crucial for developers. This proposal aims to create a comprehensive conceptual model of VRChat's networking system.

## The Problem Statement

Developers often struggle with the intricacies of VRChat's networking, leading to inefficient code and suboptimal user experiences. A clear and concise guide is needed to demystify the process.

## Describe How Your Proposal Will Work with Code, Pseudo-Code, Mock-Ups, or Diagrams

### Sending Data in VRChat

There are two primary methods to send data in VRChat:

1. **Udonsynced Variables**:

   - Mark variables as `[UdonSynced]`.
   - Call `RequestSerialization()` in the script to send a copy of the synced variables to all other clients.
   - Only the owner can call `RequestSerialization()`, so ensure you call `Networking.SetOwner()` first.
   - An event called `OnDeserialization` is triggered when a network packet is received.

2. **Network Events**:
   - Use `SendCustomNetworkEvent()` to send an event.
   - Specify a string that matches the name of a function taking no arguments; this function will run upon receiving the event.
   - Choose to send the event either to the owner or all clients.

```csharp
// Example of Udonsynced variable
[UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
public class SyncExample : UdonSharpBehaviour
{
    [UdonSynced] private int syncedVariable;

    public void UpdateVariable(int newValue)
    {
        if (Networking.IsOwner(gameObject))
        {
            syncedVariable = newValue;
            RequestSerialization();
        }
    }

    public override void OnDeserialization()
    {
        // Handle deserialized data
    }
}

// Example of Network Event
public class EventExample : UdonSharpBehaviour
{
    public void TriggerEvent()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "HandleEvent");
    }

    public void HandleEvent()
    {
        // Handle the event
    }
}
```

## The Benefits

- **Improved Readability**: Clear guidelines enhance the readability of networking code.
- **Consistency**: Ensures uniformity in how networking tasks are handled across different projects.
- **Efficiency**: Streamlined processes make it easier for developers to implement networking features quickly.

## The Downsides

- **Initial Setup Time**: Establishing and fine-tuning the mental model requires an initial investment of time and resources.
- **Limited Flexibility**: Strict adherence to the model may limit creative solutions to unique problems.

## The Road Not Taken

Alternative approaches such as manual editing or using different networking models were considered but ultimately impossible as we don't run VRChat.

## The Infrequent Use Case

In scenarios where highly specialized or technical networking solutions are required, additional human oversight may be necessary to ensure accuracy and appropriateness.

## In Core and Done by Us

We need to understand how networking models work.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team
- Fire
- MMMaellon

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.

### The byte count(s) of every synced variable type in udon

[Centauri2442 recorded the byte count(s) of every synced variable type in udon](https://vxtwitter.com/Centauri2442/status/1747888817518879039)

| System Type                 | maxByte | minByte | variableType    | Notes                                                                                                                                                                                                |
| --------------------------- | ------- | ------- | --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| System.Boolean              | 2       | 2       | Bool            |                                                                                                                                                                                                      |
| System.Char                 | 2       | 2       | Char            |                                                                                                                                                                                                      |
| System.Byte                 | 2       | 2       | Byte            |                                                                                                                                                                                                      |
| System.SByte                | 2       | 2       | SByte           |                                                                                                                                                                                                      |
| System.Int16                | 4       | 2       | Short           | Swaps every other                                                                                                                                                                                    |
| System.UInt16               | 4       | 2       | UShort          | Swaps every other                                                                                                                                                                                    |
| System.Int32                | 8       | 4       | Int             | Swaps every other                                                                                                                                                                                    |
| System.UInt32               | 8       | 4       | UInt            | Swaps every other                                                                                                                                                                                    |
| System.Int64                | 12      | 8       | Long            | Swaps every other                                                                                                                                                                                    |
| System.UInt64               | 12      | 8       | ULong           | Swaps every other                                                                                                                                                                                    |
| System.Single               | 8       | 4       | Float           | Swaps every other                                                                                                                                                                                    |
| System.Double               | 12      | 8       | Double          | Swaps every other                                                                                                                                                                                    |
| UnityEngine.Vector2         | 8       | 8       | Vector2         |                                                                                                                                                                                                      |
| UnityEngine.Vector3         | 12      | 12      | Vector3         |                                                                                                                                                                                                      |
| UnityEngine.Vector4         | 16      | 16      | Vector4         |                                                                                                                                                                                                      |
| UnityEngine.Quaternion      | 16      | 16      | Quaternion      |                                                                                                                                                                                                      |
| System.String               | 84      | 1       | String          | Null: No serialization \| 84 + 1 byte per character, byte size allocated per for (84, 88, 92, etc)                                                                                                   |
| RVCUInt                     | 8       | 8       | RVCUInt         |                                                                                                                                                                                                      |
| UnityEngine.Color           | 8       | 8       | Color           |                                                                                                                                                                                                      |
| UnityEngine.Color32         | 8       | 8       | Color32         |                                                                                                                                                                                                      |
| System.BooleanArray         | 80      | 80      | BooleanArray    | 80 + array size in increments of 4 as buffer (80, 84, 88, etc) \| Will increase every 4 values (5, 9, 13, etc)                                                                                       |
| System.CharArray            | 80      | 80      | CharArray       | 80 + array size in increments of 4 as buffer (80, 84, 88, etc) \| Will increase every 4 values (5, 9, 13, etc)                                                                                       |
| System.ByteArray            | 80      | 80      | ByteArray       | 80 + array size in increments of 4 as buffer (80, 84, 88, etc) \| Will increase every 4 values (5, 9, 13, etc)                                                                                       |
| System.SByteArray           | 80      | 80      | SByteArray      | 80 + array size in increments of 4 as buffer (80, 84, 88, etc) \| Will increase every 4 values (5, 9, 13, etc)                                                                                       |
| System.Int16Array           | 80      | 80      | ShortArray      | 80 + array size in increments of 4 as buffer (80, 84, 88, etc) \| Will increase every 2 values (3, 5, 7, etc)                                                                                        |
| System.UInt16Array          | 80      | 80      | UShortArray     | 80 + array size in increments of 4 as buffer (80, 84, 88, etc) \| Will increase every 2 values (3, 5, 7, etc)                                                                                        |
| System.Int32Array           | 80      | 80      | IntArray        | 80 + array size \* 4                                                                                                                                                                                 |
| System.UInt32Array          | 80      | 80      | UIntArray       | 80 + array size \* 4                                                                                                                                                                                 |
| System.Int64Array           | 80      | 80      | LongArray       | 80 + array size \* 8                                                                                                                                                                                 |
| System.UInt64Array          | 80      | 80      | ULongArray      | 80 + array size \* 8                                                                                                                                                                                 |
| System.SingleArray          | 80      | 80      | FloatArray      | 80 + array size \* 4                                                                                                                                                                                 |
| System.DoubleArray          | 80      | 80      | DoubleArray     | 80 + array size \* 8                                                                                                                                                                                 |
| UnityEngine.Vector2Array    | 80      | 80      | Vector2Array    | 80 + array size \* 8                                                                                                                                                                                 |
| UnityEngine.Vector3Array    | 80      | 80      | Vector3Array    | 80 + array size \* 12                                                                                                                                                                                |
| UnityEngine.Vector4Array    | 80      | 80      | Vector4Array    | 80 + array size \* 16                                                                                                                                                                                |
| UnityEngine.QuaternionArray | 80      | 80      | QuaternionArray | 80 + array size \* 16                                                                                                                                                                                |
| System.StringArray          | 80      | 80      | StringArray     | 84 + (2, 4, or 8 bytes per character). Size of 0: 84 bytes. Size greater than 0 but with any null values: 0 bytes. Size greater than 0 with all valid strings: 84 + (2, 4, or 8 bytes per character) |
| RVCUStringArray             | 80      | 80      | RVCUStringArray | 84 + (2, 4, or 8 bytes per character). Size of 0: 84 bytes. Size greater than 0 but with any null values: 0 bytes. Size greater than 0 with all valid strings: 84 + (2, 4, or 8 bytes per character) |
| UnityEngine.ColorArray      | 80      | 80      | ColorArray      | 80 + array size \* 16                                                                                                                                                                                |
| UnityEngine.Color32Array    | 80      | 80      | Color32Array    | 80 + array size \* 4                                                                                                                                                                                 |

### Question: How many UdonSharpBehaviour instances can a server have?

**Answer:** In VRChat, which uses UdonSharp for scripting, there isn't a hard limit on the number of `UdonSharpBehaviour` instances a world (or server instance) can have. However, practical limits are imposed by performance considerations. Each `UdonSharpBehaviour` consumes memory and processing power, so the total number you can effectively use will depend on the complexity of your scripts and the capabilities of the hardware running the world. It's essential to optimize your scripts and manage resources efficiently to ensure smooth performance.

### Question: Can UdonSharpBehaviour instances communicate with each other?

**Answer:** Yes, `UdonSharpBehaviour` instances can communicate with each other. Here are some ways they can interact:

- **Custom Network Events:** You can send custom network events (with zero parameters) to trigger actions in other `UdonSharpBehaviour` instances. The receiver won't know who the sender is, and the action will be performed locally on the `UdonSharpBehaviour`'s current frame.
- **Synced Variables:** If you need to send data, it's better to use synced variables rather than mixing them with network events. When these variables get updated, the `OnDeserialization()` method will be called. This is a function in `UdonSharpBehaviour` that you can override to handle any work needed with the updated variables.

### Question: How should I represent the entire state in a networked application?

**Answer:** You typically don't mix network events with synced variables. If you need to send data, just use synced variables. When the variables get updated, `OnDeserialization()` will be called. That's a function in `UdonSharpBehaviour` that you can override. Do all the work needed with the variables in `OnDeserialization`.

### Question: Does using FieldChangeCallbacks affect performance in space and time?

**Answer:** There's an advanced feature called `FieldChangeCallbacks` that allows for code simplification. Basically, create a C# property with a getter and a setter and specify it as the field change callback. The setter will be called in addition to `OnDeserialization` when network updates come in. This helps combine the code for local and remote clients in the setter. This is an advanced code-writing optimization for making your code cleaner. No, it does not affect performance in terms of space and time. `FieldChangeCallbacks` reduces code repetition, thereby simplifying the codebase and making it more maintainable.

### Question: How can the order and exact value changes of three variables affect their interpretation in a networked system?

**Answer:** Assume we calculate the state of the world independently for each frame, without depending on previous frames. This means that while the exact values of the three variables are crucial for determining the current state, the order of changes within the same frame does not affect the final state interpretation at that frame.
