#!/bin/bash

# Show all screen sessions
echo "Listing all screen sessions:"
screen -ls

# Confirm before deleting
read -p "Are you sure you want to delete all screen sessions? (y/N): " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Operation canceled."
    exit 1
fi

# Kill all screen sessions
echo "Terminating all screen sessions..."
screen -ls | grep -o '[0-9]*\.' | sed 's/\.//' | xargs -I {} screen -X -S {} quit

echo "All screen sessions terminated."
