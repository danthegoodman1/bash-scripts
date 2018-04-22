if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "Starting install of NGINX Open Source for Ubuntu 16.04, prepared for NodeJS Express Servers"

echo "############################################"
echo "####  Updating and Installing NGINX...  ####"
echo "############################################"

apt-get update
apt-get install nginx -y

echo "###########################################################"
echo "####  Configuring Default File for Express Servers...  ####"
echo "###########################################################"

curl (link) > /etc/nginx/sites-available/default
