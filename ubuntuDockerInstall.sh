#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "Starting install for Ubuntu 16.04 Docker 17.03.2 as per requirement for Rancher v2.0"

echo "#############################################"
echo "####  Removing old version of Docker...  ####"
echo "#############################################"
apt-get remove docker docker-engine docker.io

echo "########################################"
echo "#### Updating apt package index...  ####"
echo "########################################"
apt-get update

echo "######################################################"
echo "#### Installing Packages to allow apt over HTTPS  ####"
echo "######################################################"
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

echo "##############################################"
echo "#### Adding Docker's official GPG key...  ####"
echo "##############################################"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "##########################################"
echo "#### Adding Docker Stable Repository  ####"
echo "##########################################"
sudo add-apt-repository \
   \"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   \$(lsb_release -cs) \
   stable\"

echo "########################################"
echo "#### Updating apt package index...  ####"
echo "########################################"
sudo apt-get update

echo "###########################################"
echo "#### Installing Docker verion 17.03.2  ####"
echo "###########################################"
sudo apt-get install docker-ce=17.03.2~ce-0~ubuntu-xenial -y

echo "########################################"
echo "#### Running Docker hello-world...  ####"
echo "########################################"
sudo docker run hello-world
