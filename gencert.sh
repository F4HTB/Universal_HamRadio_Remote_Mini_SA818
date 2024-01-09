#!/bin/bash
if [ -e "UHRRM.key" ]; then rm UHRRM.key; fi
if [ -e "UHRRM.crt" ]; then rm UHRRM.crt; fi
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out UHRRM.key
openssl req -new -key UHRRM.key -out UHRRM.csr -subj "/C=/ST=/L=/O=/CN="
openssl x509 -req -in UHRRM.csr -signkey UHRRM.key -out UHRRM.crt
if [ -e "UHRRM.csr" ]; then rm UHRRM.csr; fi
