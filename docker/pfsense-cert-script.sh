#!/bin/sh
mkdir -p /tmp/trmmcert
cd /tmp/trmmcert
cp /cf/conf/acme/Tactical.fullchain ./fullchain.pem
cp /cf/conf/acme/Tactical.key ./privatekey.pem
cd ../ && tar -czvf trmmcert.tar.gz ./trmmcert
scp -i /root/.ssh/id_rsa trmmcert.tar.gz user@mydockerhost:trmm/
ssh -i /root/.ssh/id_rsa user@mydockerhost bash -c "trmm/certs.sh"
rm -rf trmmcert
rm -f trmmcert.tar.gz
