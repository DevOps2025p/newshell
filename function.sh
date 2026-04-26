#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Please run the script as root user"
    exit 1 #other then 0 all are error codes
else
    echo "Script is running with root user"
fi
VALIDATE() {
    if [ $1 -eq 0 ]
    then
        echo "Installing $2 is successful"
    else
        echo "Installing $2 failed"
        exit 1
    fi
}


########MySQL installation

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "MySQL is not installed, installing now"
    dnf install mysql -y
    VALIDATE $? "MySQL"

else
    echo "MySQL is already installed"
fi

########Python3 installation

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "Python3 is not installed, installing now"
    dnf install python3 -y
    VALIDATE $? "Python3"   
    else
    echo "Python3 is already installed"
fi

#########################Nginx installation

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "Nginx is not installed, installing now"
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo "Nginx is already installed"
fi
