#!/bin/bash


function print_usage
{
  echo "Usage:"
	echo "    $0 <domain_name>"
	exit 1
}

if [ `lsb_release --description | grep 'Ubuntu 10.04' | wc -l` -eq 0 ]
then
    echo "MUST BE a fresh installation of Ubuntu 10.04 Server"
    exit 1
fi

if [ `whoami` == "root" ]
then
    echo "This script shouldn't be executed as root"
    exit 1
fi

if [ $# -ne 1 ]
then
	print_usage
fi

echo "Updating the Ubuntu package repository"
sudo apt-get -y install mysql-server
sudo apt-get -y install git-core htop iftop ant curl

mkdir -p ~/tools
cd ~/tools
if [ -d "installation-scripts" ]
then
    cd installation-scripts
    git pull origin master
    cd ..
else
    git clone git://github.com/mrquangquynh/installation-scripts.git
fi
cd installation-scripts/bbb-deploy/

chmod +x install-bigbluebutton0.81.sh
./install-bigbluebutton0.81.sh
sudo bbb-conf --setip $1

echo "Restart the server to finish the installation"
