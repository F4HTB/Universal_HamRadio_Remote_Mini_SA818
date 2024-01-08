#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

amixer --quiet set "Mic1" unmute 
amixer --quiet set Mic1 50%
amixer --quiet set "Mic1 Boost" 20dB
if amixer get Mic1 | grep -q "Capture \[off\]"; then amixer --quiet set "Mic1" toggle ; fi
if amixer get "Line Out" | grep -q "\[off\]"; then amixer --quiet set "Line Out" unmute ; fi
amixer --quiet sset "Line Out" -- -10dB

chmod 777 /sys/class/gpio/export

if [ ! -d "/sys/class/gpio/gpio7" ]; then echo 7 > /sys/class/gpio/export; sleep 5; fi
chmod 777 /sys/class/gpio/gpio7/direction
chmod 777 /sys/class/gpio/gpio7/value
echo out > /sys/class/gpio/gpio7/direction

if [ ! -d "/sys/class/gpio/gpio10" ]; then echo 10 > /sys/class/gpio/export; sleep 5; fi
chmod 777 /sys/class/gpio/gpio10/direction
chmod 777 /sys/class/gpio/gpio10/value
echo in > /sys/class/gpio/gpio10/direction

./UHRRM
