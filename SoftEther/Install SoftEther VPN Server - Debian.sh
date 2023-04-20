#!/bin/sh

# make sure everything is up to date
sudo apt-get update -y

# make sure we can build the downloaded files
sudo apt-get install build-essential gnupg2 gcc make -y

# ensure our temp folder does not exist
rm -rf softether-extract

mkdir softether-extract

if [ -f "$1" ]; then
    echo "Processing file $1"
    # extract downloaded package (we assume the .tar file contains 1 folder)
    tar -xvzf $1 -C softether-extract --strip-components=1
else
    file=$(ls -t softether*.tar.gz | head -n 1)

    if ! [ -f "$file" ]; then
        echo "Cannot find file to extract. Down the propper SoftEther application and try again!"
        return
    fi

    echo "Processing file $file"
    # extract downloaded package (we assume the .tar file contains 1 folder)
    tar -xvzf $file -C softether-extract --strip-components=1
fi

# change into extracted folder
cd softether-extract

# build
make

if [ -f vpnserver ]; then
    vpnexe="vpnserver"
elif [ -f vpnbridge ]; then
    vpnexe="vpnbridge"
else
    echo "Failed to build! Make sure you have chosen the correct platform version (x86, x64, ARM, ARM64, etc.)"
    cd ..
    rm -rf softether-extract
    return
fi

# move out
cd ..

# make sure, target does not exist
sudo rm -rf /usr/local/vpnserver

# move entire folder to a place it can reside
sudo mv softether-extract /usr/local/vpnserver

# change into new folder place
cd /usr/local/vpnserver

# change access accordingly
sudo chmod 600 *
sudo chmod 700 $vpnexe
sudo chmod 700 vpncmd

# create service/daemon file
sudo bash -c 'cat > /etc/systemd/system/softether-vpnserver.service' <<EOF
[Unit]

Description=SoftEther VPN Server

After=network-online.target

After=dbus.service

[Service]

Type=forking

ExecStart=/usr/local/vpnserver/$vpnexe start

ExecReload=/bin/kill -HUP \$MAINPID

[Install]

WantedBy=multi-user.target
EOF

sudo systemctl enable softether-vpnserver

echo "Done!"
