#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Please run the script as root user"
else
    echo "Script is running with root user"
fi

dnf install httpd -y
systemctl start httpd
systemctl enable httpd