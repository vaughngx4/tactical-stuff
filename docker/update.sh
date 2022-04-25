#!/bin/bash
echo "[UPDATING COMPOSE FILE]"
rm -f docker-compose.yml.old
mv docker-compose.yml docker-compose.yml.old
wget https://raw.githubusercontent.com/amidaware/tacticalrmm/master/docker/docker-compose.yml
#wget https://raw.githubusercontent.com/amidaware/tacticalrmm/develop/docker/docker-compose.yml
sed -i "s/\"443:4443\"/\"11443:4443\"/g" docker-compose.yml
sed -i "s/\"80:8080\"/\"11080:8080\"/g" docker-compose.yml
echo "[BRINGING TACTICAL DOWN...]"
docker-compose down
echo "[REMOVING OLD IMAGES...]"
images=$(docker images | grep -o 'tacticalrmm/tactical-[a-z]*')
for image in images;do
    while [[ image != 'images' ]];do
        docker rmi ${image}:latest
        break;
    done
done
docker rmi tacticalrmm/tactical:latest
echo "[PULLING NEW IMAGES...]"
cp .env.master .env
docker-compose pull
rm -f .env
echo "[BRINGING TACTICAL UP...]"
./certs.sh
