# V-Sekai Roadmap and Goals 2023-06-18

### Metadata

- Status: accepted
- Deciders: V-Sekai, fire, guillefix
- Tags: V-Sekai, chatgpt4 summary,

### Context and Problem Statement

What is the V-Sekai Roadmap and Goals?

### Describe the proposed option and how it helps to overcome the problem or limitation

The roadmap presented here is short-term.

### Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

### Non-goals

To prioritize WAP, NET, and UIUX, we need to avoid working on User Generated Content (UGC) and world building. This allows us to focus on the core aspects of V-Sekai and achieve our goals more efficiently.

### Goals

```typescript
import { createMachine, Guard } from 'xstate';

interface Context {}

type Event =
  | { type: 'LIGHT_ASSETS_AND_ASYNC_LOADING' }
  | { type: 'MODERN_RENDERING_AND_HIGH_PERF_LIBS' }
  | { type: 'APPLY_NETWORK_OPT_AND_LOW_LATENCY_PROT' }
  | { type: 'EFFICIENT_DATA_FORMATS_AND_OPTIMIZED_COMP_ALG' }
  | { type: 'RESPECT_ACCURATE_IK_POINTS' }
  | { type: 'EXPLORE_MULTIPLE_TECH_AND_ALT_SOLUTIONS' };

const notLightAssetsAndAsyncLoading: Guard<Context, Event> = {
  type: 'xstate.guard',
  name: 'notLightAssetsAndAsyncLoading',
  predicate: (context, event) => event.type !== 'LIGHT_ASSETS_AND_ASYNC_LOADING',
};

const notModernRenderingAndHighPerfLibs: Guard<Context, Event> = {
  type: 'xstate.guard',
  name: 'notModernRenderingAndHighPerfLibs',
  predicate: (context, event) => event.type !== 'MODERN_RENDERING_AND_HIGH_PERF_LIBS',
};

const machine = createMachine<Context, Event>({
  id: 'prioritiesMachine',
  initial: 'FTUX',
  states: {
    FTUX: {
      initial: 'loadTime',
      states: {
        loadTime: {
          on: {
            '': [{ target: 'rendering', cond: notLightAssetsAndAsyncLoading }],
            LIGHT_ASSETS_AND_ASYNC_LOADING: { target: 'rendering' },
          },
        },
        rendering: {
          on: {
            '': [
              { target: '#prioritiesMachine.NET.latency', cond: notModernRenderingAndHighPerfLibs },
            ],
            MODERN_RENDERING_AND_HIGH_PERF_LIBS: { target: '#prioritiesMachine.NET.latency' },
          },
        },
      },
    },
    NET: {
      initial: 'latency',
      states: {
        latency: {
          on: { APPLY_NETWORK_OPT_AND_LOW_LATENCY_PROT: { target: 'dataTransfer' } },
        },
        dataTransfer: {
          on: { EFFICIENT_DATA_FORMATS_AND_OPTIMIZED_COMP_ALG: { target: '#prioritiesMachine.WAP.ikPoints' } },
        },
      },
    },
    WAP: {
      initial: 'ikPoints',
      states: {
        ikPoints: {
          on: { RESPECT_ACCURATE_IK_POINTS: { target: 'investigate' } },
        },
        investigate: {
          on: { EXPLORE_MULTIPLE_TECH_AND_ALT_SOLUTIONS: { target: 'userInterface' } },
        },
        userInterface: { type: 'final' },
      },
    },
  },
});
```

### Positive Consequences

We can create V-Sekai easier.

### Negative Consequences

Overhead might be hard.

### Option graveyard

- Implementing a custom voice chat solution instead of using onevoip
- Waiting for Godot Engine 4.2 instead of assisting with 4.1 features

### If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No. This is a process.

### Is there a reason why this should be core and done by us?

This is a core process for V-Sekai.

### References

- [V-Sekai](https://v-sekai.org/)

By avoiding work on User Generated Content (UGC) and world building, we can prioritize the three main states in the roadmap: "World / Avatar Performance" (WAP), "Networking" (NET), and "UI/UX". This allows the team to focus on the core aspects of V-Sekai and achieve the goals more efficiently.