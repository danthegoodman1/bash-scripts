# Dynamic DNS Script for Google Domains
By Dan Goodman

## Customization
`domain`: Set to the Domain or Sub-Domain of your choosing

`username`: The username given for that Domain/Sub-Domain

`password`: The password given for that Domain/Sub-Domain

That's it, the script will find your public IP and send it to Google DNS servers over HTTPS (assuming support on client side).

Just make a cron job to run that script on the interval that you want with:
`bash googleDynamicDNS.sh`
