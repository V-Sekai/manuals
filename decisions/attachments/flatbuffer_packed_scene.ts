import { Machine, assign } from "xstate";
import * as flatbuffers from "flatbuffers"; // Import FlatBuffers library
import { MySchema } from "./MySchema_generated"; // Import your schema

const sceneMachine = Machine({
  id: "scene",
  initial: "idle",
  context: {
    scene: null,
  },
  states: {
    idle: {
      on: {
        LOAD_SCENE: {
          target: "loadFlatBuffer",
          actions: assign({ scene: (_, event) => event.data }),
        },
      },
    },
    loadFlatBuffer: {
      invoke: {
        src: (context) => {
          // Implement FlatBuffer loading logic here
          const buffer = new flatbuffers.ByteBuffer(context.scene);
          return MySchema.Scene.getRootAsScene(buffer);
        },
        onDone: {
          target: "translateCStructure",
          actions: assign({ scene: (_, event) => event.data }),
        },
        onError: {
          target: "validationError",
        },
      },
    },
    translateCStructure: {
      invoke: {
        src: (context) => {
          // Implement C structure translation to Godot PackedScene using C++ API here
        },
        onDone: {
          target: "final",
        },
        onError: {
          target: "translationError",
        },
      },
    },
    final: {
      type: "final",
    },
    validationError: {
      on: {
        RETRY_VALIDATION: "loadFlatBuffer",
      },
    },
    translationError: {
      on: {
        RETRY_TRANSLATION: "translateCStructure",
      },
    },
  },
});
