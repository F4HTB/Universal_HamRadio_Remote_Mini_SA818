#!/bin/bash
sudo chmod 666 /sys/class/gpio/export  > /dev/null 2>&1
sudo chmod 666 /sys/class/gpio/gpio7/direction > /dev/null 2>&1
sudo chmod 666 /sys/class/gpio/gpio7/value > /dev/null 2>&1
./UHRRM
