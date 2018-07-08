#!/bin/bash
echo "Who is the user that is going to be given sudo?"
read userName
useradd $userName -d /home/$userName -g sudo -m -s /bin/bash; echo -e "toor\ntoor" | passwd $userName
passwd -e $userName # Then force their passwored to be expired, requiring them to make one on login
userDir="/home/$userName"

# echo "#######################################"
# echo "Running apt update"
# echo "#######################################"
# apt update -y

echo "#######################################"
echo "Generating 4096 RSA ssh keys"
echo "#######################################"
mkdir $userDir/.ssh/
grep -q "^[^#]*PasswordAuthentication" /etc/ssh/sshd_config && sed -i "/^[^#]*PasswordAuthentication[[:space:]]yes/c\PasswordAuthentication no" /etc/ssh/sshd_config || echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
service ssh restart
curl -L keys.danthegoodman.com > $userDir/.ssh/authorized_keys
# curl [LINK TO SECOND .sh FILE] > $ $userDir/2.sh

curl -fsSL get.docker.com | bash

echo "\n\n Done... Logout and log back in as $userName. You should be prompted to create a sudo password on login."
