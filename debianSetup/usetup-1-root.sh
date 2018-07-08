#!/bin/bash
echo "Who is the user that is going to be given sudo?"
read userName
adduser --disable-password --gecos "" $userName # Lets disable the password, and use gecos to make no prompt about user info
adduser $userName sudo # add them to sudo group
sudo chage -d 0 foo # Then force their password to be bad, requiring them to make one on login
userDir="/home/$userName"

echo "#######################################"
echo "Running apt update"
echo "#######################################"
apt update -y
# sudo apt upgrade -y

echo "#######################################"
echo "Generating 4096 RSA ssh keys"
echo "#######################################"
mkdir $userDir/.ssh/
# ssh-keygen -t RSA -b 4096 -f $userDir/.ssh/id_rsa -N ''
grep -q "^[^#]*PasswordAuthentication" /etc/ssh/sshd_config && sed -i "/^[^#]*PasswordAuthentication[[:space:]]yes/c\PasswordAuthentication no" /etc/ssh/sshd_config || echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
service ssh restart
curl -L keys.danthegoodman.com > $userDir/.ssh/authorized_keys

curl -fsSL get.docker.com | bash

echo "\n\n Done... Logout and log back in as $userName. You should be prompted to create a sudo password on login."
