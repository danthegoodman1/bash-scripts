#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
# Get username for sudo and ssh keygen
echo "Who is the user that is going to be given sudo?"
read userName
userDir=$(awk -F: -v v="$userName" '{if ($1==v) print $6}' /etc/passwd)

echo "#######################################"
echo "Running apt update and upgrade"
echo "#######################################"
apt update -y
apt upgrade -y

echo "#######################################"
echo "Generating 4096 RSA ssh keys"
echo "#######################################"
mkdir $userDir/.ssh/
ssh-keygen -t RSA -b 4096 -f $userDir/.ssh/id_rsa -N ''
grep -q "^[^#]*PasswordAuthentication" /etc/ssh/sshd_config && sed -i "/^[^#]*PasswordAuthentication[[:space:]]yes/c\PasswordAuthentication no" /etc/ssh/sshd_config || echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
service ssh restart
curl -L keys.danthegoodman.com > $userDir/.ssh/authorized_keys

echo "#######################################"
echo "Installing curl, docker, nettools"
echo "#######################################"
apt install curl -y
apt install net-tools -y
curl -fsSL get.docker.com | bash

echo "#######################################"
echo "Installing sudo and adding user"
echo "#######################################"
# We do this last so the script can end quickly after giving the input
apt install sudo -y
sudo adduser $userName sudo
