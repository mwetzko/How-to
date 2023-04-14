#!/bin/sh

sudo systemctl disable softether-vpnserver

sudo rm /etc/systemd/system/softether-vpnserver.service

sudo rm -r /usr/local/vpnserver

echo "Done!"
