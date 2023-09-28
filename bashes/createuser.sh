#!/bin/bash

# Check if the script is running with superuser privileges
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
fi

# Prompt for username
read -p "Enter username: " username

# Check if the username already exists
if id "$username" &>/dev/null; then
    echo "User $username already exists."
    exit 1
fi

# Prompt for password (and hide input)
read -s -p "Enter password: " password
echo

# Create the user account
useradd -m -s /bin/bash "$username"

# Set the user's password
echo "$username:$password" | chpasswd

# Provide feedback
echo "User $username has been created with the provided password."

