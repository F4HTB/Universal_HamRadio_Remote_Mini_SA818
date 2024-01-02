# Universal_HamRadio_Remote_Mini
A minimalist version of uhrr to simple gateway with a talki walki.
Based on orange pi and <a href="https://f5nlg.wordpress.com">spotnik delta inerface</a>.

PTT on gpio 7 on orange pi zero.

![presentation_uhrr_mini](https://user-images.githubusercontent.com/18350938/140665583-052f302b-3b16-4c1a-9f73-4dac63e2f94d.png)

![uhrrm_uv5r_spotnik](https://boutique.spotnik.org/prestashop/24-large_default/spotnik-hot-spot-.jpg)

For installation on armbian:

git clone https://github.com/F4HTB/Universal_HamRadio_Remote_Mini_SA818
apt install python3-tornado
rm /usr/lib/python3.11/EXTERNALLY-MANAGED
pip3 install pyalsaaudio
cd Universal_HamRadio_Remote_Mini_SA818
chmod +x UHRRM
./UHRRM

Got to https://your_ip:8888
Clic somewhere on page to start the connection.

For hardware see :
http://docs.rrf.ovh/spotnik/ciSpotnik/delta/
https://boutique.spotnik.org/prestashop/fr/kits-a-monter/30-hummingbird-printed-t-shirt.html
