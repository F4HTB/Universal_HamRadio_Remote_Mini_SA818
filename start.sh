#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

amixer --quiet sset "Line In" 0%
amixer --quiet set "Line In" mute 

if amixer get "Line Out" | grep -q "\[off\]"; then amixer --quiet set "Line Out" unmute ; fi
amixer --quiet sset "Line Out" -- -6dB

amixer --quiet set "Mic1" mute 
amixer --quiet set "Mic1" 0%

amixer --quiet set "Mic1 Boost" 0dB
if amixer get Mic1 | grep -q "Capture \[off\]"; then amixer --quiet set "Mic1" toggle ; fi

amixer --quiet set "Mic2" mute 
amixer --quiet set "Mic2" 0%

amixer --quiet set "Mic2 Boost" 0%

amixer --quiet set "ADC Gain" 3dB
amixer --quiet set "DAC" -- -16dB
amixer --quiet set "DAC Reversed" mute

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
