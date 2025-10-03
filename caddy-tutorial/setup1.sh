#!/bin/bash

WORKING_DIR="/root/caddy"
ASSETS_DIR="/root/assets"

# Copy files from /root/assets to /root/caddy
cp $ASSETS_DIR/Dockerfile $WORKING_DIR/
cp $ASSETS_DIR/docker-compose.yml $WORKING_DIR/
cp -r $ASSETS_DIR/html/* $WORKING_DIR/html/