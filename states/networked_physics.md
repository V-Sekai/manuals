## Network state machine DRAFT

```ts
import { Machine, assign } from 'xstate';
import { Vector3, Quaternion } from 'three';

interface Context {
  authority: string;
  ownership: string;
  cdnId: string;
  avatarState: {
    position: Vector3;
    rotation: Quaternion;
    timeDifference: number;
  };
  inventory: string[];
}

type Event =
  | { type: 'INTERACT'; playerColor: string }
  | { type: 'GRAB'; playerColor: string; itemId: string }
  | { type: 'UPDATE_AVATAR_STATE'; newState: Context['avatarState'] }
  | { type: 'STOP_ACTION' }
  | { type: 'SERVER_AUTHORITY'; serverColor: string };

const update = (key, value) => assign({ [key]: (_, event) => event[value] });

const grabTransition = {
  actions: [
    update('ownership', 'playerColor'),
    assign({ inventory: (context, event) => [...context.inventory, event.itemId] }),
  ],
  target: 'owned',
};

const validColors = ['white', 'red', 'blue', 'green', 'yellow'];

const machine = Machine<Context, Event>({
  id: 'networkedPhysics',
  initial: 'defaultAuthority',
  context: {
    authority: 'white',
    ownership: '',
    cdnId: '',
    avatarState: {
      position: new Vector3(),
      rotation: new Quaternion(),
      timeDifference: 0,
    },
    inventory: [],
  },
  on: {
    UPDATE_AVATAR_STATE: { actions: update('avatarState', 'newState') },
  },
  states: {
    defaultAuthority: {
      on: {
        INTERACT: {
          cond: (_, event) => validColors.includes(event.playerColor),
          actions: update('authority', 'playerColor'),
          target: 'playerAuthority',
        },
        GRAB: {
          cond: (_, event) => validColors.includes(event.playerColor),
          ...grabTransition,
        },
        SERVER_AUTHORITY: {
          cond: (_, event) => validColors.includes(event.serverColor),
          actions: update('authority', 'serverColor'),
          target: 'serverAuthority',
        },
      },
    },
    playerAuthority: {
      on: {
        INTERACT: { actions: update('authority', 'playerColor') },
        STOP_ACTION: { target: 'defaultAuthority' },
        GRAB: grabTransition,
        SERVER_AUTHORITY: {
          actions: update('authority', 'serverColor'),
          target: 'serverAuthority',
        },
      },
    },
    owned: {
      on: {
        STOP_ACTION: {
          actions: update('ownership', () => ''),
          target: 'defaultAuthority',
        },
        SERVER_AUTHORITY: {
          actions: update('authority', 'serverColor'),
          target: 'serverAuthority',
        },
      },
    },
    serverAuthority: {
      on: {
        INTERACT: { actions: update('authority', 'playerColor'), target: 'playerAuthority' },
        GRAB: grabTransition,
        STOP_ACTION: { target: 'defaultAuthority' },
      },
    },
  },
});

export default machine;
```
