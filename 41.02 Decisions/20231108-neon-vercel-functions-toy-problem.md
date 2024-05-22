# Proposed: Development of a Community Polling Discord Bot Using Vercel and Neon PostgreSQL

## Metadata

- Status: Proposed
- Deciders: V-Sekai Technical Team
- Tags: Discord, Polling, Vercel, Serverless, PostgreSQL, Neon, Reactions, Community Engagement

## The Backdrop

V-Sekai is aiming to boost community engagement by implementing interactive polling through Discord. The objective is to create a polling system where users can vote via reactions, and the results are managed in real-time.

## The Challenge

How can V-Sekai develop a Discord bot that facilitates community polls using message reactions and records the results in a Neon-managed PostgreSQL database in a serverless environment?

## The Strategy

- Construct a Discord bot deployed on Vercel that can post poll messages with emoji reactions for voting.
- Monitor reaction additions and removals on these messages to count votes.
- Integrate with Neon's PostgreSQL database to store and update poll data, ensuring one vote per user.
- Provide real-time feedback and results tallying through the Discord bot.

## The Upside

- Engages the community in decision-making processes with interactive polls.
- Gathers real-time data on community preferences and opinions.
- Demonstrates the real-time data handling capabilities of serverless functions and PostgreSQL databases.

## The Downside

- Additional complexity in reaction event handling and vote deduplication.
- Ensuring database performance under high concurrency during active polls.

## The Road Not Taken

- Using traditional polling methods without leveraging Discord's interactive capabilities.
- Reliance on external polling services that may not integrate seamlessly with Discord or offer real-time updates.

## The Infrequent Use Case

- Detailed analysis of voting patterns over time, which may require complex database queries.

## In Core and Done by Us?

- Yes, the implementation of the Community Polling Discord bot using Neon's PostgreSQL service will be developed and maintained internally as part of V-Sekai's commitment to interactive community engagement.

## Further Reading

- [Discord Bots: An Introduction](https://discord.com/developers/docs/intro)
- [Vercel Serverless Functions](https://vercel.com/docs/serverless-functions/introduction)
- [Neon's PostgreSQL Edge Capabilities](https://neon.tech/docs/introduction/about)

This strategy was formulated with AI assistance.
