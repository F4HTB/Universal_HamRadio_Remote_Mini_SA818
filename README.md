# Universal_HamRadio_Remote_Mini
A minimalist version of uhrr to simple gateway with a talki walki.
Based on orange pi and <a href="https://f5nlg.wordpress.com">spotnik delta inerface</a>.

PTT on gpio 7 on orange pi zero.  
Read reception flag on gpio 10 on orange pi zero.

Interface:

![UHRR_MINI_SA818_F4HTB_Interface](https://github.com/F4HTB/Universal_HamRadio_Remote_Mini_SA818/assets/18350938/8e767a2b-e207-4b2c-a31f-b5e89bb0057d)

<img src="https://boutique.spotnik.org/prestashop/24-large_default/spotnik-hot-spot-.jpg" width="200" height="200">

For installation on **armbian** as root (sudo su):


```
apt install armbian-config
armbian-config
```
=>search in system>Hardware and add "analog-codec" and "uart2"
continue with:
```
git clone https://github.com/F4HTB/Universal_HamRadio_Remote_Mini_SA818
apt install python3-tornado python3-serial python3-pip python3-dev libasound2-dev
rm /usr/lib/python3.11/EXTERNALLY-MANAGED
pip3 install pyalsaaudio
cd Universal_HamRadio_Remote_Mini_SA818
chmod +x UHRRM
chmod +x start.sh
```
```
./UHRRM
```
or prefer:
```
./start.sh
```
start.sh include some tricks for GPIO and alsamixer configuration for orangie pi zero.


Got to https://your_ip:8888  
**https only**  
Clic somewhere on page to start the connection.  

For hardware see :  
http://docs.rrf.ovh/spotnik/ciSpotnik/delta/  
https://boutique.spotnik.org/prestashop/fr/kits-a-monter/30-hummingbird-printed-t-shirt.html  

Config file:  

```
[SERVER]
; Name of your server displayed on the interface
yournameserver = TESTNAME
; Port number on which the server will listen
port = 8888
; Path to the server's SSL certificate file
certfile = UHRRM.crt
; Path to the server's SSL key file
keyfile = UHRRM.key
; Secret key used to sign cookies
cookie_secret = L8LwECiNRxq2N0N2eGxx9MZlrpmuMEimlydNX/vt1LM=
; Enable or disable debugging mode (true/false) for webserver only
debug = true
; Enable or disable authentication (true/false)
auth = false
; Username for authentication (if auth is true)
authlogin = operator
; Password for authentication (if auth is true)
authpassword = operator
; Path to the UHRR's log file
log_file = server_logs.log

[AUDIO]
; Output audio device configuration
outputdevice = plughw:CARD=Codec,DEV=0
; Input audio device configuration
inputdevice = plughw:CARD=Codec,DEV=0

[OrangePI]
; GPIO pin configuration for PTT
pttgpio = 7
; GPIO pin configuration for RX Flag
rxgpio = 10

[SA818]
; Bandwidth configuration (0 for narrow, 1 for wide)
bw = 0
; Transmit frequency in MHz
frequency = 432.5000
; Offset frequency in MHz
offset = 0.0000
; Squelch level configuration
squelch = 2
; CTCSS tone configuration (None if not used)
ctcss = None
; DCS code configuration (None if not used)
dcs = None
; Audio level configuration
level = 4
; Enable or disable emphasis
emphasis = false
; Enable or disable high-pass filter
highpass = true
; Enable or disable low-pass filter
lowpass = true
; Serial port configuration for SA818
serial = /dev/ttyS2
; Baud rate for SA818 communication
rate = 9600
; Frequencies to scan (comma-separated)
scan_frequencies = 145.4000,432.9750,432.7000
; Wait time (in seconds) for the scanner to detect activity
scan_waittondetect = 5
```

example:

```
[SERVER]
yournameserver = TESTNAME
port = 8888
certfile = UHRRM.crt
keyfile = UHRRM.key
cookie_secret = L8LwECiNRxq2N0N2eGxx9MZlrpmuMEimlydNX/vt1LM=
debug = true
auth = false
authlogin = operator
authpassword = operator
log_file = server_logs.log

[AUDIO]
outputdevice = plughw:CARD=Codec,DEV=0
inputdevice = plughw:CARD=Codec,DEV=0

[OrangePI]
pttgpio = 7
rxgpio = 10

[SA818]
bw = 0
frequency = 432.5000
offset = 0.0000
squelch = 2
ctcss = None
dcs = None
level = 4
emphasis = false
highpass = true
lowpass = true
serial = /dev/ttyS2
rate = 9600
scan_frequencies = 145.4000,432.9750,432.7000
scan_waittondetect = 5


```
  
ngrock usage:  
```
ngrok http https://localhost:8888
```

To generate a new certfile:  
```
chmod +x gencert.sh
./gencert.sh
```
