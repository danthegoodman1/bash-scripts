# Set Domain/Sub-Domain
domain="home.danthegoodman.com"
username="username"
password="password"

# Get public IP
pubIP=$(dig +short myip.opendns.com @resolver1.opendns.com)

# Make POST request to Google
curl -X POST "https://$username:$password@domains.google.com/nic/update?hostname=$domain&myip=$pubIP" -d "Content-Length: 0"
