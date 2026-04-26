#!/bin/bash

USERID=$(id -u)

LOGS_FOLDER="/var/log/shellscriptlogs"
SCRIPT_NAME=$(echo $0 | cut -d'.' -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER
echo "Script execution started at: $(date)" &>> $LOG_FILE
if [ $USERID -ne 0 ]
then
    echo "Please run the script as root user" &>> $LOG_FILE
    exit 1 #other then 0 all are error codes
else
    echo "Script is running with root user" &>> $LOG_FILE
fi


VALIDATE() {
    if [ $1 -eq 0 ]
    then
        echo "Installing $2 is successful" &>> $LOG_FILE
    else
        echo "Installing $2 failed" &>> $LOG_FILE
        exit 1
    fi
}


########MySQL installation

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "MySQL is not installed, installing now" &>> $LOG_FILE
    dnf install mysql -y &>> $LOG_FILE
    VALIDATE $? "MySQL"

else
    echo "MySQL is already installed" &>> $LOG_FILE
fi

########Python3 installation

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "Python3 is not installed, installing now" &>> $LOG_FILE
    dnf install python3 -y &>> $LOG_FILE
    VALIDATE $? "Python3"   
    else
    echo "Python3 is already installed" &>> $LOG_FILE
fi

#########################Nginx installation

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "Nginx is not installed, installing now" &>> $LOG_FILE
    dnf install nginx -y &>> $LOG_FILE
    VALIDATE $? "Nginx"
else
    echo "Nginx is already installed" &>> $LOG_FILE
fi
