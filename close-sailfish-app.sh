#!/bin/bash

#Destination device
DEVICEIP=$1;
#name of sailfish application
APP=$2;

ssh nemo@$DEVICEIP "
echo 'close $APP'
# close not attached screen-------------------------
screen -S $APP -p 0 -X quit
echo '$APP is closed!'
screen -ls
echo $?
"
exit 0