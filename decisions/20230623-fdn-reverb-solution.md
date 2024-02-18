# Proposed: Implementing Feedback Delay Networks for Enhanced Audio Reverb Simulation in V-Sekai

## Metadata

- Status: proposed
- Deciders: V-Sekai, ellenhp, fire
- Tags: V-Sekai, ai assisted

## Context and Problem Statement

The problem of simulating audio reverb in Godot Engine 4 involves accurately modeling the way sound waves propagate, reflect, and interact within a given environment. This requires sampling a chaotic 7-dimensional space every frame, either through precomputation or real-time processing. The complexity arises from the fact that sound behaves more like light with intense diffraction, making it impossible to rasterize.

## Proposed Solution

Implement Feedback Delay Networks (FDNs) for artificial reverberation. FDNs consist of multiple delay lines connected in a feedback loop with a mixing matrix. The output is a combination of the input signal and the delayed signals.

### Steps:

1. Choose the number of delay lines and their lengths based on the desired reverberation time and room characteristics.
2. Implement a mixing matrix to control the energy distribution between the delay lines.
3. Create a feedback loop by connecting the outputs of the delay lines to the inputs through the mixing matrix.
4. Combine the input signal with the delayed signals to produce the reverberated output.

## Implementation

```gdscript
class_name FDN
extends Node

var num_delay_lines : int
var delay_lines : Array
var mixing_matrix : Array
var room_characteristics : Dictionary

func _init(num_delay_lines: int, delay_lengths: Array, mixing_matrix: Array, room_characteristics: Dictionary):
    self.num_delay_lines = num_delay_lines
    self.delay_lines = []
    for length in delay_lengths:
        self.delay_lines.append(DelayLine.new(length))
    self.mixing_matrix = mixing_matrix
    self.room_characteristics = room_characteristics

func process(input_signal: float) -> float:
    # Step 1: Calculate the output of each delay line
    var delay_outputs = []
    for dl in self.delay_lines:
        delay_outputs.append(dl.process(input_signal))

    # Step 2: Apply the room characteristics to the delay line outputs
    var processed_outputs = apply_room_characteristics(delay_outputs)

    # Step 3: Apply the mixing matrix to the processed delay line outputs
    var mixed_outputs = apply_mixing_matrix(processed_outputs)

    # Step 4: Update the delay lines with the mixed outputs
    for i in range(self.num_delay_lines):
        self.delay_lines[i].update(mixed_outputs[i])

    # Step 5: Combine the input signal with the delayed signals
    var output_signal = input_signal + sum(mixed_outputs)
    return output_signal

func apply_room_characteristics(delay_outputs: Array) -> Array:
    var processed_outputs = []
    for i in range(len(delay_outputs)):
        processed_output = delay_outputs[i] * room_characteristics["absorption"][i]
        processed_outputs.append(processed_output)
    return processed_outputs

func apply_mixing_matrix(delay_outputs: Array) -> Array:
    # TODO: Implement the mixing matrix application logic
    pass
```

## Positive Consequences

- Improved audio reverb simulation
- More realistic sound propagation and interaction within environments
- Smarter estimation of long reverb times

## Negative Consequences

- Increased computational complexity
- Potential performance impact on real-time processing

## Option graveyard

- Generalized Dijkstra Pathfinding
- DWN (Digital Waveguide Network): A method for simulating audio reverb by modeling sound propagation as waves traveling along waveguides with bidirectional delay lines and scattering junctions.
- Ray tracing can be used to simulate sound propagation in 3D environments. It involves casting rays from the sound source and tracing their paths as they interact with the environment (reflect, refract, and diffract). By calculating the time delay and attenuation of each ray reaching the listener, you can generate an impulse response that represents the acoustic properties of the space.
- Convolution reverb is a technique that uses recorded impulse responses (IRs) of real spaces or digital simulations to recreate the reverberation characteristics of those spaces. The process involves convolving the dry audio signal with the impulse response to produce the reverberated audio.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, implementing FDNs requires a more complex algorithm and cannot be achieved with just a few lines of script.

## Is there a reason why this should be core and done by us?

Yes, as it directly impacts the audio experience within V-Sekai environments, it should be a core feature to ensure consistent and high-quality audio reverb simulation.

