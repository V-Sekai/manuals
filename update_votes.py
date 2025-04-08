import csv
import os

# Paths
TASKS_FILE = "roadmap/tasks.csv"
VOTES_FOLDER = "roadmap/votes"

# Load tasks from tasks.csv
def load_tasks():
    tasks = []
    with open(TASKS_FILE, "r") as file:
        reader = csv.reader(file)
        next(reader)  # Skip header
        for row in reader:
            tasks.append(row[1])  # Task name is in the second column
    return tasks

# Update vote files
def update_votes(tasks):
    # Load tasks and their categories from tasks.csv
    task_category_map = {}
    with open(TASKS_FILE, "r") as tasks_file:
        tasks_reader = csv.reader(tasks_file)
        next(tasks_reader)  # Skip header
        for row in tasks_reader:
            task_category_map[row[1]] = row[0]  # Map Task to Category

    for vote_file in os.listdir(VOTES_FOLDER):
        if vote_file.endswith(".csv"):
            vote_path = os.path.join(VOTES_FOLDER, vote_file)
            with open(vote_path, "r") as file:
                reader = csv.reader(file)
                rows = list(reader)

            # Extract existing tasks and their categories from the vote file
            existing_tasks = {row[1]: row[0] for row in rows[1:]}  # Skip header

            # Find missing tasks
            missing_tasks = [task for task in tasks if task not in existing_tasks]

            # Add missing tasks with a vote of 0, skip if category is 'Unknown'
            for task in missing_tasks:
                category = task_category_map.get(task)
                if category:
                    rows.append([category, task, 0])

            # Sort rows by Category (desc), then Task (desc)
            header = rows[0]  # Preserve header
            sorted_rows = [header] + sorted(rows[1:], key=lambda x: (x[0], x[1]), reverse=True)

            # Write back sorted rows
            with open(vote_path, "w") as file:
                writer = csv.writer(file)
                writer.writerows(sorted_rows)

if __name__ == "__main__":
    tasks = load_tasks()
    update_votes(tasks)
    print("Vote files updated with missing tasks set to 0.")