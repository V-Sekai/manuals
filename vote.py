from pathlib import Path
import pandas as pd

import starvote
from starvote import hashed_ballots_tiebreaker
import json
from collections import defaultdict

def get_votes(votes_dir):
    folder_path = Path(votes_dir)
    csv_files = folder_path.glob('*.csv')

    ballot_dict = {}
    for csv_file in csv_files:
        voter = csv_file.stem
        df = pd.read_csv(csv_file)
        if 'Category' in df.columns:
            df.drop(columns='Category', inplace=True)
        ballot = df.set_index('Task')['Vote'].to_dict()
        ballot_dict[voter] = ballot
    return ballot_dict

def get_votes_list(votes_dir):
    ballots_dict = get_votes(votes_dir)
    return ballots_dict.values()

def starvote_election(ballot_list, seats=1):
    results = starvote.election(
        method=starvote.star if seats < 2 else starvote.allocated,
        ballots=ballot_list,
        seats=seats,
        tiebreaker=hashed_ballots_tiebreaker,
        maximum_score=100,
    )
    return results

def generate_avg_table(ballot_list, tasks_path):
    aggregated_values = defaultdict(list)

    all_keys = {key for ballot in ballot_list for key in ballot} # unique keys set

    for ballot in ballot_list:
        for key in all_keys:
            value = ballot.get(key)
            if key in ballot and not isinstance(value, int):
                raise Exception(f"Ballot vote {key} : {value} is not an integer")
            elif not key in ballot: # add 0 value for average calculation
                value = 0
            clamped_value = max(0, min(value, 100)) # 0-100
            aggregated_values[key].append(clamped_value)

    # Compute the average for each key and store in a dictionary
    averages = {key: round(sum(values) / len(values)) for key, values in aggregated_values.items()}
    averages_df = pd.DataFrame(list(averages.items()), columns=["Task", "Priority"])
    averages_df.set_index("Task", drop=False, inplace=True)

    tasks_df = pd.read_csv(tasks_path)
    tasks_df["Priority"] = 0
    tasks_df.set_index("Task", drop=False, inplace=True)

    tasks_df.update(averages_df)
    tasks_df.sort_values(by='Priority', ascending=False, inplace=True)
    tasks_df.reset_index(drop=True, inplace=True)
    return tasks_df

def run_election(votes_dir, seats, tasks_path):
    ballot_list = get_votes_list(votes_dir)
    starvote_winners = starvote_election(ballot_list, seats)
    avg_table = generate_avg_table(ballot_list, tasks_path)
    return {"avg_table": avg_table, "winners": starvote_winners}

def main():
    election_results = run_election('./roadmap/votes', 2, "./roadmap/tasks.csv")
    print("Winners", json.dumps(election_results["winners"], indent=4), sep="\n")
    print("Averaged Votes Table", election_results["avg_table"], sep="\n")

if __name__ == "__main__":
    main()
