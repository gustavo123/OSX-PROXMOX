#!/bin/bash

#########################################################################################################################
#
# Script: install
#
# https://luchina.com.br
#
#########################################################################################################################

clear

if [ -e /root/OSX-PROXMOX ]; then rm -rf /root/OSX-PROXMOX; fi;

echo "Waiting install OSX-PROXMOX..."
echo " "

apt update > /tmp/install-osx-proxmox.log 2>> /tmp/install-osx-proxmox.log

if [ $? -ne 0 ]; then echo "Error with 'apt-get update' ..."; exit; fi		

apt install git -y >> /tmp/install-osx-proxmox.log 2>> /tmp/install-osx-proxmox.log

git clone -b production-server https://github.com/gustavo123/OSX-PROXMOX.git >> /tmp/install-osx-proxmox.log 2>> /tmp/install-osx-proxmox.log

if [ ! -e /root/OSX-PROXMOX ]; then mkdir -p /root/OSX-PROXMOX; fi;

/root/OSX-PROXMOX/setup
