#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

chmod 777 /sys/class/gpio/export
echo 7 > /sys/class/gpio/export
sleep 5
chmod 777 /sys/class/gpio/gpio7/direction
chmod 777 /sys/class/gpio/gpio7/value
echo out > /sys/class/gpio/gpio7/direction
./UHRRM
