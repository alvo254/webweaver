#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

sudo apt install nginx nodejs npm -y

sudo cp -r /tmp/react-app/* /var/www/html/
sudo systemctl start nginx
sudo systemctl enable nginx