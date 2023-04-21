#!/bin/sh

sudo systemctl stop softether-vpnserver.service

sudo systemctl disable softether-vpnserver.service

sudo rm -f /etc/systemd/system/softether-vpnserver.service

sudo rm -rf /usr/local/vpnserver

echo "Done!"
