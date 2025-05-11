#!/bin/bash

# Welcome message
echo "Welcome to the Simple Nmap Bash Scanner"

# Prompt the user to enter a target IP or domain
read -p "Enter the target IP or domain: " target

# Set up the output file in the results/ directory
filename="results/${target}_scan.txt"

# Create the results/ directory if it doesn't already exist
mkdir -p results

# Inform the user which host is being scanned and where the results will be saved
echo "Scanning host: $target"
echo "Results will be saved in $filename"

# Perform a Ping Scan to check if the host is up
echo "Running Ping Scan..." | tee -a $filename
nmap -sn $target | tee -a $filename

# Perform a Port Scan to check for open ports
echo -e "\nRunning Port Scan..." | tee -a $filename
nmap -p- $target | tee -a $filename

# Perform OS Detection and Service Version Scan
echo -e "\nRunning OS Detection and Service Version Scan..." | tee -a $filename
nmap -A $target | tee -a $filename

# Final message
echo -e "\nScan completed. Check the results in the file: $filename"
