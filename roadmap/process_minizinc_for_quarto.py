#!/usr/bin/env python3
"""
Process MiniZinc output and generate data structures compatible with roadmap.qmd
This script reads MiniZinc output and creates a format similar to vote.py results
"""
import json
import csv
import sys
import re
from pathlib import Path
from collections import defaultdict

def parse_minizinc_output(output_file):
    """Parse MiniZinc output and extract structured data"""
    with open(output_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    results = {
        'tasks': [],
        'categories': {},
        'summary': {},
        'winners': []  # Top priority tasks
    }
    
    # Parse task priorities
    task_pattern = r'Task (\d+): (.+?) \[Category: (.+?), Priority: (\d+)\]'
    for match in re.finditer(task_pattern, content):
        task_num = int(match.group(1))
        task_name = match.group(2)
        category = match.group(3)
        priority = int(match.group(4))
        
        results['tasks'].append({
            'number': task_num,
            'name': task_name,
            'category': category,
            'priority': priority
        })
    
    # Parse category statistics
    category_pattern = r'Category: (.+?) \| Total Priority: (\d+) \| Average Priority: ([\d.]+)'
    for match in re.finditer(category_pattern, content):
        category = match.group(1)
        total_priority = int(match.group(2))
        avg_priority = float(match.group(3))
        
        results['categories'][category] = {
            'total_priority': total_priority,
            'average_priority': avg_priority
        }
    
    # Parse summary
    summary_patterns = {
        'total_tasks': r'Total Tasks: (\d+)',
        'total_voters': r'Total Voters: (\d+)',
        'total_categories': r'Total Categories: (\d+)'
    }
    
    for key, pattern in summary_patterns.items():
        match = re.search(pattern, content)
        if match:
            results['summary'][key] = int(match.group(1))
    
    # Sort tasks by priority (descending)
    results['tasks'].sort(key=lambda x: x['priority'], reverse=True)
    
    # Identify winners (top priority tasks, e.g., priority >= 50 or top N)
    # For now, use top priority task or tasks with priority >= 50
    if results['tasks']:
        max_priority = results['tasks'][0]['priority']
        results['winners'] = [t['name'] for t in results['tasks'] 
                             if t['priority'] >= max(max_priority * 0.8, 50)]
    
    return results

def load_tasks_csv(tasks_path):
    """Load tasks from CSV to get Notes and Archived_on"""
    tasks_dict = {}
    with open(tasks_path, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            task_name = row['Task']
            tasks_dict[task_name] = {
                'Category': row['Category'],
                'Archived_on': row.get('Archived_on', '').strip(),
                'Notes': row.get('Notes', '').strip()
            }
    return tasks_dict

def create_avg_table(minizinc_results, tasks_dict):
    """Create average table similar to vote.py format"""
    rows = []
    for task in minizinc_results['tasks']:
        task_name = task['name']
        if task_name in tasks_dict:
            task_info = tasks_dict[task_name]
            # Only include non-archived tasks
            archived_on = task_info.get('Archived_on', '').strip()
            if not archived_on or archived_on.lower() == 'null':
                rows.append({
                    'Category': task_info['Category'],
                    'Task': task_name,
                    'Priority': task['priority'],
                    'Notes': task_info.get('Notes', ''),
                    'Archived_on': None
                })
    
    return rows

def main():
    if len(sys.argv) < 3:
        print("Usage: process_minizinc_for_quarto.py <minizinc_output.txt> <tasks.csv>", file=sys.stderr)
        sys.exit(1)
    
    output_file = sys.argv[1]
    tasks_csv = sys.argv[2]
    
    # Parse MiniZinc output
    minizinc_results = parse_minizinc_output(output_file)
    
    # Load tasks CSV
    tasks_dict = load_tasks_csv(tasks_csv)
    
    # Create average table
    avg_table = create_avg_table(minizinc_results, tasks_dict)
    
    # Output as JSON for Python to consume
    result = {
        'avg_table': avg_table,
        'winners': minizinc_results['winners'],
        'categories': minizinc_results['categories'],
        'summary': minizinc_results['summary']
    }
    
    print(json.dumps(result, indent=2))

if __name__ == "__main__":
    main()

