#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Please run the script as root user"
    exit 1 #other then 0 all are error codes
else
    echo "Script is running with root user"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed, installing now"
    dnf install mysql -y
if [ $? -eq 0 ]
then
    echo "Installation mysql is successful"
else
    echo "installation failed"
    exit 1
fi

else
    echo "MySQL is already installed"
fi

