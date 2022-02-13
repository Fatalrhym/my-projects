#!/bin/bash

# Check if we are root privilage or not

#echo $EUID

if [[ $EUID -ne 0 ]]; then 
   sudo su 
fi

# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file

# Where do we backup to. Please create this file before execute this script

# Create archive filename based on time
<<comment
*/5 * * * * cp -R  /etc /mnt/backup/etc-"$(date + "%d %m %Y : %r")"-"$(hostname)" 
*/5 * * * * cp -R /boot /mnt/backup/boot-"$(date + "%d %m %Y : %r")"-"$(hostname)"
*/5 * * * * cp -R /usr /mnt/backup/usr-"$(date + "%d %m %Y : %r")"-"$(hostname)"
*/5 * * * * cp -R /home/ec2-user/data /mnt/backup/data-"$(date + "%d %m %Y : %r")"-"$(hostname)"
comment

# Print start status message.

echo "Backup is starting now."

# Backup the files using tar.

sudo cp -R  /etc /mnt/backup/etc-"$(date +"%d %m %Y : %r")"-"$(hostname)" 

tar -cvzf /mnt/backup/etc-"$(date +"%d %m %Y : %r")"-"$(hostname)".tar.gz /mnt/backup/etc-"$(date +"%d %m %Y : %r")"-"$(hostname)"

sudo cp -R /boot /mnt/backup/boot-"$(date +"%d %m %Y : %r")"-"$(hostname)"  

tar -cvzf /mnt/backup/boot-"$(date +"%d %m %Y : %r")"-"$(hostname)".tar.gz /mnt/backup/boot-"$(date +"%d %m %Y : %r")"-"$(hostname)"

sudo cp -R /usr /mnt/backup/usr-"$(date +"%d %m %Y : %r")"-"$(hostname)"

tar -cvzf /mnt/backup/usr-"$(date +"%d %m %Y : %r")"-"$(hostname)".tar.gz /mnt/backup/usr-"$(date +"%d %m %Y : %r")"-"$(hostname)"

sudo cp -R /home/ec2-user/data /mnt/backup/data-"$(date +"%d %m %Y : %r")"-"$(hostname)"

tar -cvzf /mnt/backup/data-"$(date +"%d %m %Y : %r")"-"$(hostname)".tar.gz /mnt/backup/data-"$(date +"%d %m %Y : %r")"-"$(hostname)"

# Print end status message.
echo "Backup succesfully is completed"

# Long listing of files in $dest to check file sizes.
ls -al /mnt/backup