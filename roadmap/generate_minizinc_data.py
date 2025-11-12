#!/usr/bin/env python3
"""
Generate MiniZinc data file from roadmap CSV files.
"""
import csv
from pathlib import Path
from collections import defaultdict

def get_active_tasks(tasks_path):
    """Get active (non-archived) tasks from tasks.csv"""
    active_tasks = []
    with open(tasks_path, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            # Filter out archived tasks (where Archived_on is not null/empty)
            archived_on = row.get('Archived_on', '').strip()
            if not archived_on or archived_on.lower() == 'null':
                active_tasks.append(row)
    return active_tasks

def get_votes(votes_dir):
    """Get votes from all CSV files in votes directory"""
    folder_path = Path(votes_dir)
    csv_files = sorted(folder_path.glob('*.csv'))
    
    ballot_dict = {}
    for csv_file in csv_files:
        voter = csv_file.stem
        ballot = {}
        with open(csv_file, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                task = row.get('Task', '').strip()
                vote_str = row.get('Vote', '0').strip()
                try:
                    vote = int(vote_str)
                    ballot[task] = vote
                except ValueError:
                    ballot[task] = 0
        ballot_dict[voter] = ballot
    return ballot_dict

def calculate_average_priorities(ballot_dict, active_tasks):
    """Calculate average priority for each active task"""
    active_task_names = {task['Task'] for task in active_tasks}
    aggregated_values = defaultdict(list)
    
    # Get all unique task names from ballots
    all_keys = {key for ballot in ballot_dict.values() for key in ballot}
    
    # Only consider active tasks
    all_keys = all_keys & active_task_names
    
    for ballot in ballot_dict.values():
        for key in all_keys:
            value = ballot.get(key, 0)
            # Clamp to 0-100
            clamped_value = max(0, min(value, 100))
            aggregated_values[key].append(clamped_value)
    
    # Calculate averages
    averages = {}
    for key, values in aggregated_values.items():
        avg = round(sum(values) / len(values)) if values else 0
        averages[key] = avg
    
    return averages

def generate_minizinc_data(tasks_path, votes_dir, output_path):
    """Generate MiniZinc data file"""
    # Get active tasks
    active_tasks = get_active_tasks(tasks_path)
    
    # Get votes
    ballot_dict = get_votes(votes_dir)
    
    # Calculate average priorities
    avg_priorities = calculate_average_priorities(ballot_dict, active_tasks)
    
    # Filter active tasks to only those with votes
    active_tasks = [task for task in active_tasks if task['Task'] in avg_priorities.keys()]
    
    # Add priority to each task and sort by priority (descending)
    for task in active_tasks:
        task['Priority'] = avg_priorities[task['Task']]
    active_tasks.sort(key=lambda x: x['Priority'], reverse=True)
    
    # Get unique categories
    categories = sorted(set(task['Category'] for task in active_tasks))
    category_map = {cat: idx + 1 for idx, cat in enumerate(categories)}
    
    # Generate MiniZinc data
    n_tasks = len(active_tasks)
    n_categories = len(categories)
    n_voters = len(ballot_dict)
    
    # Task data
    task_names = [task['Task'] for task in active_tasks]
    task_categories = [category_map[task['Category']] for task in active_tasks]
    task_priorities = [task['Priority'] for task in active_tasks]
    
    # Voter votes matrix
    voter_names = sorted(ballot_dict.keys())
    votes_matrix = []
    for voter in voter_names:
        ballot = ballot_dict[voter]
        votes = [ballot.get(task, 0) for task in task_names]
        votes_matrix.append(votes)
    
    # Write MiniZinc data file
    with open(output_path, 'w') as f:
        f.write(f"% MiniZinc data file for roadmap\n")
        f.write(f"% Generated from {tasks_path} and {votes_dir}\n\n")
        
        f.write(f"n_tasks = {n_tasks};\n")
        f.write(f"n_categories = {n_categories};\n")
        f.write(f"n_voters = {n_voters};\n\n")
        
        # Categories array
        f.write(f"categories = [")
        f.write(", ".join([f'"{cat}"' for cat in categories]))
        f.write("];\n\n")
        
        # Task names
        f.write(f"task_names = [")
        f.write(", ".join([f'"{name}"' for name in task_names]))
        f.write("];\n\n")
        
        # Task categories (1-indexed)
        f.write(f"task_category = [")
        f.write(", ".join(map(str, task_categories)))
        f.write("];\n\n")
        
        # Task priorities (averages)
        f.write(f"task_priority = [")
        f.write(", ".join(map(str, task_priorities)))
        f.write("];\n\n")
        
        # Voter names
        f.write(f"voter_names = [")
        f.write(", ".join([f'"{name}"' for name in voter_names]))
        f.write("];\n\n")
        
        # Votes matrix
        f.write(f"votes = array2d(1..n_voters, 1..n_tasks, [\n")
        for i, votes in enumerate(votes_matrix):
            f.write("  ")
            f.write(", ".join(map(str, votes)))
            if i < len(votes_matrix) - 1:
                f.write(",")
            f.write("\n")
        f.write("]);\n\n")
        
        # Summary statistics
        f.write(f"% Summary:\n")
        f.write(f"% Total active tasks: {n_tasks}\n")
        f.write(f"% Total categories: {n_categories}\n")
        f.write(f"% Total voters: {n_voters}\n")
        f.write(f"% Average priority range: {min(task_priorities)} - {max(task_priorities)}\n")
    
    print(f"Generated MiniZinc data file: {output_path}")
    print(f"  Tasks: {n_tasks}")
    print(f"  Categories: {n_categories}")
    print(f"  Voters: {n_voters}")
    
    return output_path

if __name__ == "__main__":
    import os
    # Support both running from root and from roadmap directory
    if os.path.exists("./tasks.csv"):
        tasks_path = "./tasks.csv"
        votes_dir = "./votes"
        output_path = "./roadmap_data.dzn"
    else:
        tasks_path = "./roadmap/tasks.csv"
        votes_dir = "./roadmap/votes"
        output_path = "./roadmap/roadmap_data.dzn"
    
    generate_minizinc_data(tasks_path, votes_dir, output_path)

