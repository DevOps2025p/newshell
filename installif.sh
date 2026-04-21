#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Please run the script as root user"
    exit 1 #other then 0 all are error codes
else
    echo "Script is running with root user"
fi

dnf install httpd -y
systemctl start httpd
systemctl enable httpd