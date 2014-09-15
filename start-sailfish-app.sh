#!/bin/bash

#Destination device
DEVICEIP=$1;
#name of sailfish application
APP=$2;
#supply link if app is browser
LINK=$3;

ssh nemo@$DEVICEIP "
echo 'start $APP'
# start not attached screen--------------------------------
screen -d -m -S $APP
# run maps without attaching the screen--------------------
screen -S $APP -p 0 -X stuff $'invoker --type=silica-qt5 $APP $LINK\r'
sleep 10
echo '$APP successfuly started!'
sleep 1
screen -ls
echo $?
"
exit 0