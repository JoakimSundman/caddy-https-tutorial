#!/bin/bash

WORKING_DIR="/root/caddy"
ASSETS_DIR="/root/assets"

mkdir -p $ASSETS_DIR

# Install netcat for security endpoint
apt update > /dev/null 2>&1
apt install -y netcat > /dev/null 2>&1

# Create working directory and html directory for webapp
mkdir -p $WORKING_DIR/site
mkdir -p $WORKING_DIR/conf
wget -O $ASSETS_DIR/docker-compose.yml https://raw.githubusercontent.com/JoakimSundman/caddy-https-tutorial/main/caddy-tutorial/assets/docker-compose.yml
wget -O $WORKING_DIR/site/index.html https://raw.githubusercontent.com/JoakimSundman/caddy-https-tutorial/main/caddy-tutorial/assets/html/index.html

# Move user into working directory for scenario
cd $WORKING_DIR

clear