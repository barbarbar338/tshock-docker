#!/bin/bash

repoURL="https://api.github.com/repos/Pryaxis/Tshock/commits/heads/general-devel"

# Get the latest commit date from the repo
curl -s $repoURL | jq -r ".commit.author.date" | xargs -I{} date -d {} +%s > commitDate.txt

# Get todays date
today=$(date +%s)

# Get the latest commit date from the file
commitDate=$(cat commitDate.txt)

echo "Today: $today"
echo "Last Commit: $commitDate"

# Check if the last commit was more than 24 hours ago
if [ $((today - commitDate)) -gt 86400 ]; then
    echo "Last commit was more than 24 hours ago"
    exit 0
else
    echo "Last commit was less than 24 hours ago"
    exit 1
fi
