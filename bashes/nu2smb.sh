#!/bin/bash
#Description: This bash script is created by Sepiroth X for add user account 
#integration and adding the added user to samba access

# Check if the script is running with superuser privileges
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
fi

echo "============================================="
echo "======REGISTER NETWORK ACCESS ACCOUNT======="
echo "============================================="



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

#Prompt for password the second time (and hide input)
read -s -p "Retype password again: " password2
echo

if ["$password" != "$password2;] then 
   echo "Passwords do not match.  Try again [Program exits]."
   exit 1
fi  


# Create the user account
useradd -m -s /bin/bash "$username"

# Set the user's password
echo "$username:$password" | chpasswd



# add user to smb access
./expectsmbpassword.exp $username $password



# Provide feedback
echo "User $username has been created and added to SMB access with the provided password."

