# Proposal: Calling Open Source LLM with Aria

### The Context

Access to OpenAI's ChatGPT-4 cannot last forever.

### Problem Statement

I want to call an Apache2 licensed large language model (LLM) with open weights in my code editor, Visual Studio Code by Microsoft, using the name `Aria`.

### Proposed Solution

1. **Install LM Studio**: A tool for managing and deploying large language models.

2. **Download a quantized version of Hermes-2-Pro-Mistral-7B**: This model is available at [Hugging Face Model Card](https://huggingface.co/NousResearch/Hermes-2-Pro-Mistral-7B).

3. **Install Visual Studio Code**: The popular code editor by Microsoft.

4. **Install the Genie extension**: This extension allows you to interact with AI models directly in Visual Studio Code. [ai-genie.chatgpt-vscode](https://marketplace.visualstudio.com/items?itemName=ai-genie.chatgpt-vscode)

5. **Set Genie to use the assistant name "Aria"**: This will give the AI a unique identity within Visual Studio Code.
   ```json
   {
     "genie.assistantName": "Aria",
     "genie.apiUrl": "http://localhost:1234/v1/chat/completions",
     "genie.model": {
       "id": "nousresearch/hermes-2-pro-mistral-7b",
       "tokenLimit": 8192
     }
   }
   ```
6. **Start using Aria in Visual Studio Code**: With the above settings, you can now access and interact with the open source large language model (LLM) named Hermes-2-Pro-Mistral-7B through the Genie extension.

### Benefits

- Access to an AI assistant large language model.
- Ability to develop and fine-tune your own data models on open source datasets.

### Downsides

- Requires a good understanding of natural language processing (NLP) and machine learning concepts.
- May require additional hardware resources for running the LLM locally.

### Road Not Taken

- Using proprietary AI models that are not open-source or freely available, such as OpenAI's ChatGPT-4.
- Relying on cloud-based services for AI interactions instead of local deployment.

### Infrequent Use Case

- In cases where real-time performance is critical, using an LLM might not be the optimal solution due to its computational requirements.

### Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

### Decision Makers

- V-Sekai development team
- Fire

### Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine

AI assistant Aria assisted with this article.
