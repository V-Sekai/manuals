# Developing Dual-Mode Models for Speech-to-Facial Shape Generation in Virtual Reality Applications

## Metadata

- **Status:** Proposed
- **Deciders:** V-Sekai
- **Tags:** V-Sekai, AI, Speech Recognition, Facial Shape Generation

## The Backdrop

V-Sekai's key task is to translate speech into corresponding facial shapes for virtual reality applications without the need for a face camera. This involves using the `SpeechEncoderDecoderModel` from Hugging Face's Transformers library for end-to-end speech recognition.

We plan to use the SpeakingFaces dataset for this project. The dataset, collected from 142 subjects of various backgrounds, is available through the server of the Institute for Smart Systems and Artificial Intelligence (ISSAI) under Creative Commons Attribution 4.0 International License.

## The Challenge

The challenge lies in developing and maintaining two separate models - one for translating speech into text (debugging phase) and another for generating corresponding facial shapes (release phase). Creating two different instances of `SpeechEncoderDecoderModel` with different decoders can be complex and requires careful implementation.

## The Strategy

Our strategy involves initializing the processor and encoder common to both models, then initializing the text output model and the blend shape output model separately. For the text output model, we can use a decoder-only transformer model like `Speech2Text2`. For the blend shape output model, a custom decoder trained to generate blend shapes from audio input is required. Any speech encoder-only model such as `Wave2Vec2` can be used with these decoders.

## The Upside

This setup allows switching between the two models depending on whether you're in the debugging or release phase. The text output model can be useful for understanding what the model is doing at a high level, while the blend shape output model can be used for the final product.

## The Downside

The downside is that the `BlendShapeDecoder` is a placeholder for your actual blend shape decoder class. You would need to implement this class yourself, or find a pre-trained model that suits your needs.

## The Road Not Taken

An alternative approach could have been to use a single model that can output both text and blend shapes. However, this would likely increase the complexity of the model and make it harder to debug and understand.

## The Infrequent Use Case

In cases where only text output or blend shape output is needed, it may not be necessary to initialize and maintain two separate models.

## In Core and Done by Us?

Creating our own models for debugging and release is a strategic decision that offers us greater control and customization to meet our specific needs. It not only enhances our understanding of the models, aiding in troubleshooting and improvements, but also allows us to optimize them for better performance and efficiency. Being independent in maintaining and updating our models eliminates reliance on third parties, providing flexibility to make changes as needed. Additionally, it ensures seamless integration with other parts of our system. Although this approach requires more initial effort, the potential for improvement and fine-tuning with our unique data sets makes it worthwhile, leading to superior results in the long run.

## Further Reading

- [V-Sekai](https://v-sekai.org/)
- [SpeakingFaces Dataset](https://doi.org/10.48333/smgd-yj77)
- This article is assisted by AI.
