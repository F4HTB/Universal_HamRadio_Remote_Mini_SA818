# Universal_HamRadio_Remote_Mini
A minimalist version of uhrr to simple gateway with a talki walki.
Based on orange pi and <a href="https://f5nlg.wordpress.com">spotnik delta inerface</a>.

PTT on gpio 7 on orange pi zero.

Interface:
![UHRR_MINI_SA818_F4HTB_Interface](https://github.com/F4HTB/Universal_HamRadio_Remote_Mini_SA818/assets/18350938/3ddaa1da-b5ca-4acb-bb29-2f0456ce718b)

<img src="https://boutique.spotnik.org/prestashop/24-large_default/spotnik-hot-spot-.jpg" width="200" height="200">

For installation on armbian:

```
git clone https://github.com/F4HTB/Universal_HamRadio_Remote_Mini_SA818
apt install python3-tornado
rm /usr/lib/python3.11/EXTERNALLY-MANAGED
pip3 install pyalsaaudio
cd Universal_HamRadio_Remote_Mini_SA818
chmod +x UHRRM
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
Clic somewhere on page to start the connection.

For hardware see :
http://docs.rrf.ovh/spotnik/ciSpotnik/delta/
https://boutique.spotnik.org/prestashop/fr/kits-a-monter/30-hummingbird-printed-t-shirt.html


Config file:

```
[SERVER]
yournameserver = TESTNAME
port = 8888
certfile = UHRRM.crt
keyfile = UHRRM.key
cookie_secret = L8LwECiNRxq2N0N2eGxx9MZlrpmuMEimlydNX/vt1LM=
log_file = UHRRM.log
debug = true
auth = false
authlogin = operator
authpassword = operator

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
dcs = 0
level = 4
emphasis = false
highpass = true
lowpass = true
serial = /dev/ttyS2
rate = 9600
scan_frequencies = 145.4000,432.9750,432.5000
scan_waittondetect = 5
```
