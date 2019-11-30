#!/bin/sh
# https://github.com/yegle/your-dns#obtaining-a-wildcard-certificate
certbot certonly --email ${CERTBOT_EMAIL:?} -d *.${CERTBOT_DOMAIN:?} --rsa-key-size=4096 --agree-tos --force-renewal --dns-cloudflare-credentials /credentials.txt --dns-cloudflare
