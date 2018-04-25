# Ubuntu NGINX Install
Installs NGINX Open Source on Ubuntu 16.04, prepared for loadbalancing NodeJS Express servers with Round-Robin

This will configure forwarding to Express Servers running on ports 8080, 8081, and 8082 from port 80

THIS DOES NOT INCLUDE SUPPORT FOR HTTPS, EVERYTHING IS UNENCRYPTED

It is really meant for developing and PoC purposes

I also added an example index.js file so you can test the load balancer to see that you get the different ports/express servers

execute this script in one line by running:

`curl https://raw.githubusercontent.com/danthegoodman1/bash-scripts/master/nginxUbuntuNodeJS/nginxUbuntuNodeJS.sh | sudo bash`



Or by running:

`sudo bash <(curl -s https://raw.githubusercontent.com/danthegoodman1/bash-scripts/master/nginxUbuntuNodeJS/nginxUbuntuNodeJS.sh)`
