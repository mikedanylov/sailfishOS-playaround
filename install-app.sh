#!/bin/bash

DEVICEIP=$1;
echo "Install where: $DEVICEIP";
APPNAME="$2";
echo "Install what: $APPNAME";
# to check d-bus path: env | grep D-BUS
DBUSADDR=DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/100000/dbus/user_bus_socket;
echo "d-bus path: $DBUSADDR";

ssh root@$DEVICEIP "
export $DBUSADDR;
dbus-send --type=method_call --session --print-reply --dest=com.jolla.jollastore /StoreClient com.jolla.jollastore.installPackage string:"$APPNAME";
sleep 1;"
