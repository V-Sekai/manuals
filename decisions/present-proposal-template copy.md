# Proposed: Efficient Training of LLMs in V-Sekai

## Metadata

- Status: Proposed
- Deciders: V-Sekai
- Tags: V-Sekai, LLM, Training

## Context

Given the limited resources available to V-Sekai, it is crucial to optimize the training time for Language Learning Models (LLMs) like Aria assistant.

## Problem

The challenge lies in efficiently training these models within a constrained timeframe - ideally not exceeding one day.

## Solution

To expedite the training process, we propose the following adjustments to Ludwig:

1. Set `trainable=false` to make training over 50x faster.
2. Enable Automatic Mixed Precision (AMP) training, which is available when both `trainable=true` and `trainable=false`.
3. Implement approximate training set evaluation (`evaluate_training_set=false`). This computes the reported training set metrics at the end of each epoch as a running aggregation of the metrics during training, rather than a separate pass over the training set at the end of each epoch of training. Although this may result in "noisy" metrics in the early epochs, it generally leads to a 33% speedup in training time.

## Pros and Cons

**Pros:**

- Significantly reduces training time.
- Allows for more efficient use of resources.

**Cons:**

- Early training metrics may appear "noisy".

## Alternatives

This section will be updated with potential alternatives if the proposed solution does not yield the expected results.

## Rare Use Cases

This section will be updated with infrequent use cases that may arise during the implementation of the proposed solution.

## Implementation

Is this solution core to our operations and will it be implemented by us? This section will be updated accordingly.

## References

1. [V-Sekai · GitHub](https://github.com/v-sekai)
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game)
3. [LLM Classification - Ludwig](https://ludwig.ai/latest/examples/llms/llm_classification/)

_This proposal was assisted by Aria, an AI assistant._
