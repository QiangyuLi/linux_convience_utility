# Linux Convenience Utility

This repository contains a collection of utility scripts for Linux systems designed to simplify common administrative tasks. One of the utilities is a script that identifies and kills the top memory-consuming processes on your system.

## Scripts

### `kill_high_memory.sh`

This script, located in the `scripts/` folder, automatically identifies the processes consuming the most memory and kills them.

#### Features:
- Identifies the top memory-consuming processes.
- Kills the processes that are using the most memory.
- Helps in freeing up system resources quickly.

#### Usage:
1. Clone or download this repository:
   ```bash
   git clone https://github.com/yourusername/linux_convience_utility.git
   cd linux_convience_utility
   ```

2. Make the script executable:
   ```bash
   chmod +x scripts/kill_high_memory.sh
   ```

3. Run the script with root privileges:
   ```bash
   sudo ./scripts/kill_high_memory.sh
   ```

### `check_parallel.sh`

This script tests whether Python's `joblib` parallel execution is truly utilizing multiple CPU cores. It also monitors CPU and RAM usage during execution.

#### Features:
- Detects the number of available CPU cores automatically.
- Runs a Python script using `joblib`'s `Parallel` and `delayed` functions.
- Monitors CPU usage per core and RAM consumption while the script is running.

#### Prerequisites
Make sure you have the following installed:

- **Python 3** (Check with `python3 --version`)
- **sysstat** (for `mpstat` command)

### Install `sysstat`:
#### Ubuntu/Debian:
```bash
sudo apt update && sudo apt install sysstat -y
```
#### Fedora:
```bash
sudo dnf install sysstat -y
```
#### Arch Linux:
```bash
sudo pacman -S sysstat
```
#### RHEL/CentOS:
```bash
sudo yum install sysstat -y
```

After installation, enable and start the `sysstat` service:
```bash
sudo systemctl enable sysstat
sudo systemctl start sysstat
```

#### Usage
1. Make the script executable:
```bash
chmod +x check_parallel.sh
```

2. Run the script:
```bash
./check_parallel.sh
```

#### Expected Output
- The number of detected CPU cores.
- Messages from Python showing which process ID (PID) is executing each task.
- Real-time CPU and RAM usage updates.

### `clear_screen_sessions.sh`

This script identifies and terminates all active GNU Screen sessions, freeing up system resources.

#### Features:
- Lists all active screen sessions.
- Terminates all detected screen sessions after confirmation.
- Useful for managing multiple screen instances.

#### Usage:
1. Make the script executable:
   ```bash
   chmod +x scripts/clear_screen_sessions.sh
   ```

2. Run the script:
   ```bash
   ./scripts/clear_screen_sessions.sh
   ```

## Notes
- If `mpstat` is missing, install `sysstat` as described above.
- You can manually monitor CPU usage with `htop` or `top` if needed.

## License
This project is open-source and licensed under the MIT License.

