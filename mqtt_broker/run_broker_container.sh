#!/bin/bash

echo "===>>> [STEP 1/4]: Check if Docker is installed and install it if necessary"
if ! command -v docker &> /dev/null
then
    sudo apt-get update
    sudo apt-get install docker.io -y
fi

if docker ps -a | grep my-mosquitto-container >/dev/null
then
    echo "===>>> [STEP 2/4]: Stop and remove container if it exists"
    docker stop my-mosquitto-container
    docker rm my-mosquitto-container
fi

echo "===>>> [STEP 3/4]: Build and run Mosquitto container"
docker build -t my-mosquitto .
docker run -d -p 1884:1883 --name my-mosquitto-container my-mosquitto

echo "===>>> [Container IP address]"
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' my-mosquitto-container

echo "===>>> [STEP 4/4]: Display container logs"
docker exec -it my-mosquitto-container tail -f /var/log/mosquitto/mosquitto.log
