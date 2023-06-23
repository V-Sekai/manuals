# Implementing Feedback Delay Networks for Enhanced Audio Reverb Simulation in V-Sekai

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

* Generalized Dijkstra Pathfinding
* DWN (Digital Waveguide Network): A method for simulating audio reverb by modeling sound propagation as waves traveling along waveguides with bidirectional delay lines and scattering junctions.
* Ray tracing can be used to simulate sound propagation in 3D environments. It involves casting rays from the sound source and tracing their paths as they interact with the environment (reflect, refract, and diffract). By calculating the time delay and attenuation of each ray reaching the listener, you can generate an impulse response that represents the acoustic properties of the space.
* Convolution reverb is a technique that uses recorded impulse responses (IRs) of real spaces or digital simulations to recreate the reverberation characteristics of those spaces. The process involves convolving the dry audio signal with the impulse response to produce the reverberated audio.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, implementing FDNs requires a more complex algorithm and cannot be achieved with just a few lines of script.

## Is there a reason why this should be core and done by us?

Yes, as it directly impacts the audio experience within V-Sekai environments, it should be a core feature to ensure consistent and high-quality audio reverb simulation.