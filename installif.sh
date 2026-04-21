#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Please run the script as root user"
    exit 1 #other then 0 all are error codes
else
    echo "Script is running with root user"
fi

dnf install myssaaa -y

if [ $? -eq 0 ]
then
    echo "Installation my sql is successful"
else
    echo "Installation failed"
    exit 1
fi
