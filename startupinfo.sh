#!/bin/bash
# Color variables
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
# Clear the color after that
clear='\033[0m'
# Get system information
os_name=$(uname -s)
kernel_version=$(uname -r)
hostname=$(hostname)
uptime=$(uptime | awk '{print $3,$4,$5,$6}')

# Get CPU information
cpu_model=$(grep "model name" /proc/cpuinfo | head -n 1 | awk -F: '{print $2}' | sed 's/^ //')
cpu_cores=$(nproc)

# Get memory information
total_memory=$(free -h | awk '/Mem:/ {print $2}')
used_memory=$(free -h | awk '/Mem:/ {print $3}')

# Get disk space information
total_disk=$(df -h / | awk '/\// {print $2}')
used_disk=$(df -h / | awk '/\// {print $3}')
available_disk=$(df -h / | awk '/\// {print $4}')
clear
# Display the information
echo "System Information:"
echo "-----------------"
echo "Operating System: $os_name"
echo "Kernel Version: $kernel_version"
echo "Hostname: $hostname"
echo "Uptime: $uptime"
echo ""
echo "CPU Information:"
echo "----------------"
echo "Model: $cpu_model"
echo "Cores: $cpu_cores"
echo ""
echo "Memory Information:"
echo "-------------------"
echo "Total Memory: $total_memory"
echo "Used Memory: $used_memory"
echo ""
echo "Disk Space Information (/):"
echo "--------------------------"
echo "Total Space: $total_disk"
echo "Used Space: $used_disk"
echo "Available Space: $available_disk"
if [ -f /var/run/reboot-required ]; then
echo ""  
echo -e "${red} reboot required ${clear}"
fi

