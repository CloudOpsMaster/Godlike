#!/bin/bash

DOMAIN="yourdomain.com"

# Install Certbot
sudo apt update
sudo apt install -y certbot python3-certbot-nginx

# Get SSL certificate
sudo certbot --nginx -d $DOMAIN

# Test SSL auto-renewal
sudo certbot renew --dry-run
