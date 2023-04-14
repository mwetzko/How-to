#!/bin/sh

sudo systemctl disable softether-vpnserver

sudo rm -f /etc/systemd/system/softether-vpnserver.service

sudo rm -rf /usr/local/vpnserver

echo "Done!"
