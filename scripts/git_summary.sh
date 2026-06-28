#!/bin/bash

# 1. Accept one argument, default to current directory if empty
TARGET_DIR="${1:-.}"

# 2. Check if the path contains a .git folder
if [ ! -d "$TARGET_DIR/.git" ]; then
    echo "Error: '$TARGET_DIR' is not a valid Git repository."
    exit 1
fi

# Move into the repository directory safely
cd "$TARGET_DIR" || exit 1

# 3. Gather and print repository details
echo "========================================"
echo "            GIT SUMMARY                 "
echo "========================================"

echo "Current Branch:"
git branch --show-current
echo ""

echo "Last 5 Commit Messages:"
git log --oneline -5
echo ""

# Count the lines from git status --short to get uncommitted changes
uncommitted_count=$(git status --short | wc -l)
echo "Number of Uncommitted Changes: $uncommitted_count"
echo "----------------------------------------"

# 4. Print Done
echo "Done."
