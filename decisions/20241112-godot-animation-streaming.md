# Proposed: Godot Animation streaming

## The Context

Animation streaming is a technique for handling extremely long animations. It involves loading only portions of the animation data as needed, which helps manage memory efficiently and ensures smooth playback without requiring the entire animation to be loaded into memory at once.

## The Problem Statement

We need a system to handle the streaming of long animations in a way that minimizes memory usage and ensures smooth playback. The system should be configurable and handle various animation lengths and complexities.

1. **Character Animations**: In an open-world game, characters may have complex animations such as walking, running, jumping, and interacting with the environment. Animation streaming ensures that only the necessary parts of these animations are loaded, reducing memory usage and improving performance.

2. **Environmental Animations**: Open-world games often feature dynamic environments with animations like trees swaying, water flowing, and weather changes. Streaming these animations helps maintain a seamless experience without overloading the system.

3. **Cutscenes and Cinematics**: Long cutscenes and cinematic sequences can be streamed to avoid loading large animation files simultaneously, ensuring smooth transitions and playback.

4. **NPC Interactions**: Non-player characters (NPCs) in open-world games may have varied and lengthy interaction animations. Streaming these animations allows for more complex and varied NPC behaviours without compromising performance.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

We propose the creation of a resource called `AnimationStreamingData`, which will be a custom binary resource containing animation pages. The process involves:

1. Exporting animation compressed data to `AnimationStreamingData`.
2. Implementing an LRU (Least Recently Used) cache for animation pages, configurable in the project settings (animation page LRU).
3. Loading the first 2/3 seconds of animation as a buffer.
4. Using `WorkerThreadPool` to queue loading resource pages ahead of the playback cursor.
5. Freeing pages after they are no longer needed.

```gdscript
class AnimationStreamingData:
    var pages: RingBuffer = RingBuffer.new()  # Custom type for ring buffer
    var index: Array = []
    var usage: Array = []  # Track usage for LRU

    func _init():
        pass

    func load_index():
        # Load index from binary resource
        # Initialize RingBuffer with appropriate size
        var buffer_size: int = 16  # Example size, adjust as needed
        pages.resize(buffer_size)
        usage.resize(buffer_size)

    func stream_page(page_number: int) -> Dictionary:
        # Stream page data from RingBuffer
        if pages.data_left() > 0:
            var page: Dictionary = pages.read()
            update_usage(page_number)
            return page
        else:
            return null

    func write_page(page_data: Dictionary, page_number: int):
        # Write page data to RingBuffer
        if pages.space_left() < 1:
            # Find and replace the least recently used page
            var lru_index: int = find_lru()
            pages.write_pos = lru_index
        pages.write(page_data)
        update_usage(page_number)

    func update_usage(page_number: int):
        # Update usage list
        for i in range(usage.size()):
            usage[i] += 1
        usage[page_number] = 0

    func find_lru() -> int:
        # Find the least recently used page
        var max_usage: int = -1
        var lru_index: int = -1
        for i in range(usage.size()):
            if usage[i] > max_usage:
                max_usage = usage[i]
                lru_index = i
        return lru_index

class AnimationPlayer:
    var buffer_size: float = 2.0 / 3.0
    var worker_pool: WorkerThreadPool = WorkerThreadPool.new()
    var streaming_data: AnimationStreamingData = AnimationStreamingData.new()

    func _init():
        streaming_data.load_index()

    func play_animation():
        # Load initial buffer
        load_initial_buffer()
        # Stream pages ahead of playback cursor
        stream_pages_ahead()

    func load_initial_buffer():
        # Load the first 2/3 seconds of animation into RingBuffer
        for i in range(buffer_size):
            var page: Dictionary = streaming_data.stream_page(i)
            if page != null:
                streaming_data.write_page(page, i)

    func stream_pages_ahead():
        # Queue loading of pages ahead of playback cursor
        worker_pool.queue_task(func():
            var next_page: Dictionary = streaming_data.stream_page(buffer_size)
            if next_page != null:
                streaming_data.write_page(next_page, buffer_size)
        )

    func free_page(page: Dictionary):
        # Free page after use
        streaming_data.pages.advance_read(1)
```

## The Benefits

- Efficient memory usage by loading only necessary animation data.
- Smooth playback of long animations.
- Configurable settings to suit different project needs.

## The Downsides

- Increased complexity in animation handling.
- Potential latency in loading pages if not appropriately managed.

## The Road Not Taken

An alternative approach could be to load the entire animation into memory, simplifying the implementation but resulting in high memory usage and potential performance issues for long animations.

## The Infrequent Use Case

Handling extremely short animations where streaming might not be necessary.

## In Core and Done by Us

The V-Sekai development team will implement this proposal as part of the core functionality for handling animations in the Godot Engine.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team
- fire
- reduz

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
