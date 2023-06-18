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
import { Machine, assign } from 'xstate';

interface PrioritiesContext {
  priorities: string[];
}

type PrioritiesEvent =
  | { type: 'SET_PRIORITIES'; priorities: string[] }
  | { type: 'NEXT' }
  | { type: 'PREV' };

const orderedPriorities = [
  'Fast load time globally',
  'Real-time 3D environment rendering and smooth avatar interactions',
  'Low latency for user interactions',
  'Efficient data transfer between clients and servers',
  'IK Points for V-sekai',
  'Investigate ManyBoneIK & mediapipe',
  'Intuitive user interface for new users',
];

const prioritiesMachine = Machine<PrioritiesContext, PrioritiesEvent>({
  id: 'priorities',
  initial: 'loadTime',
  context: {
    priorities: orderedPriorities,
  },
  states: {
    loadTime: {
      on: {
        NEXT: 'rendering',
      },
    },
    rendering: {
      on: {
        PREV: 'loadTime',
        NEXT: 'latency',
      },
    },
    latency: {
      on: {
        PREV: 'rendering',
        NEXT: 'dataTransfer',
      },
    },
    dataTransfer: {
      on: {
        PREV: 'latency',
        NEXT: 'ikPoints',
      },
    },
    ikPoints: {
      on: {
        PREV: 'dataTransfer',
        NEXT: 'investigate',
      },
    },
    investigate: {
      on: {
        PREV: 'ikPoints',
        NEXT: 'userInterface',
      },
    },
    userInterface: {
      on: {
        PREV: 'investigate',
      },
    },
  },
  on: {
    SET_PRIORITIES: {
      actions: assign({
        priorities: (_, event) => event.priorities,
      }),
    },
  },
});

export default prioritiesMachine;

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