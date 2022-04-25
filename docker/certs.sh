#!/bin/bash
cd /home/user/trmm/
tar xvf ./trmmcert.tar.gz
cp .env.master .env
echo "[UPDATING TACTICAL CERTIFICATES...]"
docker-compose down
echo "CERT_PUB_KEY=$(base64 -w 0 ./trmmcert/fullchain.pem)" >> .env
echo "CERT_PRIV_KEY=$(base64 -w 0 ./trmmcert/privatekey.pem)" >> .env
docker-compose up -d --remove-orphans
rm -f .env
rm -rf ./trmmcert
