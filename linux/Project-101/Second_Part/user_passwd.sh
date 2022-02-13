#!/bin/bash
#
# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.

# Get the username (login).
username=$1

# Get the real name (contents for the description field).
read -p "Please enter your name : " name

# Get the password.

password () { < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16}; echo;}


# Create the account.

sudo useradd -c "$name" $1

# Check to see if the useradd command succeeded.
echo -e "\n"

cat /etc/passwd | grep "$1"

# We don't want to tell the user that an account was created when it hasn't been.

# Set the password.

# Check to see if the passwd command succeeded.

sudo cat /etc/shadow | grep $1

# Force password change on first login.

# Display the username, password, and the host where the user was created.

echo "Your username is $username "
echo "Your name is $name "
echo "Your password is "
password


