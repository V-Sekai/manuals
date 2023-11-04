# Proposed: Large language model t5 generating xstate json reliabily for digital beings

## Metadata

- Status: proposed
- Deciders: V-Sekai
- Tags: V-Sekai

## Context and Problem Statement

V-Sekai is facing a limitation that requires a solution to convert natural language text into XState JSON format for executing behavior statecharts for digital beings. This can be achieved by using the T5 (Text-to-Text Transfer Transformer) model with JSON-former for XState in Godot Engine 4.0.

## Proposed Solution

The proposed solution involves using the T5 model to generate text based on input text and then converting the generated text into XState JSON format, all within the Godot Engine 4.0 environment.

## Implementation

To use T5 (Text-to-Text Transfer Transformer) with JSON-former for XState in Godot Engine 4.0, you'll need to follow these steps:

1. **Load the necessary libraries**

```gd
var transformers = preload("res://path/to/transformers.gd")
var torch = preload("res://path/to/torch.gd")
```

2. **Load the T5 model and tokenizer**

```gd
var model_name = "t5-small"
var tokenizer = transformers.load_T5Tokenizer(model_name)
var model = transformers.load_T5ForConditionalGeneration(model_name)
```

3. **Create a function to generate text using T5**

```gd
func generate_text(input_text: String) -> String:
    var input_ids = tokenizer.encode(input_text)
    var outputs = model.generate(input_ids)
    var generated_text = tokenizer.decode(outputs[0])
    return generated_text
```

4. **Create a function to replace placeholders in T5 output**

```gd
func replace_placeholders(text: String) -> String:
    var formatted_text = text.replace("<extra_id_0>", "event").replace("<extra_id_1>", "state")
    return formatted_text
```

5. **Create a function to parse JSON from formatted text**

```gd
func parse_JSON(formatted_text: String) -> Dictionary:
    var json_object = JSON.parse(formatted_text).result
    return json_object
```

6. **Create a function to convert T5 output to XState JSON format**

```gd
func t5_to_jsonformer_xstate(text: String) -> Dictionary:
    var formatted_text = replace_placeholders(text)
    var json_object = parse_JSON(formatted_text)
    return json_object
```

7. **Use the functions to generate XState JSON**

```gd
func _ready():
    var input_text = "your input text here"
    var t5_output = generate_text(input_text)
    var xstate_json = t5_to_jsonformer_xstate(t5_output)
    print(xstate_json)
```

This will give you the XState JSON format for the given input text. Note that the T5 model might need to be fine-tuned on a dataset specific to your use case to generate accurate XState JSON representations.

## Positive Consequences

- Automates the process of converting natural language text into XState JSON format within the Godot Engine 4.0 environment.
- Reduces manual effort and potential errors in creating XState JSON representations.

## Negative Consequences

- The T5 model may require fine-tuning on a specific dataset to generate accurate XState JSON representations.
- There might be limitations in understanding complex or ambiguous input text.

## Option graveyard

Here are some option graveyard items for the proposal:

1. **Using rule-based natural language processing (NLP) techniques**

   - Pros:
     - Easier to implement and understand.
     - No need for training data or fine-tuning.
   - Cons:
     - Limited in handling complex or ambiguous input text.
     - Requires manual updates to rules as new use cases emerge.

2. **Using other pre-trained NLP models (e.g., GPT-3, BERT)**

   - Pros:
     - Can leverage existing state-of-the-art NLP models.
     - May provide better performance on certain tasks.
   - Cons:
     - May require additional fine-tuning or adaptation for the specific task.
     - Some models may have higher computational requirements or costs.

3. **Creating a custom NLP model from scratch**

   - Pros:
     - Tailored specifically for the task of converting natural language text into XState JSON format.
     - Potential for better performance if designed well.
   - Cons:
     - Requires significant time and effort to develop, train, and maintain.
     - May not perform as well as existing state-of-the-art models.

4. **Using an external API or service for natural language understanding**

   - Pros:
     - Offloads the complexity of NLP to an external service.
     - Can potentially leverage more advanced NLP techniques.
   - Cons:
     - Introduces dependency on an external service.
     - May incur additional costs or usage limitations.

These options were considered but ultimately discarded in favor of using the T5 model with JSON-former for XState in Godot Engine 4.0 due to its balance of performance, ease of implementation, and adaptability to the specific task.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

The proposed solution requires more than a few lines of script and involves using a pre-trained model (T5) to generate the desired output within the Godot Engine 4.0 environment.

## Is there a reason why this should be core and done by us?

Implementing this solution as part of the core functionality can help V-Sekai users automate the process of generating XState JSON representations from natural language text within the Godot Engine 4.0 environment, improving efficiency and reducing manual effort.

## References

- [V-Sekai](https://v-sekai.org/)
- [Godot Engine](https://godotengine.org/)
- [GDScript documentation](https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/gdscript_basics.html)
- [T5 (Text-to-Text Transfer Transformer)](https://arxiv.org/abs/1910.10683)
- [Transformers library](https://huggingface.co/transformers/)
- [XState documentation](https://xstate.js.org/docs/)
