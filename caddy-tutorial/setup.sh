#!/bin/bash

WORKING_DIR="/root/caddy"
ASSETS_DIR="/root/assets"

mkdir -p $ASSETS_DIR
mkdir -p $ASSETS_DIR/checker
mkdir -p $ASSETS_DIR/checker/domains

# Create working directory and html directory for webapp
mkdir -p $WORKING_DIR/site
mkdir -p $WORKING_DIR/conf
wget -O $ASSETS_DIR/docker-compose.yml https://raw.githubusercontent.com/JoakimSundman/caddy-https-tutorial/main/caddy-tutorial/assets/docker-compose.yml
wget -O $WORKING_DIR/Dockerfile https://raw.githubusercontent.com/JoakimSundman/caddy-https-tutorial/main/caddy-tutorial/assets/Dockerfile
wget -O $WORKING_DIR/site/index.html https://raw.githubusercontent.com/JoakimSundman/caddy-https-tutorial/main/caddy-tutorial/assets/html/index.html
wget -O $ASSETS_DIR/checker/checker.py https://raw.githubusercontent.com/JoakimSundman/caddy-https-tutorial/main/caddy-tutorial/assets/checker/checker.py
wget -O $ASSETS_DIR/checker/Dockerfile https://raw.githubusercontent.com/JoakimSundman/caddy-https-tutorial/main/caddy-tutorial/assets/checker/Dockerfile
wget -O $ASSETS_DIR/checker/domains/test1.com https://raw.githubusercontent.com/JoakimSundman/caddy-https-tutorial/main/caddy-tutorial/assets/checker/domains/test1.com
wget -O $ASSETS_DIR/checker/domains/test2.net https://raw.githubusercontent.com/JoakimSundman/caddy-https-tutorial/main/caddy-tutorial/assets/checker/domains/test2.net

echo "127.0.0.1    test1.com" >> /etc/hosts
echo "127.0.0.1    test2.net" >> /etc/hosts
echo "127.0.0.1    test3.com" >> /etc/hosts

# Move user into working directory for scenario
cd $WORKING_DIR

clear