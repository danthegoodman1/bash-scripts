#!/bin/bash
sudo echo "Who is the user that is going to be given sudo?"
read userName
userDir=$(awk -F: -v v="$userName" '{if ($1==v) print $6}' /etc/passwd)

echo "#######################################"
echo "Running apt update"
echo "#######################################"
sudo apt update -y
# sudo apt upgrade -y

echo "#######################################"
echo "Generating 4096 RSA ssh keys"
echo "#######################################"
sudo mkdir $userDir/.ssh/
# ssh-keygen -t RSA -b 4096 -f $userDir/.ssh/id_rsa -N ''
sudo grep -q "^[^#]*PasswordAuthentication" /etc/ssh/sshd_config && sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]yes/c\PasswordAuthentication no" /etc/ssh/sshd_config || sudo echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
sudo service ssh restart
curl -L keys.danthegoodman.com > $userDir/.ssh/authorized_keys

curl -fsSL get.docker.com | bash
