# Superseded: Solve V-Sekai limitations using ChatGPT-4 AI completion.

## Metadata

- Status: superseded by `20230522-proposal-template.md` <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,fire,
- Tags: V-Sekai,ChatGPT-4,AI_assistance,problem solving,proposal generation,Visual Studio Code addon,
 
## Context and Problem Statement

We sometimes need help finding solutions to our issues. ChatGPT-4 artificial intelligence completion can help us solve the entire problem when we only have the start of the solution.

## Describe the problem or limitation you have in your project, e.g., in free form, using two to three sentences. Consider articulating the case in the form of a question.

How can we leverage ChatGPT-4 AI completion to assist in solving problems and completing proposals for V-Sekai?

## Describe the proposed option and how it helps to overcome the problem or limitation

Use ChatGPT-4 AI completion with the Visual Studio Code "Genie" addon to fill in as many sections as possible in a given proposal template, helping to generate complete and well-rounded solutions.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

1. Ensure access to the chatgpt4 API access. There is a waiting list.
1. Copy the proposal template.
2. Fill in as many sections as possible in the proposal template.
3. Use the Visual Studio Code "Genie" addon with ChatGPT-4 AI completion to complete the remaining sections of the proposal.
4. Review and refine the completed proposal.
5. Review with copy editing software if accessible.
6. Record the decisions on GitHub at https://github.com/V-Sekai/manuals.

Example of using ChatGPT-4 AI completion with the proposal template.

```markdown
# Issue: Feature implementation proposal

## Propose a possible solution to solve a V-Sekai limitation. If this doesn't look right, choose a different type.

## Metadata

- Status: proposed <!-- draft | proposed | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai
- Tags: V-Sekai, GPT-4

## Context and Problem Statement

## Proposed Solution

## Implementation

## Positive Consequences

## Negative Consequences

## Option graveyard

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

## Is there a reason why this should be core and done by us?

## References

- [V-Sekai](https://v-sekai.org/)
```

## Positive Consequences

- Improved problem-solving capabilities.
- More complete and well-rounded proposals.
- Faster generation of solutions.

## Negative Consequences

- Potential reliance on AI-generated content, which may only sometimes be accurate or suitable.
- Additional time spent reviewing and refining AI-generated content.

## Option graveyard

Use only human assistance.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement requires integrating ChatGPT-4 AI completion into the development workflow and cannot be achieved with a simple script.

## Is there a reason why this should be core and done by us?

Yes, leveraging AI-generated content can help improve the efficiency and effectiveness of our problem-solving process, leading to better solutions and faster development.

## References
- [V-Sekai](https://v-sekai.org/)
- [Genie addon for Visual Studio Code](https://github.com/ai-genie/chatgpt-vscode)
