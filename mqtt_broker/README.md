# How to run Mosquitto broker container

## Prerequisites
* Docker

## How to run

1. Open a terminal and navigate to the directory containing the `run_broker_container.sh` script.
2. Make the script executable by running: `sudo chmod +x run_broker_container.sh`
3. Run the script by typing: `./run_broker_container.sh`

The script will perform the following steps:

1. Check if Docker is installed and install it if necessary.
2. Stop and remove the container if it already exists.
3. Build and run the Mosquitto container.
4. Display the container logs.