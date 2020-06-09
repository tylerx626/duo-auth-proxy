#!/bin/bash

#This script will download, install, and configure Duo authentication proxy for CentOS 7.x minimal servers
#Official instructions here https://duo.com/docs/authproxy-reference


#install requirements
yum install -y gcc make libffi-devel perl zlib-devel

#allow radius through firewall-cmd
sudo firewall-cmd --add-service=radius

#download latest Duo version
if [ test -f duoauthproxy-latest-src.tgz ]
then
    echo "File duoauthproxy-latest-src.tgz exists"
else
    echo "Downloading latest duoauthproxy-latest-src.tgz file..."
    wget https://dl.duosecurity.com/duoauthproxy-latest-src.tgz
fi

#check if install directory exists and mkdir if not
if [ -d "/opt/duoauthproxy_latest" ] 
then
    echo "Directory /opt/duoauthproxy_latest exists." 
else
    echo "Error: Directory /opt/duoauthproxy_latest does not exist."
    mkdir /opt/duoauthproxy_latest
fi

#extract downloaded tarball and change directory 
tar zxf duoauthproxy-latest-src.tgz -C /opt/duoauthproxy_latest --strip-components=1


#build and install auth proxy
make -C /opt/duoauthproxy_latest 
/opt/duoauthproxy_latest/duoauthproxy-build/./install
#follow through the prompts to create a locked down user and group

#cleanup
sudo rm duoauthproxy-latest-src.tgz

 
#Now edit /opt/duoauthproxy/conf/authproxy.cfg to reflect your environment
