#!/bin/bash

wget http://bigbluebutton.googlecode.com/files/openoffice.org_1.0.4_all.deb
sudo dpkg -i openoffice.org_1.0.4_all.deb
sudo apt-get install -y python-software-properties

sudo apt-add-repository ppa:libreoffice/libreoffice-4-0
sudo apt-get update

sudo apt-get install -y libreoffice-common
sudo apt-get install -y libreoffice
