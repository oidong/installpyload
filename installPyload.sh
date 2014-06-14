#!/bin/bash


PFAD="/media/usb/pyload/"
REPO="deb-src http://mirrordirector.raspbian.org/raspbian/ wheezy main contrib non-free rpi"

cd /tmp/

if grep -Fxq "$REPO" /etc/apt/sources.list
then
	echo "Source allready available"
else
	echo $REPO >> /etc/apt/sources.list
fi

apt-get update && apt-get -y upgrade
apt-get -y install python python-jinja2 python-crypto python-pycurl python-imaging liblept3 tesseract-ocr spidermonkey-bin python-qt4 screen zip unzip
apt-get -y install python-django python-openssl
apt-get -y build-dep rar unrar-nonfree
apt-get source -b unrar-nonfree
dpkg -i unrar*armhf.deb
rm -rf unrar*

wget http://download.pyload.org/pyload-v0.4.9-all.deb
dpkg -i pyload-v0.4.9-all.deb
rm pyload-v0.4.9-all.deb

mkdir -p $PFAD

/usr/share/pyload/pyLoadCore.py --changedir /opt/pyload
/usr/share/pyload/pyLoadCore.py --setup
/usr/share/pyload/pyLoadCore.py --daemon

crontab -l > tmptab
echo "@reboot pyLoadCore --daemon" >> tmptab
crontab tmptab
rm tmptab
