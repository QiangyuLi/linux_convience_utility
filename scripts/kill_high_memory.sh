#!/bin/bash

# Get the top 2 processes using the most memory
top_processes=$(top -b -o +%MEM -n 1 | grep -E '^\s*[0-9]' | head -n 2)

# Extract PIDs of the top processes
pids=$(echo "$top_processes" | awk '{print $1}')

# Kill the processes using the highest memory
for pid in $pids
do
  echo "Killing process with PID: $pid"
  sudo kill -9 $pid
done

echo "High memory processes have been terminated."
