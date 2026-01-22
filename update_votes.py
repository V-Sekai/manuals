import csv
import os

# Paths
TASKS_FILE = "roadmap/tasks.csv"
VOTES_FOLDER = "roadmap/votes"

# Load tasks from tasks.csv
def load_tasks():
    tasks = []
    with open(TASKS_FILE, "r", encoding="utf-8") as file:
        reader = csv.reader(file)
        next(reader)  # Skip header
        for row in reader:
            tasks.append(row[1])  # Task name is in the second column
    return tasks

# Update vote files
def update_votes(tasks):
    # Load tasks, their categories, and status from tasks.csv
    task_info = {}
    with open(TASKS_FILE, "r", encoding="utf-8") as tasks_file:
        tasks_reader = csv.reader(tasks_file)
        header = next(tasks_reader)  # Skip header
        # Find column indices dynamically
        try:
            category_idx = header.index("Category")
            task_idx = header.index("Task")
        except ValueError as e:
            print(f"Error: Missing expected column in {TASKS_FILE}: {e}")
            return # Or handle error appropriately

        for row in tasks_reader:
            if len(row) > max(category_idx, task_idx):
                task = row[task_idx]
                category = row[category_idx]
                task_info[task] = {"category": category}
            else:
                print(f"Warning: Skipping malformed row in {TASKS_FILE}: {row}")

    for vote_file in os.listdir(VOTES_FOLDER):
        if vote_file.endswith(".csv"):
            vote_path = os.path.join(VOTES_FOLDER, vote_file)
            with open(vote_path, "r", encoding="utf-8") as file:
                reader = csv.reader(file)
                rows = list(reader)

            # Extract existing tasks and their categories from the vote file
            existing_tasks = {row[1]: row[0] for row in rows[1:]}  # Skip header

            # Find missing tasks (excluding archived ones)
            all_tasks_from_file = set(task_info.keys())
            missing_tasks = [task for task in all_tasks_from_file if task not in existing_tasks]

            # Add missing tasks with a vote of 0, skip if category is missing
            for task in missing_tasks:
                category = task_info[task].get("category")
                if category:  # Skip if category is None
                    rows.append([category, task, 0])

            # Sort rows by Category (desc), then Task (desc)
            header = rows[0]  # Preserve header
            # Filter out any potential rows that might have been added incorrectly before (e.g., with 'Unknown' category if that logic existed previously)
            valid_rows = [row for row in rows[1:] if len(row) == 3 and row[0] and row[1]]
            sorted_rows = [header] + sorted(valid_rows, key=lambda x: (x[0], x[1]), reverse=True)

            # Write back sorted rows
            with open(vote_path, "w", encoding="utf-8") as file:
                writer = csv.writer(file)
                writer.writerows(sorted_rows)

if __name__ == "__main__":
    tasks = load_tasks()
    update_votes(tasks)
    print("Vote files updated with missing tasks set to 0.")