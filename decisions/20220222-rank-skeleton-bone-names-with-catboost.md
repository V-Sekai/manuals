# Accepted: Rank skeleton #bone names with catboost

- Status: accepted <!-- draft | rejected | accepted | deprecated | superseded by -->

## Context and Problem Statement

Improve automatic #bone selection

## Describe the proposed option and how it helps to overcome the problem or limitation

Use catboost to rank bones.

1. Compile catboost as a library
2. `ya make -r catboost/libs/model_interface/static`

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1.  Install catboost
2.  Generate training data.
3.  Mapping to #bone names, attributes and categories.
4.  Use a training app create test data.
5.  Generate train and test datasets for T-Posed character surfaces
6.  Example: CSV.
7.  `Label,Feature: #bone X global location in meters,Feature: #bone Y global location in meters,Feature: #bone Z global location in meters,Feature: #bone truncated normalized basis axis x 0,Feature: #bone truncated normalized basis axis x 1,Feature: #bone truncated normalized basis axis x 2,Feature: #bone truncated normalized basis axis y 0,Feature: #bone truncated normalized basis axis y 1,Feature: #bone truncated normalized basis axis y 2,Feature: #bone X global scale in meters,Feature: #bone Y global scale in meters,Feature: #bone Z global scale in meters,Feature: #bone Parent X global location in meters,Feature: #bone Parent Y global location in meters,Feature: #bone Parent Z global location in meters,Feature: #bone Parent truncated normalized basis axis x 0,Feature: #bone Parent truncated normalized basis axis x 1,Feature: #bone Parent truncated normalized basis axis x 2,Feature: #bone Parent truncated normalized basis axis y 0,Feature: #bone Parent truncated normalized basis axis y 1,Feature: #bone Parent truncated normalized basis axis y 2,Feature: #bone Parent X global scale in meters,Feature: #bone Parent Y global scale in meters,Feature: #bone Parent Z global scale in meters,Feature: Masculine (-1.0) and feminine (1.0),Feature: Body mass in kilograms,Feature: Head circumference in meters,Feature: Neckline circumference in meters,Feature: Left Shoulder circumference in meters,Feature: Right Shoulder circumference in meters,Feature: Left Elbow circumference in meters,Feature: Right Elbow circumference in meters,Feature: Left wrist circumference in meters,Feature: Right wrist circumference in meters,Feature: Waist circumference in meters,Feature: Left thigh circumference in meters,Feature: Right thigh circumference in meters,Feature: Left ankle circumference in meters,Feature: Right ankle circumference in meters,Feature: Animation Time,Category: Corresponding VRM Bone,Category: Title,Category: Author,Category: Specification Version,Category: Animation 1,0,0,0,1,0,0,0,1,0,1,1,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,,AvatarSample_A,VRoid,,T-Pose`
8.  A missing value means the field is empty.
9.  Train.
10. Test.
11. Use on cpu and in Godot Engine.
12. Probability of a click.

## Positive Consequences <!-- optional -->

- We can guess the proper name.
- Useful for the facial mapping problem?
- Useful for the character generator slider recommendation problem?
- Generate test data by moving the character
- Inference requires only single pose inputs.

## Negative Consequences <!-- optional -->

- Starring at the abyss.
- Needs to be have a smaller library size. Not almost 200 mb.

## Option graveyard: <!-- same as above -->

- Option:
  - bpr from Quora
- Rejection Reason:

  - Bpr from Quora is not used in production.

- Option:
  - dlrm from facebook
- Rejection Reason:
  - Too difficult to run

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a few lines of code.

## Is there a reason why this should be core and done by us?

We need this to make the quality of life of creators better.

## References <!-- optional -->

- https://github.com/facebookresearch/dlrm
- https://medium.com/@marthawhite_81346/learning-with-the-criteo-tb-dataset-e3ec12d9d77e
- https://www.kaggle.com/c/criteo-display-ad-challenge/data
- Skeleton pool operator from neural blend shapes.
- https://tailor.fandom.com/wiki/Types_of_measurement
- https://knarkowicz.wordpress.com/2014/04/16/octahedron-normal-vector-encoding/
- https://www.kaggle.com/egordm/deep-learning-recommendation-model-dlrm

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
