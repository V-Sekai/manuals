# Feature Voting System
Election is run with `vote.py` using `StarVote` to determine top features and an averaged vote table for ranking.

Every voter has a .csv file with votes to cast.

To create a new voter, copy and rename tasks.csv in `votes/` folder, then add a `Vote` column in csv and set your voted priority (0-100) for a feature.

New features must be added to `tasks.csv` before casting any vote.

You can run `vote.py` from repository root
```
python3 vote.py
```
