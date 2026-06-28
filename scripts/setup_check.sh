#!/bin/bash

echo "========================================"
echo "         SYSTEM SETUP CHECK             "
echo "========================================"

echo "Hostname: $(hostname)"
echo "Current User: $USER"
if [ -f /etc/os-release ]; then
    echo "OS Version: $(grep 'PRETTY_NAME' /etc/os-release | cut -d'"' -f2)"
else
    echo "OS Version: $(uname -sr)"
fi
echo "Date/Time: $(date)"
echo "----------------------------------------"

for cmd in git python3 pip3 ros2; do
    if command -v "$cmd" &> /dev/null; then
        echo "[$cmd]: [OK]"
    else
        echo "[$cmd]: [MISSING]"
    fi
done
echo "----------------------------------------"

free_space=$(df -BG . | awk 'NR==2 {print $4}' | sed 's/G//')

if [ "$free_space" -lt 5 ]; then
    echo "Disk Space: [LOW DISK] (${free_space}GB remaining)"
else
    echo "Disk Space: [OK] (${free_space}GB remaining)"
fi

echo "========================================"
echo "         CHECK COMPLETE                 "
echo "========================================"
echo "Checking ArIES workspace dependencies..."
