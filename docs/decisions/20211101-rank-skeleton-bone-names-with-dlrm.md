# Rank skeleton bone names with dlrm

- Status: proposed <-- draft | rejected | accepted | deprecated | superseded by -->

## Context and Problem Statement

Improve automatic bone selection

## Describe the proposed option and how it helps to overcome the problem or limitation


Use dlrm to rank bones.


## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Install dlrm.
2. Generate training data.
3. Mapping to bone names, attributes and categories.
1. Use a training app create test data.
4. Generate train and test datasets.
   1. Is the bone mapping correct?
   2. features
      1. X location
      2. Y location
      3. Z location
      4. Octahedral mapped rotation x
      5. Octahedral mapped rotation y
      6. X scale
      7. Y scale
      8. Z scale
   3. categorical features
      1. Corresponding VRM Bone
      2. Skeleton Pool (deep-motion-editing by kfiraberman, PeizhuoLi and HalfSummer11)
      3. Known Skeleton
         1. VRMC
         2. Mixamo
         3. Other
   4. A missing value means the field is empty.
5. Train.
6. Test.
7. Use on cpu and in Godot Engine.
   1. Probability of a click.

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
- https://www.kaggle.com/c/criteo-display-ad-challenge/data
- Skeleton pool operator from neural blend shapes.
    ```
    @article{li2021learning,
    author = {Li, Peizhuo and Aberman, Kfir and Hanocka, Rana and Liu, Libin and Sorkine-Hornung, Olga and Chen, Baoquan},
    title = {Learning Skeletal Articulations with Neural Blend Shapes},
    journal = {ACM Transactions on Graphics (TOG)},
    volume = {40},
    number = {4},
    pages = {1},
    year = {2021},
    publisher = {ACM}
    }
    ```

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

