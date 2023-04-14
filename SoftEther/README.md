# Install SoftEther VPN Server or VPN Edge (Server) on Linux 'Debian' based systems

Tested with: Debian 11 x64, Raspberry Pi OS x86, Raspberry Pi OS ARM

1. Download `Install SoftEther VPN Server - Debian.sh` to your device where SoftEther VPN Server or SoftEther VPN Edge has to be installed. Make sure to put the script into an empty writable folder.
2. Go to `https://www.softether-download.com/en.aspx?product=softether`, select the proper version for your system and **copy the link**
3. Open a terminal session and `cd ..` into the location where `Install SoftEther VPN Server - Debian.sh` resides
4. `wget <copied link>`, e.g. `wget https://www.softether-download.com/files/softether/v4.41-9787-rtm-2023.03.14-tree/Linux/SoftEther_VPN_Server/32bit_-_Intel_x86/softether-vpnserver-v4.41-9787-rtm-2023.03.14-linux-x86-32bit.tar.gz`
5. Run `sh Install\ SoftEther\ VPN\ Server\ -\ Debian.sh`. If you have downloaded multiple archives, run the script providing the filename you want to install. E.g.: `sh Install\ SoftEther\ VPN\ Server\ -\ Debian.sh softether-vpnserver-v4.41-9787-rtm-2023.03.14-linux-x86-32bit.tar.gz`
6. reboot

After your system is up again, you can check, that the service is running by `sudo systemctl status softether-vpnserver`
