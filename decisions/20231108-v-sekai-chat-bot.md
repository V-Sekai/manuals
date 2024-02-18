# Proposed: Creation of an 'Ask V-Sekai' Chatbot Using Vercel, OpenAI, and Neon PostgreSQL

## Metadata

- Status: Proposed
- Deciders: V-Sekai Development Team
- Tags: V-Sekai, Chatbot, Vercel, OpenAI, Neon, PostgreSQL, AI, Serverless

## The Backdrop

V-Sekai aims to provide immediate, AI-driven answers to community queries using a chatbot integrated with Discord.

## The Challenge

How to develop an 'Ask V-Sekai' chatbot that utilizes Vercel serverless functions for interaction, OpenAI for natural language understanding, and Neon PostgreSQL for storing and retrieving knowledge?

## The Strategy

- Design and deploy a serverless function on Vercel that interfaces with Discord to receive questions.
- Use OpenAI's API to process natural language queries and generate responses.
- Store and retrieve chatbot training and interaction data using Neon's PostgreSQL service, leveraging the `pgvector` extension for efficient similarity analysis.
- Continuously improve the chatbot's accuracy and response quality through data analytics and model fine-tuning.

## The Upside

- Quick, accurate responses to user inquiries, enhancing the V-Sekai community experience.
- Leverage cutting-edge AI and serverless technologies for a scalable, low-overhead solution.
- Gather valuable interaction data to refine the chatbot and community support strategies.

## The Downside

- Initial complexity in setting up the integration between Vercel, OpenAI, and Neon PostgreSQL.
- Ongoing maintenance and potential costs associated with OpenAI API usage.

## The Road Not Taken

- Traditional FAQ systems that do not offer real-time, AI-driven interaction and learning capabilities.

## The Infrequent Use Case

- Complex queries that require human intervention and are not yet within the scope of the AI's training.

## In Core and Done by Us?

- The development, deployment, and maintenance of the 'Ask V-Sekai' chatbot will be managed internally as a strategic tool for community engagement.

## Further Reading

- [Vercel Serverless Functions Documentation](https://vercel.com/docs/serverless-functions/introduction)
- [OpenAI API Documentation](https://beta.openai.com/docs/)
- [Neon Tech Blog on Building an AI ChatBot](https://neon.tech/blog/building-an-ai-powered-chatbot-using-vercel-openai-and-postgres)
- [Ask Neon](https://github.com/neondatabase/ask-neon.git)
  This strategy was formulated with AI assistance.
