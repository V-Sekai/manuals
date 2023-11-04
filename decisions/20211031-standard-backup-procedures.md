# Proposed: Standard backup procedures

### Context and Problem Statement

Things that aren't backed up get lost.

### Describe the feature / enhancement and how it helps to overcome the problem or limitation

Backup V-Sekai Github organization with V-Sekai-gitm and V-Sekai-github-backup.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, and/or diagrams

Use https://github.com/muhasturk/gitim to backup V-sekai. (tested 7b6e898b7587f61b0c5f00c3ab9862868f94479d )

```
git clone https://github.com/muhasturk/gitim.git
cd gitim
pip install .
cd -
export ACCESS_TOKEN=AAAA
python3 -m gitim -o V-Sekai -d V-Sekai-godot-gitm-`date --iso=date --utc` --ssh --token $ACCESS_TOKEN
```

Use https://github.com/josegonzalez/python-github-backup to backup. (tested 0.40.0)

```bash
pip install github-backup
export ACCESS_TOKEN=AAAA
github-backup V-Sekai --token $ACCESS_TOKEN --organization --output-directory V-Sekai-Backup-`date --iso=date --utc` --incremental --prefer-ssh --lfs --private --fork --private --all
```

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not able to.

### Positive Consequences

- Two backups combined should cover all cases

### Negative Consequences

- github-backup doesn't backup repos that are accessible in the dependencies
- gitm doesn't backup issues

### Is there a reason why this should be core and done by us?

Only we have access to a complete copy of the repo.

### References

- https://github.com/josegonzalez/python-github-backup
- https://github.com/muhasturk/gitim

### Derivative License

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
