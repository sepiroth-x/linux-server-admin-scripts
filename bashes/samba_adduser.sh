#!/bin/bash



if [ $# -ne 2 ]; then
    echo "Usage: $0 <string1> <string2>"
    exit 1
fi

username="$1"
password="$2"

# Use the strings as parameters for a sudo command
#sudo some_command_with_parameters "$string1" "$string2"

echo "Entered username: $username"
echo "Entered password: $password"


