#!/bin/bash

WORKING_DIR="/root/caddy"
ASSETS_DIR="/root/assets"

echo "Setting up working directory at $WORKING_DIR (Ubuntu base)"

# Install netcat for security endpoint
apt update > /dev/null 2>&1
apt install -y netcat > /dev/null 2>&1

# Create working directory and html directory for webapp
mkdir -p $WORKING_DIR/html

# Copy all prepared assets from the scenario source into the working directory
cp $ASSETS_DIR/Dockerfile $WORKING_DIR/
cp $ASSETS_DIR/docker-compose.yml $WORKING_DIR/
cp $ASSETS_DIR/html/index.html $WORKING_DIR/html/

# Move user into working directory for scenario
cd $WORKING_DIR

echo "Setup complete! All files are in $WORKING_DIR"