% MiniZinc model for roadmap optimization
% This model processes votes and calculates priorities for tasks

% Parameters
int: n_tasks;
int: n_categories;
int: n_voters;
array[1..n_categories] of string: categories;
array[1..n_tasks] of string: task_names;
array[1..n_tasks] of int: task_category;  % Category index for each task
array[1..n_tasks] of int: task_priority;   % Average priority for each task
array[1..n_voters] of string: voter_names;
array[1..n_voters, 1..n_tasks] of int: votes;  % votes[voter][task]

% Variables
array[1..n_tasks] of var int: avg_priority;  % Calculated average priority

% Constraints: Calculate average priority for each task
constraint forall(t in 1..n_tasks) (
    avg_priority[t] = sum(v in 1..n_voters)(votes[v, t]) div n_voters
);

% Helper: count tasks per category
array[1..n_categories] of int: category_count = 
    [sum(t in 1..n_tasks where task_category[t] = c)(1) | c in 1..n_categories];

% Calculate category statistics (computed from parameters, not variables)
array[1..n_categories] of int: category_priority_sum = 
    [sum(t in 1..n_tasks where task_category[t] = c)(task_priority[t]) | c in 1..n_categories];

% Calculate category average priority (computed value from parameters)
array[1..n_categories] of float: category_priority_avg = 
    [int2float(category_priority_sum[c]) / int2float(max(category_count[c], 1)) | c in 1..n_categories];

% Solve: Just satisfy constraints (no optimization needed for basic calculation)
solve satisfy;

% Output
output [
    "=== Roadmap Analysis ===\n",
    "\nTask Priorities (sorted by priority):\n"
] ++
[
    "Task " ++ show(t) ++ ": " ++ task_names[t] ++ 
    " [Category: " ++ categories[task_category[t]] ++ 
    ", Priority: " ++ show(task_priority[t]) ++ "]\n"
    | t in 1..n_tasks
] ++
[
    "\n=== Category Statistics ===\n"
] ++
[
    "Category: " ++ categories[c] ++ 
    " | Total Priority: " ++ show(category_priority_sum[c]) ++
    " | Average Priority: " ++ show_float(2, 2, category_priority_avg[c]) ++ "\n"
    | c in 1..n_categories
] ++
[
    "\n=== Top Priority Tasks ===\n"
] ++
[
    show(t) ++ ". " ++ task_names[t] ++ " (Priority: " ++ show(task_priority[t]) ++ ")\n"
    | t in 1..n_tasks where task_priority[t] >= 50
] ++
[
    "\n=== Vote Summary ===\n",
    "Total Tasks: " ++ show(n_tasks) ++ "\n",
    "Total Voters: " ++ show(n_voters) ++ "\n",
    "Total Categories: " ++ show(n_categories) ++ "\n"
];

