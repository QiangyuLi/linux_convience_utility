#!/bin/bash

# Get the number of CPU cores
NUM_CORES=$(nproc)

echo "Detected CPU Cores: $NUM_CORES"

# Create a temporary Python script to test parallel execution
PYTHON_SCRIPT=$(mktemp --suffix=.py)

cat <<EOF > "$PYTHON_SCRIPT"
from joblib import Parallel, delayed
import os, time

def task(i):
    print(f"Task {i} running on PID {os.getpid()}")
    time.sleep(2)  # Simulate work
    return i

if __name__ == "__main__":
    results = Parallel(n_jobs=$NUM_CORES)(delayed(task)(i) for i in range($NUM_CORES))
    print("Results:", results)
EOF

# Run the Python script in the background
echo "Starting Python script to check parallel execution..."
python3 "$PYTHON_SCRIPT" &

PYTHON_PID=$!

# Monitor CPU and RAM usage for each core
echo "Monitoring system resources while script runs..."
echo "Press Ctrl+C to stop monitoring manually."

while ps -p $PYTHON_PID > /dev/null 2>&1; do
    echo "------ CPU & RAM Usage ------"
    mpstat -P ALL 1 1 | grep -E "CPU|all|[0-9]"  # Show per-core CPU usage
    free -h | grep "Mem"  # Show RAM usage
    sleep 1
done

echo "Python script finished execution."

# Clean up
rm -f "$PYTHON_SCRIPT"

echo "Done."
