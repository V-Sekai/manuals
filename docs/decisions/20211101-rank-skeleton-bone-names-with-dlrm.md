# Rank skeleton bone names with dlrm
* Status: proposed <-- draft | rejected | accepted | deprecated | superseded by -->

## Context and Problem Statement

Improve automatic bone selection

## Describe the proposed option and how it helps to overcome the problem or limitation

Use dlrm to rank bones.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. Install dlrm.
2. Generate training data.
3. Mapping to bone names, attributes and categories.
1. Use a training app create test data.
4. Generate train and test datasets for T-Posed character surfaces
   1. Is the bone mapping correct?
   2. features
      1. X global location in meters
      2. Y global location in meters
      3. Z global location in meters
      4. Octahedral mapped rotation x in meters
      5. Octahedral mapped rotation y in meters
      6. X global scale in meters
      7. Y global scale in meters
      8. Z global scale in meters
      9. Body mass in kilograms
      10. Feminine vs masculine unit-less
      11. Head circumference in meters
      12. Neckline circumference in meters
      13. Left Shoulder circumference in meters
      14. Right Shoulder circumference in meters
      15. Left Elbow circumference in meters
      16. Right Elbow circumference in meters
      17. Left wrist circumference in meters
      18. Right wrist circumference in meters
      19. Waist circumference in meters
      20. Left thigh circumference in meters
      21. Right thigh circumference in meters
      22. Left ankle circumference in meters
      23. Right ankle circumference in meters
   3. categorical features
      1. Corresponding VRM Bone
         1. ???
         2. None
      2. Known Skeleton
         1. VRMC
         2. Mixamo
         3. Other
         4. Unknown
   4. A missing value means the field is empty.
5. Train.
6. Test.
7. Use on cpu and in Godot Engine.
   1. Probability of a click.

## Positive Consequences <!-- optional -->

* We can guess the proper name.
* Useful for the facial mapping problem?

## Negative Consequences <!-- optional -->

* Starring at the abyss.

## Option graveyard: <!-- same as above -->

* Option:
  + bpr from Quora
* Rejection Reason:
  + Bpr from Quora is not used in production.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a few lines of code.

## Is there a reason why this should be core and done by us?

We need this to make the quality of life of creators better.

## References <!-- optional -->

* https://github.com/facebookresearch/dlrm
* https://medium.com/@marthawhite_81346/learning-with-the-criteo-tb-dataset-e3ec12d9d77e
* https://www.kaggle.com/c/criteo-display-ad-challenge/data
* Skeleton pool operator from neural blend shapes.
* https://tailor.fandom.com/wiki/Types_of_measurement
* https://knarkowicz.wordpress.com/2014/04/16/octahedron-normal-vector-encoding/
    

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

* Supersedes [20211031-use-bpr-to-rank-skeleton-bone-names](20211031-use-bpr-to-rank-skeleton-bone-names.md)
