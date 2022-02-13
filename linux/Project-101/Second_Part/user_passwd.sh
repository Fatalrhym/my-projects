#!/bin/bash
#
# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.

# Get the username (login).
read -p "Please login your username : " username

# Get the real name (contents for the description field).
read -p "Please enter your name : " name

# Get the password.

read -sp "Please enter your password : " password

# Create the account.

sudo useradd -c "$name" $username

# Check to see if the useradd command succeeded.
echo -e "\n"

cat /etc/passwd | grep "$username"

# We don't want to tell the user that an account was created when it hasn't been.

# Set the password.

sudo passwd -p $username 
sudo passwd $password

# Check to see if the passwd command succeeded.
sudo cat /etc/shadow 
# Force password change on first login.

# Display the username, password, and the host where the user was created.

echo "Your username is $username "
echo "Your password is $password "

