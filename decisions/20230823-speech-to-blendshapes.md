# Proposed: Developing a Unified Model for Speech-to-Facial Shape Generation Using Outlines 〰 Library

## Metadata

- Status: proposed
- Deciders: V-Sekai
- Tags: V-Sekai

## The Backdrop

V-Sekai is embarking on a project that translates speech into corresponding facial shapes for virtual reality applications. This process eliminates the need for a face camera and leverages the `SpeechEncoderDecoderModel` from Hugging Face's Transformers library for comprehensive speech recognition.

The SpeakingFaces dataset, a collection from 142 diverse subjects, will be utilized for this project. The dataset is accessible via the server of the Institute for Smart Systems and Artificial Intelligence (ISSAI) under the Creative Commons Attribution 4.0 International License.

Outlines 〰, a neural text generation library, will also play a crucial role in this project. It offers robust prompting primitives, separates the prompting from the execution logic, and is compatible with all models. It interfaces with models through the next-token logits and can be used with API-based models as well.

## The Challenge

The primary challenge lies in developing a model capable of generating text and blendshapes simultaneously from the same input speech using the Outlines 〰 library.

## The Strategy

The proposed strategy involves creating a custom model that accepts speech as input and outputs both text and blendshapes. This unified model would incorporate a shared encoder to process the speech input, and a single decoder to generate the text and blendshape outputs. The Outlines 〰 library will be used to conform the output to the desired format.

```python
from outlines import Outline
from transformers import SpeechEncoderDecoderModel, Speech2Text2Processor, Wav2Vec2Model
import json

# Initialize the processor and encoder
processor = Speech2Text2Processor.from_pretrained("facebook/s2t-small-librispeech-asr")
encoder = Wav2Vec2Model.from_pretrained("facebook/wav2vec2-base-960h")

# Initialize the decoder
decoder = Speech2Text2Model.from_pretrained("facebook/s2t-small-librispeech-asr")

# Initialize the unified model
model = UnifiedSpeechEncoderDecoderModel(encoder=encoder, decoder=decoder)

# Define an outline for the model
outline = Outline(model).to(device)

# Generate text and blendshapes
generated_text, generated_blendshapes = outline.generate(input_speech)

# Conform to JSON schemaßß
blendshapes_keys = ["BrowInnerUp", "BrowDownLeft", "BrowDownRight", "BrowOuterUpLeft", "BrowOuterUpRight",
                    "EyeLookUpLeft", "EyeLookUpRight", "EyeLookDownLeft", "EyeLookDownRight", "EyeLookInLeft",
                    "EyeLookInRight", "EyeLookOutLeft", "EyeLookOutRight", "EyeBlinkLeft", "EyeBlinkRight",
                    "EyeSquintRight", "EyeSquintLeft", "EyeWideLeft", "EyeWideRight", "CheekPuff",
                    "CheekSquintLeft", "CheekSquintRight", "NoseSneerLeft", "NoseSneerRight", "JawOpen",
                    "JawForward", "JawLeft", "JawRight", "MouthFunnel", "MouthPucker", "MouthLeft",
                    "MouthRight", "MouthRollUpper", "MouthRollLower", "MouthShrugUpper", "MouthShrugLower",
                    "MouthClose", "MouthSmileLeft", "MouthSmileRight", "MouthFrownLeft", "MouthFrownRight",
                    "MouthDimpleLeft", "MouthDimpleRight", "MouthUpperUpLeft", "MouthUpperUpRight",
                    "MouthLowerDownLeft", "MouthLowerDownRight", "MouthPressLeft", "MouthPressRight",
                    "MouthStretchLeft", "MouthStretchRight", "TongueOut"]

output = {
    "text": generated_text,
    "blendshapes": dict(zip(blendshapes_keys, generated_blendshapes))
}

json_output = json.dumps(output)
```

## The Upside

Developing our own unified model for generating both text and blendshapes from speech using the Outlines 〰 library is a strategic move that provides us with greater control and customization to meet our specific needs. It not only deepens our understanding of the model, aiding in troubleshooting and improvements, but also allows us to optimize it for better performance and efficiency.

## The Downside

The limitation of this approach is that the `UnifiedSpeechEncoderDecoderModel`, and `Outline` are placeholders for your actual unified model classes, and outline respectively. You would need to implement these classes yourself, or find pre-trained models that suit your needs.

## The Road Not Taken

Being self-reliant in maintaining and updating our model eliminates dependence on third parties, providing flexibility to make changes as needed. Moreover, it ensures seamless integration with other parts of our system.

## The Infrequent Use Case

While this approach requires more initial effort, the potential for improvement and fine-tuning with our unique data sets makes it worthwhile, leading to superior results in the long run.

## In Core and Done by Us?

Yes, the development and maintenance of the unified model will be done by us.

## Further Reading

- [V-Sekai](https://v-sekai.org/)
- This article is assisted by AI.