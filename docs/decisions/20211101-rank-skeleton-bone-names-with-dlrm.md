# Rank skeleton bone names with dlrm

- Status: proposed <-- draft | rejected | accepted | deprecated | superseded by -->

## Context and Problem Statement

Improve automatic bone selection

## Describe the proposed option and how it helps to overcome the problem or limitation


Use dlrm to rank bones.


## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Install dlrm.
2. Generate train and test datasets.
   1. First column is whether clicked (value 1) or does not click ad (value 0)
   2. 13 numeric columns
   3. 26 categorical columns
   4. See marthawhite's blog post.
3. Train.
4. Test.
5. Use on cpu.

## Positive Consequences <!-- optional -->

- We can guess the proper name.

## Negative Consequences <!-- optional -->

- Starring at the abyss.

## Option graveyard: <!-- same as above -->

- Option:
  - bpr from Quora
- Rejection Reason:
  - Bpr from Quora is not used in production.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a few lines of code.

## Is there a reason why this should be core and done by us?

We need this to make the quality of life of creators better.

## References <!-- optional -->

- https://github.com/facebookresearch/dlrm
- https://medium.com/@marthawhite_81346/learning-with-the-criteo-tb-dataset-e3ec12d9d77e

## Derivative License

Copyright (c) 2020-2021 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


## Links

- Supersedes [20211031-use-bpr-to-rank-skeleton-bone-names](20211031-use-bpr-to-rank-skeleton-bone-names.md)

