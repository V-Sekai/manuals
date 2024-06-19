# Proposed: Procedure to unmerge and then merge solves a V-Sekai source code broken tree

## Metadata

- Status: proposed
- Deciders: V-Sekai
- Tags: V-Sekai

## The Backdrop

The V-Sekai source code tree has been broken due to an unsuccessful merge. This has resulted in a halt in the development process, causing delays in project timelines.

## The Challenge

The main challenge is to unmerge the broken tree and then successfully merge it again. This requires careful analysis of the code and understanding the root cause of the initial failed merge.

## The Strategy

We use a tool called Git Assembly which makes reapplying branches on master easy. Here's the strategy:

1. Identify the commit hash where the merge went wrong.
2. Remove the item from the Git Assembler.
3. Analyze the code and identify the conflicts that caused the merge to fail.
4. Resolve the conflicts manually.
5. Fix the branch.
6. Reapply the branch on master using Git Assembly.

## The Upside

By following this strategy, we can potentially fix the broken source code tree without losing any significant work. This will allow us to resume the development process and meet our project deadlines.

## The Downside

The process of unmerging and merging can be time-consuming and complex. If not done correctly, it may lead to further issues in the codebase.

## The Road Not Taken

An alternative approach could have been to abandon the current branch and start a new one from the last known good state. However, this would mean losing all the changes made after the last good state.

## The Infrequent Use Case

This procedure is not commonly used as merges usually go smoothly. It's only needed when a merge results in a broken source code tree.

## In Core and Done by Us?

Yes, this procedure is core to our operations and is performed by our team.

## Further Reading

- [V-Sekai](https://v-sekai.org/)
- This article is assisted by AI.
