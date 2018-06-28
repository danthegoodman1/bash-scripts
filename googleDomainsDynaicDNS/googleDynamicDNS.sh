# Set Domain/Sub-Domain
domain="home.danthegoodman.com"
username="AiulbTamvyYaJvdj"
password="pw5gnSDLr7Zix3HA"

# Get public IP
pubIP=$(dig +short myip.opendns.com @resolver1.opendns.com)

# Make POST request to Google
curl -X POST "https://$username:$password@domains.google.com/nic/update?hostname=$domain&myip=$pubIP"
