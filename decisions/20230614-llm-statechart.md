# Proposed: Increase variety and quality with generated animation trees

## Metadata

- Status: proposed
- Deciders: V-Sekai
- Tags: V-Sekai, ai assisted

## Context and Problem Statement

Generate an AnimationTrees with blend trees and nested state machines as a startchart json.

## Proposed Solution

Create a script that generates a JSON file representing the AnimationTrees structure, including blend trees and nested state machines. This JSON file can then be used to create the corresponding AnimationTrees in the V-Sekai engine.

## Implementation

1. Define the JSON schema for the AnimationTrees structure.
2. Create a script that reads the existing AnimationTrees data and converts it into the defined JSON format.
3. Implement a function in the V-Sekai engine that reads the generated JSON file and creates the corresponding AnimationTrees.

## Positive Consequences

- Easier management and sharing of AnimationTrees structures.
- Simplified collaboration between developers working on the same project.
- Potential for automation and procedural generation of AnimationTrees.

## Negative Consequences

- Additional development time required to implement the JSON conversion script and the corresponding function in the V-Sekai engine.
- Possible performance overhead when reading and parsing the JSON file.

## Option graveyard

- Manually creating and managing AnimationTrees structures without using a JSON representation.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement aims to simplify the management and sharing of complex AnimationTrees structures, which cannot be easily achieved with just a few lines of script.

## Is there a reason why this should be core and done by us?

Yes, implementing this feature as part of the core V-Sekai engine ensures consistency and compatibility across different projects and developers using the engine.

## References

- [V-Sekai](https://v-sekai.org/)
- [jsonformer](https://github.com/1rgs/jsonformer)
- [integrations/jsonformer_experimental](https://python.langchain.com/en/latest/modules/models/llms/integrations/jsonformer_experimental.html)