## Glossary: Implementing Feedback Delay Networks for Enhanced Audio Reverb Simulation in V-Sekai

- **V-Sekai**: A virtual reality platform that allows users to create and explore immersive environments.
- **Godot Engine 4**: An open-source game engine used for creating 2D and 3D games and interactive applications.
- **Audio Reverb**: The persistence of sound in a particular space after the original sound has stopped, caused by reflections off surfaces within the environment.
- **Feedback Delay Networks (FDNs)**: A method for simulating artificial reverberation using multiple delay lines connected in a feedback loop with a mixing matrix.
- **Delay Line**: A digital signal processing technique that introduces a time delay to an input signal, often used in audio effects such as reverb and echo.
- **Mixing Matrix**: A mathematical construct used to control the energy distribution between the delay lines in an FDN.
- **Room Characteristics**: Acoustic properties of a room or environment, such as absorption, reflection, and diffusion, which affect how sound propagates within the space.
- **Reverberation Time**: The time it takes for the sound level in a room to decrease by 60 decibels after the sound source has stopped.
- **Digital Waveguide Network (DWN)**: An alternative method for simulating audio reverb by modeling sound propagation as waves traveling along waveguides with bidirectional delay lines and scattering junctions.
- **Ray Tracing**: A technique used to simulate sound propagation in 3D environments by casting rays from the sound source and tracing their paths as they interact with the environment (reflect, refract, and diffract).
- **Convolution Reverb**: A technique that uses recorded impulse responses (IRs) of real spaces or digital simulations to recreate the reverberation characteristics of those spaces by convolving the dry audio signal with the impulse response.
- **Impulse Response (IR)**: A recording or simulation of the acoustic properties of a space, used in convolution reverb to recreate the reverberation characteristics of that space.

## Computational and I/O Complexity: An Example

Let's consider an example of implementing a Feedback Delay Network (FDN) for audio reverb simulation with 8 delay lines. We will analyze the computational and I/O complexity involved in this specific case.

### FDN reverb claims may need to be verified

1. For a medium-quality reverb effect, let's consider using 8 delay lines in the FDN.
2. For an 8x8 matrix, there are 64 multiplications and 56 additions required for each sample.
3. Overall, the computational complexity for a medium-quality reverb effect with 8 delay lines is manageable for most modern CPUs and can be efficiently processed in real-time.
4. In summary, implementing a medium-quality reverb effect using an FDN with 8 delay lines has a manageable computational and I/O complexity, making it suitable for real-time processing on most modern hardware.

### Computational Complexity

For a medium-quality reverb effect, let's consider using 8 delay lines in the FDN. The main components contributing to the computational complexity are:

1. **Delay Lines**: Each delay line requires memory for storing the delayed samples and computations for updating the delay buffer. For 8 delay lines, the complexity scales linearly with the number of delay lines.

2. **Matrix Mixing**: The mixing matrix combines the outputs of the delay lines in a specific way to create the desired reverb effect. For an 8x8 matrix, there are 64 multiplications and 56 additions required for each sample.

3. **Feedback and Input/Output Processing**: Additional processing, such as filtering or gain adjustments, may be applied to the input, output, or feedback paths. This complexity depends on the specific filters or processing used but is generally proportional to the number of delay lines.

Overall, the computational complexity for a medium-quality reverb effect with 8 delay lines is manageable for most modern CPUs and can be efficiently processed in real-time.

### I/O Complexity

The I/O complexity refers to the amount of data that needs to be read from and written to memory during the processing of the reverb effect. In the case of an FDN with 8 delay lines, the I/O complexity is mainly determined by:

1. **Reading and Writing Delay Line Buffers**: Each delay line requires reading and writing operations for updating the delay buffer. The I/O complexity scales linearly with the number of delay lines.

2. **Input and Output Audio Data**: The audio input data must be read, processed, and combined with the output of the FDN to generate the final reverberated audio signal. The I/O complexity for input and output audio data is generally low compared to the delay line buffer operations.

In summary, implementing a medium-quality reverb effect using an FDN with 8 delay lines has a manageable computational and I/O complexity, making it suitable for real-time processing on most modern hardware.
