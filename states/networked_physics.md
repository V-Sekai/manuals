## Network state machine DRAFT

```ts
import { Machine, assign } from 'xstate';
import { Vector3, Quaternion, Vector3 as Scale } from 'three';

interface Server {
  color: string;
}

interface Player {
  color: string;
  inventory: string[];
}

interface PosePoint {
  position: Vector3;
  rotation: Quaternion;
}

interface Context {
  authority: Server | null;
  ownership: Player | null;
  cdnId: string;
  avatarState: {
    position: Vector3;
    rotation: Quaternion;
    scale: Scale;
    timeDifference: number;
    posePoints: PosePoint[];
    blendShapes: { [key: string]: number };
  };
  errorMessage: string;
}

type Event =
  | { type: 'INTERACT'; player: Player }
  | { type: 'GRAB'; player: Player; itemId: string }
  | { type: 'UPDATE_AVATAR_STATE'; newState: Context['avatarState'] }
  | { type: 'STOP_ACTION' }
  | { type: 'SERVER_AUTHORITY'; server: Server }
  | { type: 'ERROR'; message: string };

const update = (key, value) => assign({ [key]: (_, event) => event[value] });

const grabTransition = {
  actions: [
    update('ownership', 'player'),
    assign({ inventory: (context, event) => [...context.ownership.inventory, event.itemId] }),
  ],
  target: 'owned',
};

const setAuthority = (authorityType) => (context, event) => {
  if (event.type === 'INTERACT') {
    return event.player;
  } else if (event.type === 'SERVER_AUTHORITY') {
    return event.server;
  }
  return context[authorityType];
};

const machine = Machine<Context, Event>({
  id: 'networkedPhysics',
  initial: 'defaultAuthority',
  context: {
    authority: null,
    ownership: null,
    cdnId: '',
    avatarState: {
      position: new Vector3(),
      rotation: new Quaternion(),
      scale: new Scale(1, 1, 1),
      timeDifference: 0,
      posePoints: Array(11).fill({ position: new Vector3(), rotation: new Quaternion() }),
      blendShapes: {},
    },
    errorMessage: '',
  },
  on: {
    UPDATE_AVATAR_STATE: { actions: update('avatarState', 'newState') },
    ERROR: { actions: update('errorMessage', 'message'), target: 'error' },
  },
  states: {
    defaultAuthority: {
      on: {
        INTERACT: {
          actions: update('authority', setAuthority('authority')),
          target: 'activeAuthority',
        },
        GRAB: grabTransition,
        SERVER_AUTHORITY: {
          actions: update('authority', setAuthority('authority')),
          target: 'activeAuthority',
        },
      },
    },
    activeAuthority: {
      on: {
        INTERACT: { actions: update('authority', setAuthority('authority')) },
        STOP_ACTION: { target: 'defaultAuthority' },
        GRAB: grabTransition,
        SERVER_AUTHORITY: {
          actions: update('authority', setAuthority('authority')),
        },
      },
    },
    owned: {
      on: {
        STOP_ACTION: {
          actions: update('ownership', () => null),
          target: 'defaultAuthority',
        },
        SERVER_AUTHORITY: {
          actions: update('authority', setAuthority('authority')),
          target: 'activeAuthority',
        },
      },
    },
    error: {
      on: {
        RESET_ERROR: {
          actions: assign({ errorMessage: '' }),
          target: 'defaultAuthority',
        },
      },
    },
  },
});

export default machine;
```
