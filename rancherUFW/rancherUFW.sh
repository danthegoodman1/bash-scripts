echo "#######################################################"
echo "####  Opening Ports required for Rancher v2.0....  ####"
echo "#######################################################"

ufw allow 22
ufw allow 80
ufw allow 443
ufw allow 6443
ufw allow 2379
ufw allow 2380
ufw allow 10250
ufw allow 10251
ufw allow 10252
ufw allow 10256


echo "#################"
echo "####  Done!  ####"
echo "#################"
